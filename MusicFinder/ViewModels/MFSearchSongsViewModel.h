//
//  MFSearchSongsViewModel.h
//  MusicFinder
//
//  Created by Stefan Lage on 13/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "MFViewModelServices.h"

@class MFApiClient, MFSong;

@interface MFSearchSongsViewModel : NSObject

@property (nonatomic, readonly) RACSignal *songsObserver;
/**
 * Define view controller's title
 */
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *searchBarPlaceHolder;
@property (nonatomic, strong, readonly) NSString *searchTerms;
@property (nonatomic, strong, readonly) NSIndexPath *selectedIndexSong;

- (instancetype)initWithApiClient:(MFApiClient *)apiClient;
- (instancetype)initWithServices:(id<MFViewModelServices>)services apiClient:(MFApiClient *)apiClient;

/**
 * Return the number of songs
 */
- (NSUInteger)songsInSection:(NSInteger)section;
/**
 * Get the song's title at indexpath
 */
- (NSString *)songName:(NSIndexPath *)indexPath;

@end
