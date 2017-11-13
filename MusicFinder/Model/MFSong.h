//
//  MFSong.h
//  MusicFinder
//
//  Created by Stefan Lage on 13/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import <CoreGraphics/CGBase.h>

@interface MFSong : JSONModel

@property (nonatomic) NSString <Optional> *wrapperType;
@property (nonatomic) NSString <Optional> *kind;
@property (nonatomic) NSInteger artistId;
@property (nonatomic) NSInteger collectionId;
@property (nonatomic) NSInteger trackId;
@property (nonatomic) NSString <Optional> *artistName;
@property (nonatomic) NSString <Optional> *collectionName;
@property (nonatomic) NSString <Optional> *trackName;
@property (nonatomic) NSString <Optional> *collectionCensoredName;
@property (nonatomic) NSString <Optional> *trackCensoredName;
@property (nonatomic) NSString <Optional> *artistViewUrl;
@property (nonatomic) NSString <Optional> *collectionViewUrl;
@property (nonatomic) NSString <Optional> *trackViewUrl;
@property (nonatomic) NSString <Optional> *previewUrl;
@property (nonatomic) NSString <Optional> *artworkUrl30;
@property (nonatomic) NSString <Optional> *artworkUrl60;
@property (nonatomic) NSString <Optional> *artworkUrl100;
@property (nonatomic) CGFloat collectionPrice;
@property (nonatomic) CGFloat trackPrice;
@property (nonatomic) NSDate <Optional> *releaseDate;
@property (nonatomic) NSString <Optional> *collectionExplicitness;
@property (nonatomic) NSString <Optional> *trackExplicitness;
@property (nonatomic) NSInteger discCount;
@property (nonatomic) NSInteger discNumber;
@property (nonatomic) NSInteger trackCount;
@property (nonatomic) NSInteger trackNumber;
@property (nonatomic) NSInteger trackTimeMillis;
@property (nonatomic) NSString <Optional> *country;
@property (nonatomic) NSString <Optional> *currency;
@property (nonatomic) NSString <Optional> *primaryGenreName;
@property (nonatomic) BOOL isStreamable;

@end
