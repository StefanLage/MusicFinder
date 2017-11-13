//
//  MFConstants.h
//  MusicFinder
//
//  Created by Stefan Lage on 12/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import <Foundation/Foundation.h>

// API ENDPOINTS
FOUNDATION_EXPORT NSString * const BaseUri;
FOUNDATION_EXPORT NSString * const SearchEndpoint;

// HTTP HEADERS KEYS
FOUNDATION_EXPORT NSString * const AcceptKey;
FOUNDATION_EXPORT NSString * const AcceptValue;

// HTTP REQUEST TYPE
FOUNDATION_EXPORT NSString * const HttpGet;

// GET - SEARCH PARAMETERS
FOUNDATION_EXPORT NSString * const ParamMediaKey;
FOUNDATION_EXPORT NSString * const ParamMediaValue;
FOUNDATION_EXPORT NSString * const ParamTermKey;

// JSON KEYS
FOUNDATION_EXPORT NSString * const SearchEndpoint_ResultNestedKey;
