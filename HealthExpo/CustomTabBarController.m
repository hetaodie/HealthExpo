//
//  CustomTabBarController.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/6/25.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "CustomTabBarController.h"
#import "HENotificationKey.h"

@implementation CustomTabBarController
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
    
}

- (void)loginFailed:(NSNotification *)aNotification{
    
}

- (void)checkTokenSuccess:(NSNotification *)aNotification{
    
}
- (void)checkTokenFailed:(NSNotification *)aNotification{
    [self setSelectedIndex:4];//登陆界面
}
@end
