//
//  MFSearchSongsViewModelTests.m
//  MusicFinderTests
//
//  Created by Stefan Lage on 14/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MFApiClient.h"
#import "MFSong.h"
#import "MFSearchSongsViewModel.h"
#import <ReactiveObjC/ReactiveObjC.h>

#pragma mark - Mock MFSong

@interface MFSongMock : MFSong
-(instancetype) initWithTrackName:(NSString *)name;
@end

@implementation MFSongMock
-(instancetype) initWithTrackName:(NSString *)name{
    self = [super init];
    if (self){
        self.trackName = [name copy];
    }
    return self;
}
@end

#pragma mark - Mock MFApiClient
@interface MFApiClientMock : MFApiClient
@end

@implementation MFApiClientMock

- (void)searchFor:(nonnull NSString *)terms completion:(nonnull void (^)(RACSignal * _Nullable response))handler{
    NSArray <MFSongMock*> *mockSongs = @[
                                         [[MFSongMock alloc] initWithTrackName:@"Yellow submarine"],
                                         [[MFSongMock alloc] initWithTrackName:@"Imagine"]
                                         ];
    handler([RACSignal return:mockSongs]);
}

@end

@interface MFSearchSongsViewModelTests : XCTestCase

@property (nonatomic, strong) MFApiClientMock *mockApiClient;

@end

@implementation MFSearchSongsViewModelTests

- (void)setUp {
    [super setUp];
    self.mockApiClient = [[MFApiClientMock alloc] init];
}

- (void)tearDown {
    self.mockApiClient = nil;
    [super tearDown];
}

@end
