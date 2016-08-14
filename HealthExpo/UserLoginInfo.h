//
//  userLoginInfo.h
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/14.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserLoginInfo : NSObject
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *passWord;
@property (nonatomic, strong) NSString *pwmPassWord;
@property (nonatomic, strong) NSString *uid;

@end
