//
//  PhoneModelSource.m
//  TestAFNetWorking
//
//  Created by hzzhanyawei on 16/8/11.
//  Copyright © 2016年 hzzhanyawei. All rights reserved.
//

#import "PhoneModelSource.h"
#import "HENetTask.h"
#import "NSString+MD5.h"
#import "UserInfoManager.h"

@implementation PhoneModelSource
//http://biz.scback.cn/adapi.php?uid=609232&password=1864323443&code=md5(uid+gytx@#$.com)
- (void)getADBanners{
    UserLoginInfo *info = [[UserInfoManager shareManager] getUserLoginInfo];
    NSString *key = [info.uid stringByAppendingString:@"gytx@#$.com"];
    NSString *url = [NSString stringWithFormat:@"http://biz.scback.cn/adapi.php?uid=%@&password=%@&code=%@", info.uid, info.pwmPassWord, key.MD5];
    HENetTask *task = [[HENetTask alloc] initWithTotalUrlString:url];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(getADBannersSuccess:)]) {
            [weakSelf.delegate getADBannersSuccess:responseObject];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(getADBannersFailed)]) {
            [weakSelf.delegate getADBannersFailed];
        }
    };
    
    [task runInMethod:HE_GET];
}
































@end
