//
//  RegisterModelSource.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/12.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "RegisterModelSource.h"
#import "HENetTask.h"

@implementation RegisterModelSource
- (void)registerWithPhoneNum:(NSString *)phone andPwd:(NSString *)pwd{
    NSString *path = [NSString stringWithFormat:@"/mobile/registerStaff.action?username=%@&password=%@", phone, pwd];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:path];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
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
@end
