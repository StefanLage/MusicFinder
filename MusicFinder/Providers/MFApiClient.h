//
//  MFApiClient.h
//  MusicFinder
//
//  Created by Stefan Lage on 12/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

@interface MFApiClient : NSObject

- (void)searchFor:(nonnull NSString *)terms completion:(nonnull void (^)(RACSignal * _Nullable response))handler;

@end
