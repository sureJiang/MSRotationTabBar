//
//  AppDelegate.m
//  MSRotationTabBar
//
//  Created by JZJ on 2018/9/24.
//  Copyright © 2018年 JZJ. All rights reserved.
//

#import "AppDelegate.h"
#import "MSTabbarViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    MSTabbarViewController* rootViewController = [MSTabbarViewController new];
    rootViewController.view.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = rootViewController;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
