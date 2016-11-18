//
//  CallDetailModelSource.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/14.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "UserModelSource.h"
#import "HENetTask.h"
#import "UserInfoManager.h"
#import "NSString+MD5.h"


@implementation UserModelSource
- (void)getCallNum{
    UserLoginInfo *info = [[UserInfoManager shareManager] getUserLoginInfo];
    NSString *sign = [NSString stringWithFormat:@"%@%@",info.uid,@"gytx@#$.com"];
    NSString *url = [NSString stringWithFormat:@"http://mob.hgvoip.com:8899/search_balance?pwd=%@&uid=%@&sign=%@", info.passWord.MD5, info.uid,sign.MD5];
    HENetTask *task = [[HENetTask alloc] initWithTotalUrlString:url];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onCallNumSuccess:)]) {
            [weakSelf.delegate onCallNumSuccess:responseObject];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onCallNumFailed)]) {
            [weakSelf.delegate onCallNumFailed];
        }
    };
    
    [task runInMethod:HE_GET];
}

- (void)getShouChangNum{
    UserLoginInfo *info = [[UserInfoManager shareManager] getUserLoginInfo];
    NSString *path = [NSString stringWithFormat:@"/mobile/getCollectInfoCount.action?username=%@", info.userName];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:path];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onShouChangNumSuccess:)]) {
            [weakSelf.delegate onShouChangNumSuccess:nil];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onShouChangNumFailed)]) {
            [weakSelf.delegate onShouChangNumFailed];
        }
    };
    
    [task runInMethod:HE_GET];}
@end
