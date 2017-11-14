//
//  MFApiClientTests.m
//  MusicFinderTests
//
//  Created by Stefan Lage on 12/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MFApiClient.h"

@interface MFApiClientTests : XCTestCase
@property (nonatomic, strong) MFApiClient * apiClient;
@end

@implementation MFApiClientTests

- (void)setUp {
    [super setUp];
    self.apiClient = [MFApiClient new];
}

- (void)tearDown {
    self.apiClient = nil;
    [super tearDown];
}

- (void)testGet {
    XCTestExpectation *exp = [self expectationWithDescription:@"testGet"];
    NSString *terms = @"taylor swift";
    [self.apiClient searchFor:terms completion:^(RACSignal * songs) {
        XCTAssertNotNil(songs, "testGet - we should have a response");
        [exp fulfill];
    }];

    // Wait for the API response
    [self waitForExpectationsWithTimeout:10
                                 handler:^(NSError * _Nullable error) {
                                     XCTAssertNil(error);
                                 }];
}

@end
