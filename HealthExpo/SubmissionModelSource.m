//
//  SubmissionModelSource.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/10.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "SubmissionModelSource.h"
#import "HENetTask.h"

@implementation SubmissionModelSource
- (void)getSubmissionData{
    NSString *urlPath = @"/mobile/getContentDetail.action?cid=3";
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(getSubmissionDataSuccess:)]) {
            [weakSelf.delegate getSubmissionDataSuccess:responseObject];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(getSubmissionDataFailed)]) {
            [weakSelf.delegate getSubmissionDataFailed];
        }
    };
    
    [task runInMethod:HE_GET];
}
@end
