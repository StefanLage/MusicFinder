//
//  MFSongDetailsViewModel.h
//  MusicFinder
//
//  Created by Stefan Lage on 14/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "MFViewModelServices.h"

@class MFSong;

@interface MFSongDetailsViewModel : NSObject

@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSURL *albumArtworkUrl;
@property (nonatomic, strong, readonly) NSString *artistName;
@property (nonatomic, strong, readonly) NSString *trackName;
@property (nonatomic, strong, readonly) NSString *albumName;

- (instancetype)initWithServices:(id<MFViewModelServices>)services song:(MFSong *)song;

@end
