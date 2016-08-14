//
//  LoginModelSource.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/12.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "LoginModelSource.h"
#import "HENetTask.h"
#import "NSString+MD5.h"

@implementation LoginModelSource

- (void)loginWithUserName:(NSString *)userName andPwd:(NSString *)pwd{
    NSString *key = [userName stringByAppendingString:@"gytx@#$.com"];
    NSString *url= [NSString stringWithFormat:@"http://202.75.210.180//applogin.php?pwd=%@&phone=%@&key=%@", pwd, userName, key.MD5];
    HENetTask *task = [[HENetTask alloc] initWithTotalUrlString:url];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(loginSuccess:)]) {
            [weakSelf.delegate loginSuccess:responseObject];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(loginFailed)]) {
            [weakSelf.delegate loginFailed];
        }
    };
    
    [task runInMethod:HE_POST];
}

@end
