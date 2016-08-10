//
//  CooperateModelSource.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/10.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "CooperateModelSource.h"
#import "HENetTask.h"

@implementation CooperateModelSource
- (void)getCooperateData{
    NSString *urlPath = @"/mobile/getContentDetail.action?cid=5";
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(getCooperateDataSuccess:)]) {
            [weakSelf.delegate getCooperateDataSuccess:responseObject];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(getCooperateDataFailed)]) {
            [weakSelf.delegate getCooperateDataFailed];
        }
    };
    
    [task runInMethod:HE_GET];
}
@end
