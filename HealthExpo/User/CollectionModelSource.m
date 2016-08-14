//
//  CollectionModelSource.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/14.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "CollectionModelSource.h"
#import "HENetTask.h"
#import "UserInfoManager.h"

@implementation CollectionModelSource
- (void)getCollectionRequest{
    UserLoginInfo *info = [[UserInfoManager shareManager] getUserLoginInfo];
    NSString *path = [NSString stringWithFormat:@"/mobile/getCollectInfoList.action?username=15088618617"];//, info.userName];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:path];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *array = [self convertResponseObject:responseObject];
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetCollectionSuccess:)]) {
            [weakSelf.delegate onGetCollectionSuccess:array];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetCollectionFailed)]) {
            [weakSelf.delegate onGetCollectionFailed];
        }
    };
    
    [task runInMethod:HE_GET];
}

- (NSArray *)convertResponseObject:(NSArray *)arr{
    NSMutableArray *retArray = [NSMutableArray array];
    for (NSDictionary *dict in arr) {
        [retArray addObject:dict[@"ctitle"]];
    }
    return retArray;
}
@end
