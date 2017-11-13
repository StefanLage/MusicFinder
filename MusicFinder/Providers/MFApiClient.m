//
//  MFApiClient.m
//  MusicFinder
//
//  Created by Stefan Lage on 12/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import "MFApiClient.h"
#import <AFNetworking/AFNetworking.h>
#import "MFConstants.h"
#import "NSURL+ApiFormat.h"
#import "MFStringFormatter.h"

#pragma mark - Network Service
@protocol CNetworkingService
- (void) get:(nonnull NSString *)endPoint params:(NSDictionary *)params completion:(nonnull void (^)(NSURLResponse * _Nullable response, id _Nullable responseObject, NSError * _Nonnull error))handler;
@end

#pragma mark - MFApiClient

@interface MFApiClient() <CNetworkingService>
@property (nonatomic, strong, readonly) AFURLSessionManager *sessionManager;
@end


@implementation MFApiClient

#pragma mark - Lifecycle

- (instancetype) init{
    self = [super init];
    if (self){
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _sessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    }
    return self;
}

#pragma mark - CNetworkingService implementation

- (void) get:(nonnull NSString *)endPoint params:(NSDictionary *)params completion:(nonnull void (^)(NSURLResponse * _Nullable response, id _Nullable responseObject, NSError * _Nonnull error))handler{
    NSString * urlString = [MFStringFormatter URLWithDomain:BaseUri withEndPoint:endPoint];
    NSURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:HttpGet
                                                                          URLString:urlString
                                                                         parameters:params
                                                                              error:nil];
    NSURLSessionDataTask *task = [self.sessionManager dataTaskWithRequest:request
                                                        completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
                                                            handler(response, responseObject, error);
                                                        }];
    [task resume];
}

#pragma mark - Public

- (void)searchFor:(nonnull NSString *)terms completion:(nonnull void (^)(id _Nullable response))handler{
    NSDictionary *params = @{
                             ParamMediaKey: ParamMediaValue,
                             ParamTermKey: terms
                             };
    [self get:SearchEndpoint params:params completion:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nonnull error) {
        if (responseObject){
            handler(responseObject);
        }
        else{
            // should hanlde error itself -> using log service or something
            handler(nil);
        }
    }];
}
@end
