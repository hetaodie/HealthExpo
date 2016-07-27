//
//  DianZiZaZhiModelSource.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/7/27.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "DianZiZaZhiModelSource.h"
#import "HENetTask.h"

@implementation DianZiZaZhiModelSource
- (void)getDianZiZaZhiData{
    HENetTask *task = [[HENetTask alloc] initWithUrlString:@"mobile/getContentList.action?catid=1"];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
         weakSelf.dataArray = responseObject;
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(getDianZiZaZhiDataSuccess:)]) {
            [weakSelf.delegate getDianZiZaZhiDataSuccess:responseObject];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(getDianZiZaZhiDataFailed)]) {
            [self.delegate getDianZiZaZhiDataFailed];
        }
    };
    
    [task runInMethod:HE_GET];
}
@end
