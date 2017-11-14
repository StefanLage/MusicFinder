//
//  MFViewModelServices.h
//  MusicFinder
//
//  Created by Stefan Lage on 14/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MFViewModelServices <NSObject>

- (void) pushViewModel:(id)viewModel;

@end

@interface MFViewModelServicesImpl : NSObject <MFViewModelServices>

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController;

@end
