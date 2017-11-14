//
//  MFViewModelServices.m
//  MusicFinder
//
//  Created by Stefan Lage on 14/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import "MFViewModelServices.h"

@interface MFViewModelServicesImpl()

@property (nonatomic, strong) UINavigationController *navigationController;

@end

@implementation MFViewModelServicesImpl

#pragma mark - Lifecycle

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController{
    self = [super init];
    if (self){
        _navigationController = navigationController;
    }
    return self;
}

#pragma mark - VM navigation

- (void) pushViewModel:(id)viewModel{
    id viewController;
    [self.navigationController pushViewController:viewController
                                         animated:YES];
}

@end
