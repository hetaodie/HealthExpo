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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginFailed:) name:HELogin_Failed_Notification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkTokenSuccess:) name:HECheck_Token_Success_Notification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkTokenFailed:) name:HECheck_Token_failed_Notifocation object:nil];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification Handler
- (void)loginSuccess:(NSNotification *)aNotification{
    self.isLogin = YES;
}

- (void)loginFailed:(NSNotification *)aNotification{
    self.isLogin = NO;
    [self showLoginViewController];
}

- (void)checkTokenSuccess:(NSNotification *)aNotification{
    self.isLogin = YES;
}
- (void)checkTokenFailed:(NSNotification *)aNotification{
    self.isLogin = NO;
    [self showLoginViewController];
}

- (void)showLoginViewController{
    LoginViewController *logVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    UINavigationController *navLogin = [[UINavigationController alloc] initWithRootViewController:logVC];
    UINavigationController *nav4 = self.viewControllers[0];
    [nav4 presentViewController:navLogin animated:YES completion:^{
        
    }];

}
@end
