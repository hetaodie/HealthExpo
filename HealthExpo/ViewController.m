//
//  ViewController.m
//  HealthExpo
//
//  Created by Weixu on 16/6/22.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "ViewController.h"
#import "HomePageViewController.h"
#import "PhoneViewController.h"
#import "ContactsViewController.h"
#import "CheckInViewController.h"
#import "LoginViewController.h"


@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITabBar *bottomView;
@property (strong, nonatomic) IBOutlet UITabBarItem *firstTabBar;
@property (strong, nonatomic) IBOutlet UITabBarItem *secondTabBar;
@property (strong, nonatomic) IBOutlet UITabBarItem *thirdTabBar;
@property (strong, nonatomic) IBOutlet UITabBarItem *fourthTabBar;
@property (strong, nonatomic) IBOutlet UITabBarItem *fifthTabBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTabBar];
    [self adjustViewControllers];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)createTabBar{
    self.firstTabBar = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"shouye"] selectedImage:[UIImage imageNamed:@"shouye2"]];
    self.secondTabBar = [[UITabBarItem alloc] initWithTitle:@"电话" image:[UIImage imageNamed:@"dianhua"] selectedImage:[UIImage imageNamed:@"dianhua2"]];
    self.thirdTabBar = [[UITabBarItem alloc] initWithTitle:@"通讯录" image:[UIImage imageNamed:@"tongxunlu"] selectedImage:[UIImage imageNamed:@"tongxunlu2"]];
    self.fourthTabBar = [[UITabBarItem alloc] initWithTitle:@"签到" image:[UIImage imageNamed:@"qiandao"] selectedImage:[UIImage imageNamed:@"qiandao2"]];
    self.fifthTabBar = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"wode"] selectedImage:[UIImage imageNamed:@"wode2"]];
}

- (void)adjustViewControllers{
    HomePageViewController *hopageVC = [[HomePageViewController alloc] initWithNibName:@"HomePageViewController" bundle:nil];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:hopageVC];
    nav1.tabBarItem = self.firstTabBar;
    
    PhoneViewController *phoneVC = [[PhoneViewController alloc] initWithNibName:@"PhoneViewController" bundle:nil];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:phoneVC];
    nav2.tabBarItem = self.secondTabBar;
    
    ContactsViewController *contactsVC = [[ContactsViewController alloc] initWithNibName:@"ContactsViewController" bundle:nil];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:contactsVC];
    nav3.tabBarItem = self.thirdTabBar;
    
    CheckInViewController *checkInVC = [[CheckInViewController alloc] initWithNibName:@"CheckInViewController" bundle:nil];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:checkInVC];
    nav4.tabBarItem = self.fourthTabBar;
    
    LoginViewController *loginVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:loginVC];
    nav5.tabBarItem = self.fifthTabBar;
    
    self.viewControllers = [NSArray arrayWithObjects:nav1, nav2, nav3, nav4, nav5, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
