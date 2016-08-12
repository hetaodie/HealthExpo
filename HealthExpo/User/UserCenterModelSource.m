//
//  UserCenterModelSource.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/12.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "UserCenterModelSource.h"
#import "HENetTask.h"

@implementation UserCenterModelSource
- (void)getUserInfoWithName:(NSString *)name{
    NSString *path = [NSString stringWithFormat:@"/mobile/getStaffDetail.action?username=%@", name];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:path];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(getUserInfoSuccess:)]) {
            [weakSelf.delegate getUserInfoSuccess:responseObject];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(getUserInfoFailed)]) {
            [weakSelf.delegate getUserInfoFailed];
        }
    };
    
    [task runInMethod:HE_GET];
}

- (void)editUserInfoWithName:(NSString *)name andEmail:(NSString *)email{
    NSString *path = [NSString stringWithFormat:@"/mobile/updateStaff.action?username=%@&email=%@", name, email];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:path];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(editUserInfoSuccess:)]) {
            [weakSelf.delegate editUserInfoSuccess:responseObject];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(editUserInfoFailed)]) {
            [weakSelf.delegate editUserInfoFailed];
        }
    };
    
    [task runInMethod:HE_GET];
}

@end
