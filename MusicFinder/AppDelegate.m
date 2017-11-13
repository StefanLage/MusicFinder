//
//  AppDelegate.m
//  MusicFinder
//
//  Created by Stefan Lage on 12/11/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

#import "AppDelegate.h"
#import "MFApiClient.h"

@interface AppDelegate ()
@property (nonatomic, strong) UINavigationController *navigationController;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:[UIViewController new]];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
