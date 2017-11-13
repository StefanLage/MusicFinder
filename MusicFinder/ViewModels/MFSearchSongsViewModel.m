//
//  MFSearchSongsViewModel.m
//  MusicFinder
//
//  Created by Stefan Lage on 13/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import "MFSearchSongsViewModel.h"
#import "MFSong.h"

@interface MFSearchSongsViewModel()

@property (nonatomic, strong, readonly) MFApiClient * apiClient;
@property (nonatomic, strong) NSArray<MFSong*> * songs;

@end

@implementation MFSearchSongsViewModel

#pragma mark - Lifecycle

- (instancetype)initWithApiClient:(MFApiClient *)apiClient{
    self = [super init];
    if (self){
        _apiClient = apiClient;
        _songsObserver = [RACObserve(self, songs) mapReplace:@(YES)];
    }
    return self;
}

@end
