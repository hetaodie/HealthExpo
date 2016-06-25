//
//  LoginManager.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/6/24.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "LoginManager.h"
//登陆token
static const NSString *HELoginTokenKey = @"HELoginTokenKey";
@implementation LoginManager

+ (instancetype)shareManager{
    static LoginManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[LoginManager alloc] init];
    });
    return manager;
}

- (void)loginWithUserName:(NSString *)userName andPassword:(NSString *)password{
    //TODO 发送账号和密码进行校验，返回后发送通知，成功则在本地保存token
}

- (void)checkLoginKeyAvailable{
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:HELoginTokenKey];
    //TODO 发送token进行校验，返回后发送通知
}

@end
