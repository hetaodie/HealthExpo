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
#define HEUserCover @"HEUserCover"
#define HEUserName @"HEUserName"
#define HEUserPhoneNum @"HEUserPhoneNum"
#define HEUserGender @"HEUserGender"
#define HEUserBirthday @"HEUserBirthday"
#define HEUserEmail @"HEUserEmail"
#define HEUserAddress @"HEUserAddress"

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
//        self.userInfo = [self UserInfoFromUserDefaults];
        //for test
        _userInfo = [[UserInfo alloc] init];
        _userInfo.cover = [UIImage imageNamed:@"touxiang2"];
        _userInfo.userName = @"测试";
        _userInfo.phone = @"15657113218";
        _userInfo.gender = @"男";
        _userInfo.birthday = @"2016年6月26日";
        _userInfo.email = @"XXXXXX@163.com";
        _userInfo.address = @"杭州市滨江区网商路599号";        
    }
    return self;
}


#pragma mark 登陆
- (void)loginWithUserName:(NSString *)userName andPassword:(NSString *)password{
    //TODO 发送账号和密码进行校验，返回后发送通知，成功则在本地保存token 获取userinfo
}

- (void)checkLoginKeyAvailable{
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:HELoginTokenKey];
    //TODO 发送token进行校验，返回后发送通知
    
    [[NSNotificationCenter defaultCenter] postNotificationName:HECheck_Token_failed_Notifocation object:nil];
}

#pragma mark - UserInfo
- (UserInfo *)UserInfoFromUserDefaults{
    UserInfo *info = [[UserInfo alloc] init];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *imageData = [defaults objectForKey:HEUserCover];
    info.cover = [UIImage imageWithData:imageData];
    info.userName = [defaults objectForKey:HEUserName];
    info.phone = [defaults objectForKey:HEUserPhoneNum];
    info.birthday = [defaults objectForKey:HEUserBirthday];
    info.gender = [defaults objectForKey:HEUserGender];
    info.email = [defaults objectForKey:HEUserEmail];
    info.address = [defaults objectForKey:HEUserAddress];
    return info;
}

- (void)saveEditedUserInfo:(UserInfo *)info{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *imageData = UIImageJPEGRepresentation(info.cover, 100);
    [defaults setObject:imageData forKey:HEUserCover];
    [defaults setObject:info.userName forKey:HEUserName];
    [defaults setObject:info.phone forKey:HEUserPhoneNum];
    [defaults setObject:info.gender forKey:HEUserGender];
    [defaults setObject:info.birthday forKey:HEUserBirthday];
    [defaults setObject:info.email forKey:HEUserEmail];
    [defaults setObject:info.address forKey:HEUserAddress];

    [defaults synchronize];
}

@end
