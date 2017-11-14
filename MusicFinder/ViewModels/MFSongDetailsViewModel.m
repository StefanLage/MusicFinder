//
//  MFSongDetailsViewModel.m
//  MusicFinder
//
//  Created by Stefan Lage on 14/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import "MFSongDetailsViewModel.h"
#import "MFSong.h"
#import "MFConstants.h"

@interface MFSongDetailsViewModel()

@property (nonatomic, weak) id<MFViewModelServices> services;
@property (nonatomic, strong) MFSong *song;
@property (nonatomic, strong, readwrite) NSString *title;
@property (nonatomic, strong, readwrite) NSURL *albumArtworkUrl;
@property (nonatomic, strong, readwrite) NSString *artistName;
@property (nonatomic, strong, readwrite) NSString *trackName;
@property (nonatomic, strong, readwrite) NSString *albumName;

@end

@implementation MFSongDetailsViewModel

- (instancetype)initWithServices:(id<MFViewModelServices>)services song:(MFSong *)song{
    self = [self init];
    if(self){
        _services = services;
        _song = song;

        _title = SongDetails_Title;
        _albumArtworkUrl = _song.artworkUrl100 ? [NSURL URLWithString:_song.artworkUrl100] : nil;
        _artistName = _song.artistName ? _song.artistName : SongDetails_DefaultValue;
        _trackName = _song.trackName ? _song.trackName : SongDetails_DefaultValue;
        _albumName = _song.collectionName ? _song.collectionName : SongDetails_DefaultValue;
    }
    return self;
}



@end
