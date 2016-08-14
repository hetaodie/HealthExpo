//
//  RegisterModelSource.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/12.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "RegisterModelSource.h"
#import "HENetTask.h"
#import "NSString+MD5.h"

@implementation RegisterModelSource
- (void)registerWithPhoneNum:(NSString *)phone andPwd:(NSString *)pwd{
    NSString *path = [NSString stringWithFormat:@"/mobile/registerStaff.action?username=%@&password=%@", phone, pwd];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:path];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onRegisterSuccess:)]) {
            [weakSelf.delegate onRegisterSuccess:responseObject];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onRegisterFailed)]) {
            [weakSelf.delegate onRegisterFailed];
        }
    };
    
    [task runInMethod:HE_GET];
}

- (void)registerICallWithPhoneNum:(NSString *)phone andPwd:(NSString *)pwd{
    NSString *key = [phone stringByAppendingString:@"gytx@#$.com"];
    NSString *url= [NSString stringWithFormat:@"http://202.75.210.180/appreg.php?pwd=%@&phone=%@&key=%@&agentid=1", pwd, phone, key.MD5];
    HENetTask *task = [[HENetTask alloc] initWithTotalUrlString:url];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onRegisterICallSuccess:)]) {
            [weakSelf.delegate onRegisterICallSuccess:responseObject];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onRegisterICallFailed)]) {
            [weakSelf.delegate onRegisterICallFailed];
        }
    };
    
    [task runInMethod:HE_POST];
}

@end
