//
//  CustomTabBarController.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/6/25.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "CustomTabBarController.h"
#import "LoginViewController.h"
#import "HENotificationKey.h"
@interface CustomTabBarController()
@property (nonatomic, assign) BOOL isLogin;
@property (nonatomic, strong) UINavigationController *loginNaVc;
@end

@implementation CustomTabBarController
+ (instancetype)getInstance{
    static CustomTabBarController *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CustomTabBarController alloc] init];
    });
    return instance;
}

- (void)clickAtIndex:(NSInteger)index{
    if (index >= self.viewControllers.count) {
        [self setSelectedIndex:0];
    }
    [self setSelectedIndex:index];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSuccess:) name:HELogin_Success_Notification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logout:) name:HELogout_Notification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkTokenSuccess:) name:HECheck_Token_Success_Notification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkTokenFailed:) name:HECheck_Token_failed_Notifocation object:nil];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification Handler
- (void)loginSuccess:(NSNotification *)aNotification{
    self.isLogin = YES;
    [self hiddenLoginViewController];
}

- (void)logout:(NSNotification *)aNotification{
    self.isLogin = NO;
    [self showLoginViewController];
}

- (void)checkTokenSuccess:(NSNotification *)aNotification{
    self.isLogin = YES;
    [self hiddenLoginViewController];
}
- (void)checkTokenFailed:(NSNotification *)aNotification{
    self.isLogin = NO;
    [self showLoginViewController];
}

- (void)showLoginViewController{
    if (!self.loginNaVc) {
        LoginViewController *logVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
        self.loginNaVc = [[UINavigationController alloc] initWithRootViewController:logVC];    }
    
    [self presentViewController:self.loginNaVc animated:YES completion:^{}];

}

- (void)hiddenLoginViewController{
    if(self.loginNaVc){
        [self.loginNaVc dismissViewControllerAnimated:YES completion:^{ }];
    }
}
@end
