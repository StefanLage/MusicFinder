//
//  AppDelegate.m
//  MusicFinder
//
//  Created by Stefan Lage on 12/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import "AppDelegate.h"
#import "MFApiClient.h"
#import "MFSearchSongsController.h"
#import "MFSearchSongsViewModel.h"

@interface AppDelegate ()
@property (nonatomic, strong) UINavigationController *navigationController;
@property (strong, nonatomic) MFSearchSongsViewModel *searchSongsViewModel;
@property (strong, nonatomic) MFViewModelServicesImpl *viewModelServices;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.navigationController = [UINavigationController new];
    if ([AppDelegate isTesting]){
        // No need to create VM and VC while doing Unit Tests here
        // Would be different for UI Unit tests though
        self.navigationController = [[UINavigationController alloc] initWithRootViewController:[UIViewController new]];
    }
    else{
        _viewModelServices = [[MFViewModelServicesImpl alloc] initWithNavigationController:self.navigationController];
        // Create view model, injecting store
        _searchSongsViewModel = [[MFSearchSongsViewModel alloc] initWithServices:self.viewModelServices
                                                                       apiClient:[MFApiClient new]];
        // Create view controller, injecting view model
        MFSearchSongsController *searchSongsViewController = [[MFSearchSongsController alloc] initWithViewModel:self.searchSongsViewModel];
        [self.navigationController pushViewController:searchSongsViewController
                                             animated:YES];
    }
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

+ (BOOL) isTesting
{
    NSDictionary* environment = [[NSProcessInfo processInfo] environment];
    return [environment objectForKey:@"TEST"] != nil;
}

@end
