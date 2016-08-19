//
//  NewsDetailModelSource.m
//  TestAFNetWorking
//
//  Created by hzzhanyawei on 16/8/10.
//  Copyright © 2016年 hzzhanyawei. All rights reserved.
//

#import "NewsDetailModelSource.h"
#import "HENetTask.h"
#import "UserInfoManager.h"


@implementation NewsDetailModelSource
- (void)getNewsDetailModelSource:(NSString *)cID{
    NSString *urlPath = [NSString stringWithFormat:@"/mobile/getContentDetail.action?cid=%@", cID];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(getNewsDetailModelSourceSuccess:)]) {
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

- (void)collectionNewsWithID:(NSString *)cID{
    UserLoginInfo *info = [[UserInfoManager shareManager] getUserLoginInfo];
    NSString *urlPath = [NSString stringWithFormat:@"/mobile/newCollectInfo.action?cid=%@&username=%@", cID, info.userName];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(collectionNewsSuccess:)]) {
            [weakSelf.delegate collectionNewsSuccess:responseObject];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(collectionNewsFailed)]) {
            [weakSelf.delegate collectionNewsFailed];
        }
    };
    
    [task runInMethod:HE_GET];
}

@end
