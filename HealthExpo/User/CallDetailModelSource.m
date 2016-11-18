//
//  CallDetailModelSource.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/14.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "CallDetailModelSource.h"
#import "HENetTask.h"
#import "UserInfoManager.h"

@implementation CallDetailModelSource
- (void)getCallDetail{
    UserLoginInfo *info = [[UserInfoManager shareManager] getUserLoginInfo];
    NSString *url = [NSString stringWithFormat:@"http://mob.hgvoip.com:8899/mobile_calllog?phone=%@&uid=%@&start=1&lines=30", info.userName, info.uid];
    HENetTask *task = [[HENetTask alloc] initWithTotalUrlString:url];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onCallDetailSuccess:)]) {
            [weakSelf.delegate onCallDetailSuccess:responseObject];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onCallDetailFailed)]) {
            [weakSelf.delegate onCallDetailFailed];
        }
    };
    
    [task runInMethod:HE_GET];
}
@end
