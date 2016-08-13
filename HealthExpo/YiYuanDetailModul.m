//
//  YiYuanDetailModul.m
//  HealthExpo
//
//  Created by Weixu on 16/8/13.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "YiYuanDetailModul.h"
#import "HENetTask.h"
#import "YiyuanDetailObject.h"

@implementation YiYuanDetailModul

- (void)getYiYuanDetailWithID:(NSInteger)aid{
    NSString *urlPath = [NSString stringWithFormat:@"/mobile/getContentDetail.action?cid=%ld",(long)aid];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        NSLog(@"%@", responseObject);
        YiyuanDetailObject *object = [self getYiyuanDetailObjectFromDictionary:responseObject];
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetYiYuanDetailSeccess:)]) {
            [weakSelf.delegate onGetYiYuanDetailSeccess:object];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetYiYuanDetailError)]) {
            [weakSelf.delegate onGetYiYuanDetailError];
        }
    };
    
    [task runInMethod:HE_GET];
}

- (YiyuanDetailObject *)getYiyuanDetailObjectFromDictionary:(NSDictionary *)aDic{
    YiyuanDetailObject *object = [[YiyuanDetailObject alloc] init];
    object.title = aDic[@"title"];
    object.dizhi = aDic[@"content2"];
    object.dengji = aDic[@"content1"];
    object.dianhua = aDic[@"phone"];
    object.desc = aDic[@"contenttext"];
    
    object.id = [aDic[@"id"] integerValue];
    object.pid = [aDic[@"pid"] integerValue];
    object.zhuobiao1 = [aDic[@"content3"] floatValue];
    object.zhuobiao2 = [aDic[@"content4"] floatValue];
    object.type = aDic[@"content5"];
    object.menzhen = aDic[@"content6"];

    return object;

}

- (void)getMingYIListWithID:(NSInteger)aid{
    NSString *urlPath = [NSString stringWithFormat:@"/mobile/getContentList.action?catid=11"];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        NSLog(@"%@", responseObject);
//        YiyuanDetailObject *object = [self getYiyuanDetailObjectFromDictionary:responseObject];
//        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetYiYuanDetailSeccess:)]) {
//            [weakSelf.delegate onGetYiYuanDetailSeccess:object];
//        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
//        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetYiYuanDetailError)]) {
//            [weakSelf.delegate onGetYiYuanDetailError];
//        }
    };
    
    [task runInMethod:HE_GET];
    
}
@end
