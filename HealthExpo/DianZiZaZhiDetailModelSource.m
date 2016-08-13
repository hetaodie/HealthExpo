//
//  DianZiZaZhiDetailModelSource.m
//  TestAFNetWorking
//
//  Created by hzzhanyawei on 16/8/10.
//  Copyright © 2016年 hzzhanyawei. All rights reserved.
//

#import "DianZiZaZhiDetailModelSource.h"
#import "HENetTask.h"

@implementation DianZiZaZhiDetailModelSource
- (void)getDianZiZaZhiDetailWithID:(NSString *)cID{
    NSString *urlPath = [NSString stringWithFormat:@"/mobile/getContentDetail.action?cid=%@", cID];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(getDianZiZaZhiDetailSuccess:)]) {
            [weakSelf.delegate getDianZiZaZhiDetailSuccess:responseObject];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(getDianZiZaZhiDetailFailed)]) {
            [weakSelf.delegate getDianZiZaZhiDetailFailed];
        }
    };
    
    [task runInMethod:HE_GET];
}

- (void)getDianZiZaZhiDetailListWithID:(NSString *)cID{
    NSString *urlPath = [NSString stringWithFormat:@"/mobile/getContentList.action?catid=%@", cID];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(getDianZiZaZhiDetailListSuccess:)]) {
            [weakSelf.delegate getDianZiZaZhiDetailListSuccess:responseObject];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(getDianZiZaZhiDetailListFailed)]) {
            [weakSelf.delegate getDianZiZaZhiDetailListFailed];
        }
    };
    
    [task runInMethod:HE_GET];
}
@end
