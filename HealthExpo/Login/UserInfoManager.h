//
//  LoginManager.h
//  HealthExpo
//
//  Created by hzzhanyawei on 16/6/24.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"
#import "UserCenterModelSource.h"
#import "UserLoginInfo.h"

@interface UserInfoManager : NSObject
@property (nonatomic, strong) UserInfo *userInfo;


+ (instancetype)shareManager;
//登陆成功存储用户信息。
- (void)registerSuccessWithUserName:(NSString *)userName andPassword:(NSString *)password andUID:(NSString *)cID;

- (void)clearLoginKeys;
/**
 *  校验登陆token是否失效。
 */
- (void)checkLoginKeyAvailable;
/**
 *  保存编辑后的userinfo
 */
- (void)saveEditedUserInfo;
/**
 *  获取userInfo
 *
 *  @return userInfo
 */
- (UserInfo *)userInfoFromUserDefaults;

- (UserLoginInfo *)getUserLoginInfo;
@end
