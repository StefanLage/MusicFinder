//
//  UISearchBar+RAC.m
//  MusicFinder
//
//  Created by Stefan Lage on 13/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import "UISearchBar+RAC.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import <objc/runtime.h>

@implementation UISearchBar (RAC)

- (RACSignal *)rac_textSignal{
    self.delegate = self;
    RACSignal *signal = objc_getAssociatedObject(self, _cmd);
    if (signal != nil){
        return signal;
    }
    signal = [[self rac_signalForSelector:@selector(searchBar:textDidChange:)
                             fromProtocol:@protocol(UISearchBarDelegate)]
              map:^id(RACTuple *tuple) {
                  return tuple.second;
              }];
    objc_setAssociatedObject(self, _cmd, signal, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return signal;
}

@end
