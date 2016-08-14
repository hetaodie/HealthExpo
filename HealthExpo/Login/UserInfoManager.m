//
//  UserInfoManager.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/6/24.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "UserInfoManager.h"
#import "HENotificationKey.h"

#define HEUserCover @"HEUserCover"
#define HEUserName @"HEUserName"
#define HEUserPhoneNum @"HEUserPhoneNum"
#define HEUserGender @"HEUserGender"
#define HEUserBirthday @"HEUserBirthday"
#define HEUserEmail @"HEUserEmail"
#define HEUserAddress @"HEUserAddress"

//登陆token
#define HELoginTokenKeyPhone @"HELoginTokenKeyPhone"
#define HELoginTokenKeyPwd @"HELoginTokenKeyPwd"
#define HELoginTokenKeyUid @"HELoginTokenKeyUid"

@interface UserInfoManager ()
//@property (nonatomic, strong) UserCenterModelSource *modelSource;
@end

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
        self.userInfo = [self userInfoFromUserDefaults];
        //for test
//        _userInfo = [[UserInfo alloc] init];
//        _userInfo.cover = [UIImage imageNamed:@"touxiang2"];
//        _userInfo.userName = @"测试";
//        _userInfo.phone = @"15657113218";
//        _userInfo.gender = @"男";
//        _userInfo.birthday = @"2016年6月26日";
//        _userInfo.email = @"XXXXXX@163.com";
//        _userInfo.address = @"杭州市滨江区网商路599号";
//        [self saveEditedUserInfo:_userInfo];
        [self initLoginKeys];
    }
    return self;
}
- (void)initLoginKeys{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *phone = [defaults objectForKey:HELoginTokenKeyPhone];
    NSString *uid = [defaults objectForKey:HELoginTokenKeyUid];
    NSString *pwd = [defaults objectForKey:HELoginTokenKeyPwd];
    
    if (!phone) {
         [defaults setObject:@"-1" forKey:HELoginTokenKeyPhone];
    }
    if (!uid) {
        [defaults setObject:@"-1" forKey:HELoginTokenKeyUid];
    }
    if (!pwd) {
        [defaults setObject:@"-1" forKey:HELoginTokenKeyPwd];
    }
    [defaults synchronize];
}

#pragma mark 登陆
- (void)registerSuccessWithUserName:(NSString *)userName andPassword:(NSString *)password andUID:(NSString *)uID{
    if (!userName || !password || !uID) {
        return;
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:userName forKey:HELoginTokenKeyPhone];
    [defaults setObject:password forKey:HELoginTokenKeyPwd];
    [defaults setObject:uID forKey:HELoginTokenKeyUid];
    [defaults synchronize];
    
    self.userInfo.phone = userName;
    self.userInfo.userName = userName;
    [self saveEditedUserInfo:self.userInfo];
}

- (void)clearLoginKeys{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"-1" forKey:HELoginTokenKeyPhone];
    [defaults setObject:@"-1" forKey:HELoginTokenKeyUid];
    [defaults setObject:@"-1" forKey:HELoginTokenKeyPwd];
  
    [defaults synchronize];

}

- (void)checkLoginKeyAvailable{
    NSString *phone = [[NSUserDefaults standardUserDefaults] objectForKey:HELoginTokenKeyPhone];
    NSString *uid = [[NSUserDefaults standardUserDefaults] objectForKey:HELoginTokenKeyUid];
    NSString *pwd = [[NSUserDefaults standardUserDefaults] objectForKey:HELoginTokenKeyPwd];
    //TODO 发送token进行校验，返回后发送通知
    if ([phone isEqualToString:@"-1"] || [pwd isEqualToString:@"-1"] || [uid isEqualToString:@"-1"]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:HECheck_Token_failed_Notifocation object:nil];
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:HECheck_Token_Success_Notification object:nil];
    }
    
}

#pragma mark - UserInfo
- (UserInfo *)userInfoFromUserDefaults{
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

- (UserLoginInfo *)getUserLoginInfo{
    UserLoginInfo *info = [[UserLoginInfo alloc] init];
    info.phone = [[NSUserDefaults standardUserDefaults] objectForKey:HELoginTokenKeyPhone];
    info.uid = [[NSUserDefaults standardUserDefaults] objectForKey:HELoginTokenKeyUid];
    info.passWord = [[NSUserDefaults standardUserDefaults] objectForKey:HELoginTokenKeyPwd];
    
    return info;
}

@end
