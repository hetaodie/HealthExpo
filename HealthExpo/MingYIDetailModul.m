//
//  MingYIDetailModul.m
//  HealthExpo
//
//  Created by Weixu on 16/8/15.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "MingYIDetailModul.h"


@implementation MingYIDetailModul
- (void)getMingYiDetial:(NSInteger)cid{
    NSString *urlPath = [NSString stringWithFormat:@"/mobile/getContentDetail.action?cid=%ld",cid];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        NSLog(@"%@", responseObject);
        MingYiDetailObject  *object = [self getMingYiDetailFromDictionary:responseObject];
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetMingYiDetialSeccess:)]) {
            [weakSelf.delegate onGetMingYiDetialSeccess:object];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetMingYiDetialError)]) {
            [weakSelf.delegate onGetMingYiDetialError];
        }
    };
    
    [task runInMethod:HE_GET];
}


- (MingYiDetailObject *)getMingYiDetailFromDictionary:(NSDictionary *)aDic{
    MingYiDetailObject *object = [[MingYiDetailObject alloc] init];
    object.id    = [aDic[@"id"] integerValue];
    object.zhicheng = aDic[@"stitle"];
    object.picUrl = aDic[@"picurl"];
    object.shanchang = aDic[@"content2"];
    object.title =aDic[@"title"];
    object.jianjie =aDic[@"contenttext"];
    object.yiyuan = aDic[@"yiyuan"];
    return object;
}
@end
