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

- (void)getDianZiZaZhiList{
    
    HENetTask *task = [[HENetTask alloc] initWithUrlString:@"/mobile/getCategory.action?catid=4"];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(getDianZiZaZhiListSuccess:)]) {
            [weakSelf.delegate getDianZiZaZhiListSuccess:responseObject];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(getDianZiZaZhiListFailed)]) {
            [weakSelf.delegate getDianZiZaZhiListFailed];
        }
    };
    
    [task runInMethod:HE_GET];
}

- (void)getDianZiZaZhiListWithID:(NSString *)cID{
    NSString *urlPath = [NSString stringWithFormat:@"/mobile/getContentList.action?catid=%@", cID];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(getDianZiZaZhiListWithIDSuccess:)]) {
            [weakSelf.delegate getDianZiZaZhiListWithIDSuccess:responseObject];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(getDianZiZaZhiListWithIDFailed)]) {
            [weakSelf.delegate getDianZiZaZhiListWithIDFailed];
        }
    };
    
    [task runInMethod:HE_GET];
}

@end
