//
//  MFConstants.m
//  MusicFinder
//
//  Created by Stefan Lage on 12/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import "MFConstants.h"

// API ENDPOINTS
NSString * const BaseUri = @"https://itunes.apple.com";
NSString * const SearchEndpoint = @"search";

// HTTP HEADERS KEYS
NSString * const AcceptKey = @"Accept";
NSString * const AcceptValue = @"application/json";

NSString * const HttpGet = @"GET";

// GET - SEARCH PARAMETERS
NSString * const ParamMediaKey = @"media";
NSString * const ParamMediaValue = @"music";
NSString * const ParamTermKey = @"term";

// JSON KEYS
NSString * const SearchEndpoint_ResultNestedKey = @"results";

// SEARCHSONGS CONSTANTS
NSString * const SearchSongs_Title = @"Songs";
NSString * const SearchSongs_PlaceHolder = @"Enter an Artist, Album or track name";
