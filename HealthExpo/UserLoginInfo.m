//
//  userLoginInfo.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/14.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "UserLoginInfo.h"
#import "NSString+MD5.h"

@implementation UserLoginInfo
- (NSString *)userName{
    return _phone;
}

- (NSString *)pwmPassWord{
    return [NSString get_pwd:_passWord];
}
@end
