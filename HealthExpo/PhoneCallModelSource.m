//
//  PhoneCallModelSource.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/14.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "PhoneCallModelSource.h"
#import "HENetTask.h"
#import "NSString+MD5.h"
#import "UserInfoManager.h"

@implementation PhoneCallModelSource

- (void)onPhoneCallWithPhoneNum:(NSString *)num{

    UserLoginInfo *info = [[UserInfoManager shareManager] getUserLoginInfo];
    NSString *key = [info.uid stringByAppendingString:@"gytx@#$.com"];
    NSString *url = [NSString stringWithFormat:@"http://mob.scback.cn:8899/call?sign=%@&called=%@&uid=%@&v=1.0&pv=Iphone&pwd=%@&echo=1", key.MD5, num, info.uid, info.pwmPassWord];
    HENetTask *task = [[HENetTask alloc] initWithTotalUrlString:url];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onPhoneCallSuccess:)]) {
            [weakSelf.delegate onPhoneCallSuccess:responseObject];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onPhoneCallFailed)]) {
            [weakSelf.delegate onPhoneCallFailed];
        }
    };
    
    [task runInMethod:HE_GET];


}
@end
