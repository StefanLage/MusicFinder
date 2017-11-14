//
//  MFSong.m
//  MusicFinder
//
//  Created by Stefan Lage on 13/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import "MFSong.h"

@implementation MFSong

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"artistId"]
        || [propertyName isEqualToString:@"collectionId"]
        || [propertyName isEqualToString:@"trackId"]
        || [propertyName isEqualToString:@"collectionPrice"]
        || [propertyName isEqualToString:@"trackPrice"]
        || [propertyName isEqualToString:@"discCount"]
        || [propertyName isEqualToString:@"discNumber"]
        || [propertyName isEqualToString:@"trackCount"]
        || [propertyName isEqualToString:@"trackNumber"]
        || [propertyName isEqualToString:@"trackTimeMillis"]
        || [propertyName isEqualToString:@"isStreamable"]){
        return YES;
    }
    return NO;
}

@end
