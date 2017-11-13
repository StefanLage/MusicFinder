//
//  MFStringFormatter.h
//  MusicFinder
//
//  Created by Stefan Lage on 12/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MFStringFormatter : NSObject

/**
 *  Return URL request format (e.g domain/endPoint)
 */
+ (NSString *) URLWithDomain:(NSString *)domain withEndPoint:(NSString *)endPoint;

@end
