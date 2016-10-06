//
//  JiBingBKModelSource.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/7/12.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "JiBingBKModelSource.h"
#import "HENetTask.h"

@implementation JiBingBKModelSource

- (void)getJiBingList{
    HENetTask *task1 = [[HENetTask alloc] initWithUrlString:@"mobile/getCategory.action?catid=6"];
//    __weak __typeof(self) weakSelf = self;
    task1.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
//        if ([weakSelf.delegate respondsToSelector:@selector(getSpearkMessageSuccess:)]) {
//            [weakSelf.delegate getSpearkMessageSuccess:responseObject];
//        }
    };
    
    task1.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
//        if ([weakSelf respondsToSelector:@selector(getSpearkMessageFailed)]) {
//            [self.delegate getSpearkMessageFailed];
//        }
    };
    
    [task1 runInMethod:HE_GET];
}

@end
