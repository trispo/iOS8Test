//
//  AppDelegate.m
//  iOS8Test
//
//  Created by Gunnar Herzog on 26/06/14.
//  Copyright (c) 2014 KF Interactive. All rights reserved.
//

#import "AppDelegate.h"
#import <MSDynamicsDrawerViewController/MSDynamicsDrawerViewController.h>

@interface AppDelegate ()

@property (nonatomic, strong) UIViewController *rootViewController;

@end

@implementation AppDelegate
            

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIStoryboard *splitViewStoryboard = [UIStoryboard storyboardWithName:@"SplitView" bundle:nil];
    UIViewController *splitViewController = [splitViewStoryboard instantiateInitialViewController];
    splitViewController.title = @"SplitView";

    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        UIStoryboard *tabBarStoryboard = [UIStoryboard storyboardWithName:@"TabBar" bundle:nil];
        UITabBarController *tabBarController = [tabBarStoryboard instantiateInitialViewController];
        NSMutableArray *viewControllers = [tabBarController.viewControllers mutableCopy];
        [viewControllers insertObject:splitViewController atIndex:0];
        tabBarController.viewControllers = viewControllers;

        self.rootViewController = tabBarController;
    }
    else
    {
        UIStoryboard *sideBarStoryboard = [UIStoryboard storyboardWithName:@"SideBar" bundle:nil];
        MSDynamicsDrawerViewController *dynamicsDrawerViewController = [sideBarStoryboard instantiateInitialViewController];

        dynamicsDrawerViewController.gravityMagnitude = 7.0;
        dynamicsDrawerViewController.paneDragRequiresScreenEdgePan = YES;
        dynamicsDrawerViewController.screenEdgePanCancelsConflictingGestures = NO;

        UIViewController *drawerViewController = [dynamicsDrawerViewController.storyboard instantiateViewControllerWithIdentifier:@"SideBarViewController"];
        [dynamicsDrawerViewController setDrawerViewController:drawerViewController forDirection:MSDynamicsDrawerDirectionLeft];

        [dynamicsDrawerViewController setPaneViewController:splitViewController];

        self.rootViewController = dynamicsDrawerViewController;
    }

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.rootViewController;
    [self.window makeKeyAndVisible];

    return YES;
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
