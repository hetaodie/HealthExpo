//
//  AppDelegate.m
//  HealthExpo
//
//  Created by Weixu on 16/6/22.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "AppDelegate.h"
#import "HomePageViewController.h"
#import "PhoneViewController.h"
#import "ContactsViewController.h"
#import "CheckInViewController.h"
#import "LoginViewController.h"
#import "CustomTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.tabBarController = [[CustomTabBarController alloc] init];
    [self createUItabbarContainViewControllers:self.tabBarController];
    self.window.rootViewController  = self.tabBarController;
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


#pragma mark - private Func 
- (void)createUItabbarContainViewControllers:(UITabBarController *)tbController{
    HomePageViewController *hopageVC = [[HomePageViewController alloc] initWithNibName:@"HomePageViewController" bundle:nil];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:hopageVC];
    nav1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"shouye"] selectedImage:[UIImage imageNamed:@"shouye2"]];
    
    PhoneViewController *phoneVC = [[PhoneViewController alloc] initWithNibName:@"PhoneViewController" bundle:nil];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:phoneVC];
    nav2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"电话" image:[UIImage imageNamed:@"dianhua"] selectedImage:[UIImage imageNamed:@"dianhua2"]];
    
    ContactsViewController *contactsVC = [[ContactsViewController alloc] initWithNibName:@"ContactsViewController" bundle:nil];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:contactsVC];
    nav3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"通讯录" image:[UIImage imageNamed:@"tongxunlu"] selectedImage:[UIImage imageNamed:@"tongxunlu2"]];
    
    CheckInViewController *checkInVC = [[CheckInViewController alloc] initWithNibName:@"CheckInViewController" bundle:nil];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:checkInVC];
    nav4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"签到" image:[UIImage imageNamed:@"qiandao"] selectedImage:[UIImage imageNamed:@"qiandao2"]];
    
    LoginViewController *loginVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:loginVC];
    nav5.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"wode"] selectedImage:[UIImage imageNamed:@"wode2"]];
    
    tbController.viewControllers = @[nav1, nav2, nav3, nav4, nav5];
    
//    //改变tabBar 上title的颜色 和 字体大小
//    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:102/255.0 green:122/255.0 blue:143/255.0 alpha:1.0f], NSForegroundColorAttributeName, [UIFont systemFontOfSize:14], NSFontAttributeName, nil nil] forState:UIControlStateNormal];
//    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0/255.0 green:198/255.0 blue:255/255.0 alpha:1.0f], NSForegroundColorAttributeName, [UIFont systemFontOfSize:14], NSFontAttributeName,nil] forState:UIControlStateSelected];
}
@end
