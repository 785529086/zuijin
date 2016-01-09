//
//  AppDelegate.m
//  UI20_网易首页
//
//  Created by dllo on 16/1/8.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SecendVC.h"
#import "ThirdVC.h"
#import "FiveVC.h"
#import "FourVC.h"

@interface AppDelegate ()

@property (nonatomic, retain) UITabBarController *tb;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor grayColor];
    [self.window makeKeyAndVisible];
    [self createTabBarController];
    
    return YES;
}

- (void)createTabBarController {

    self.tb = [[UITabBarController alloc]init];
    self.window.rootViewController = self.tb;
    [self createTabBarSubViewControllers];
    
}

- (void)createTabBarSubViewControllers {

    
    ViewController *vcOfFirst = [[ViewController alloc]init];
    UINavigationController *naviOfFirst = [[UINavigationController alloc]initWithRootViewController:vcOfFirst];
    naviOfFirst.navigationBar.barTintColor = [UIColor redColor];
    vcOfFirst.navigationItem.title = @"網易";
    
    vcOfFirst.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"新闻" image:[UIImage imageNamed:@"new"] tag:100];
    
    
    SecendVC *vcOfSecend = [[SecendVC alloc]init];
    UINavigationController *naviOfSecend = [[UINavigationController alloc]initWithRootViewController:vcOfSecend];
    vcOfSecend.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"阅读" image:[UIImage imageNamed:@"read"] tag:200];
    
    
    
    ThirdVC *vcOfThird = [[ThirdVC alloc]init];
    UINavigationController *naviOfThird = [[UINavigationController alloc]initWithRootViewController:vcOfThird];
    vcOfThird.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"视听" image:[UIImage imageNamed:@"listen"] tag:300];
    
    FourVC *vcOfFour = [[FourVC alloc]init];
    UINavigationController *naviOfFour = [[UINavigationController alloc]initWithRootViewController:vcOfFour];
    vcOfFour.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"话题" image:[UIImage imageNamed:@"talk"] tag:400];
    
    FiveVC *vcOfFive = [[FiveVC alloc]init];
    UINavigationController *naviOfFive = [[UINavigationController alloc]initWithRootViewController:vcOfFive];
    vcOfFive.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我" image:[UIImage imageNamed:@"me"] tag:500];
    

    self.tb.viewControllers = @[naviOfFirst,naviOfSecend,naviOfThird,naviOfFour,naviOfFive];



}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
