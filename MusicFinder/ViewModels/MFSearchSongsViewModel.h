//
//  MFSearchSongsViewModel.h
//  MusicFinder
//
//  Created by Stefan Lage on 13/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

@class MFApiClient;

@interface MFSearchSongsViewModel : NSObject

@property (nonatomic, readonly) RACSignal *songsObserver;

- (instancetype)initWithApiClient:(MFApiClient *)apiClient;

@end
