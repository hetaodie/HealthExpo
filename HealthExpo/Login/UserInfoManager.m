//
//  UserInfoManager.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/6/24.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "UserInfoManager.h"
#import "HENotificationKey.h"
//登陆token
#define HELoginTokenKey @"HELoginTokenKey"
#define HEUserName @"HEUserName"

@implementation UserInfoManager

+ (instancetype)shareManager{
    static UserInfoManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[UserInfoManager alloc] init];
    });
    return manager;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        _userName = [defaults objectForKey:HEUserName];
    }
    return self;
}

#pragma mark 登陆
- (void)loginWithUserName:(NSString *)userName andPassword:(NSString *)password{
    //TODO 发送账号和密码进行校验，返回后发送通知，成功则在本地保存token
}

- (void)checkLoginKeyAvailable{
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:HELoginTokenKey];
    //TODO 发送token进行校验，返回后发送通知
    
    [[NSNotificationCenter defaultCenter] postNotificationName:HECheck_Token_failed_Notifocation object:nil];
}

#pragma mark - UserInfo
- (void)saveEditedUserInfo{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.userName forKey:HEUserName];

    [defaults synchronize];
}

@end
