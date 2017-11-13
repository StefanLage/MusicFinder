//
//  MFStringFormatter.m
//  MusicFinder
//
//  Created by Stefan Lage on 12/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import "MFStringFormatter.h"

@implementation MFStringFormatter

+ (NSString *) URLWithDomain:(NSString *)domain withEndPoint:(NSString *)endPoint{
    return [NSString stringWithFormat:@"%@/%@", domain, endPoint];
}

@end
