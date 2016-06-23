//
//  ViewController.m
//  HealthExpo
//
//  Created by Weixu on 16/6/22.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"

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
    LoginViewController *loginVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    loginVC.tabBarItem = self.firstTabBar;
    RegisterViewController *registerVC = [[RegisterViewController alloc] initWithNibName:@"RegisterViewController" bundle:nil];
    registerVC.tabBarItem = self.secondTabBar;
    
    self.viewControllers = [NSArray arrayWithObjects:loginVC, loginVC, registerVC, registerVC, loginVC, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
