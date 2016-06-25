//
//  LoginManager.h
//  HealthExpo
//
//  Created by hzzhanyawei on 16/6/24.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginManager : NSObject

+ (instancetype)shareManager;
/**
 *  通过用户名和账号登陆
 *
 *  @param userName 用户名
 *  @param password 账号
 */
- (void)loginWithUserName:(NSString *)userName andPassword:(NSString *)password;

/**
 *  校验登陆token是否失效。
 */
- (void)checkLoginKeyAvailable;
@end
