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
//    NSString *key = [phone stringByAppendingString:@"gytx@#$.com"];
//    NSString *url= [NSString stringWithFormat:@"http://biz.scback.cn/appreg.php?phone=%@&pwd=%@&key=%@&agentid=1", phone, pwd, key.MD5];
    HENetTask *task = [[HENetTask alloc] initWithTotalUrlString:@"http://biz.scback.cn/appreg.php?phone=18871430809&pwd=333333&key=603bb67294391ffe043b56603a89ec58&agentid=1"];
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
    
    [task runInMethod:HE_GET];
}

@end
