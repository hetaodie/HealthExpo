//
//  NewsDetailModelSource.m
//  TestAFNetWorking
//
//  Created by hzzhanyawei on 16/8/10.
//  Copyright © 2016年 hzzhanyawei. All rights reserved.
//

#import "NewsDetailModelSource.h"
#import "HENetTask.h"

@implementation NewsDetailModelSource
- (void)getNewsDetailModelSource:(NSString *)cID{
    NSString *urlPath = [NSString stringWithFormat:@"/mobile/getContentDetail.action?cid=%@", cID];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(getNewsDetailModelSource:)]) {
            [weakSelf.delegate getNewsDetailModelSourceSuccess:responseObject];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(getNewsDetailModelSourceFailed)]) {
            [weakSelf.delegate getNewsDetailModelSourceFailed];
        }
    };
    
    [task runInMethod:HE_GET];
}
@end
