//
//  CheckInModelSource.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/14.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "CheckInModelSource.h"
#import "HENetTask.h"
#import "NSString+MD5.h"
#import "UserLoginInfo.h"
#import "UserInfoManager.h"



@implementation CheckInModelSource



- (void)onCheckInRequst{
    UserLoginInfo *info = [[UserInfoManager shareManager] getUserLoginInfo];
    NSString *key = [info.uid stringByAppendingString:@"gytx@#$.com"];
    NSString *url= [NSString stringWithFormat:@"http://biz.scback.cn/checkin.php?uid=%@&pwd=%@&code=%@", info.uid, info.pwmPassWord, key.MD5];
    HENetTask *task = [[HENetTask alloc] initWithTotalUrlString:url];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onCheckInSuccess:)]) {
            [weakSelf.delegate onCheckInSuccess:responseObject];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onCheckInFailed)]) {
            [weakSelf.delegate onCheckInFailed];
        }
    };
    
    [task runInMethod:HE_POST];
}
@end
