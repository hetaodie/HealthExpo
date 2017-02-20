//
//  ForgetPassWordSource.m
//  HealthExpo
//
//  Created by weixu on 2017/2/12.
//  Copyright © 2017年 AllWantsLab. All rights reserved.
//

#import "ForgetPassWordSource.h"
#import "HENetTask.h"
#import "NSString+MD5.h"

@implementation ForgetPassWordSource

- (void)forgetPasswordWithPhoneNum:(NSString *)phone andkey1:(NSString *)key1 andkey2:(NSString *)key2{
    NSString *path = [NSString stringWithFormat:@"/mobile/staffPasswordForgot.action?username=%@&key1=%@&key2=%@", phone, key1,key2];
    
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:path];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onForgetPassword:)]) {
            [weakSelf.delegate onForgetPassword:[responseObject objectForKey:@"password"]];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onForgetPassworderrer)]) {
            [weakSelf.delegate onForgetPassworderrer];
        }
    };
    
    [task runInMethod:HE_GET];
}

@end
