//
//  UITableView+RAC.h
//  MusicFinder
//
//  Created by Stefan Lage on 14/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RACSignal;

@interface UITableView (RAC) <UITableViewDelegate>

- (RACSignal *)rac_selectSignal;

@end
