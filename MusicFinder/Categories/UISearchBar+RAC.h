//
//  UISearchBar+RAC.h
//  MusicFinder
//
//  Created by Stefan Lage on 13/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RACSignal;

@interface UISearchBar (RAC) <UISearchBarDelegate>

- (RACSignal *)rac_textSignal;

@end
