//
//  MFSearchSongsViewModel.m
//  MusicFinder
//
//  Created by Stefan Lage on 13/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import "MFSearchSongsViewModel.h"
#import "MFApiClient.h"
#import "MFSong.h"
#import "MFConstants.h"
#import "MFSongDetailsViewModel.h"

@interface MFSearchSongsViewModel()

@property (nonatomic, strong, readonly) MFApiClient * apiClient;
@property (nonatomic, weak) id<MFViewModelServices> services;
@property (nonatomic, strong) NSArray<MFSong*> *songs;
@property (nonatomic, strong, readwrite) NSIndexPath *selectedIndexSong;
@property (nonatomic, strong, readwrite) NSString *searchTerms;

@end

@implementation MFSearchSongsViewModel

#pragma mark - Lifecycle

- (instancetype)initWithServices:(id<MFViewModelServices>)services apiClient:(MFApiClient *)apiClient{
    self = [super init];
    if(self){
        _services = services;
        _apiClient = apiClient;
        [self initialize];
    }
    return self;
}

- (void)initialize{
    _title = SearchSongs_Title;
    _searchBarPlaceHolder = SearchSongs_PlaceHolder;

    _songsObserver = [RACObserve(self, songs) mapReplace:@(YES)];
    [self observeSearchTerms];
    [self observeSelectedSong];
}

/**
 *  Observe the search terms property
 */
-(void) observeSearchTerms{
    // Observe the search terms property
    @weakify(self);
    [[[RACObserve(self, searchTerms)
       map:^RACTuple *(NSString *text) {
           // return a tuple informing about whether the term contains at least 3 chars
           // and it contain the current term we are evalutating
           return [RACTuple tupleWithObjects:@(text.length > 2), text, nil];
       }] distinctUntilChanged]
     subscribeNext:^(RACTuple *  _Nullable tuple) {
         @strongify(self);
         // send message to api service to provide a result for current terms
         BOOL isTermsLongEnough = [[tuple first] intValue];
         NSString * terms = [tuple second];
         if (isTermsLongEnough){
             // Should use a queue to make sure we don't receive a current results before a previous research
             // The issue could happen in case of bad interet connection
             [self.apiClient searchFor:terms completion:^(RACSignal * songs) {
                 dispatch_async(dispatch_get_main_queue(), ^(void){
                     // Set the value in the main thread
                     RAC(self, songs) = songs;
                 });
             }];
         }
         else{
             // Reset results
             RAC(self, songs) = [RACSignal return:nil];
         }
     }];
}

/**
 *  Observe the selected song property
 */
- (void) observeSelectedSong{
    // Observe the search terms property
    @weakify(self);
    [[RACObserve(self, selectedIndexSong)
       map:^MFSong *(NSIndexPath *indexPath) {
           @strongify(self);
           if (indexPath){
               return [self songAtIndexPath:indexPath];
           }
           return nil;
       }]
     subscribeNext:^(MFSong *  _Nullable selectedSong) {
         @strongify(self);
         if (selectedSong){
             dispatch_async(dispatch_get_main_queue(), ^(void){
             // song is not nil ? => show detail view
             MFSongDetailsViewModel *songDetailsViewModel = [[MFSongDetailsViewModel alloc] initWithServices:self.services
                                                                                                        song:selectedSong];
             [self.services pushViewModel:songDetailsViewModel];
             });
         }
     }];
}

#pragma mark - Public

- (NSUInteger)songsInSection:(NSInteger)section{
    return self.songs.count;
}

- (NSString *)songName:(NSIndexPath *)indexPath{
    MFSong *song = [self songAtIndexPath:indexPath];
    return [[song trackName] copy];
}

#pragma mark - Private

/**
 * Return the song at indexpath specified
 */
- (MFSong *)songAtIndexPath:(NSIndexPath *)indexPath{
    return self.songs[indexPath.row];
}

@end
