//
//  UITableView+RAC.m
//  MusicFinder
//
//  Created by Stefan Lage on 14/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import "UITableView+RAC.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import <objc/runtime.h>

@implementation UITableView (RAC)

- (RACSignal *)rac_selectSignal{
    RACSignal *signal = objc_getAssociatedObject(self, _cmd);
    if (signal != nil){
        return signal;
    }
    signal = [[self rac_signalForSelector:@selector(tableView:didSelectRowAtIndexPath:)
                             fromProtocol:@protocol(UITableViewDelegate)]
              map:^id(RACTuple *tuple) {
                  return tuple.second;
              }];
    self.delegate = self;
    objc_setAssociatedObject(self, _cmd, signal, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return signal;
}

@end
