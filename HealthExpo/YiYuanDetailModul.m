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
#import "MingYiObject.h"

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
    object.picUrl = aDic[@"picurl"];

    return object;

}

- (void)getMingYIListWithID:(NSInteger)aid{
    NSString *urlPath = [NSString stringWithFormat:@"/mobile/getContentList2.action?cid=%ld",(long)aid];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, NSArray *responseObject) {
        NSLog(@"%@", responseObject);
        NSArray  *array = [self getMingYiListFromArray:responseObject];
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetMingYIListSeccess:)]) {
            [weakSelf.delegate onGetMingYIListSeccess:array];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetMingYIListError)]) {
            [weakSelf.delegate onGetMingYIListError];
        }
    };
    
    [task runInMethod:HE_GET];
    
}

- (NSArray *)getMingYiListFromArray:(NSArray *)aArray{
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSDictionary  *aDic in aArray) {
        MingYiObject  *object = [[MingYiObject alloc] init];
        object.id    = [aDic[@"id"] integerValue];
        
        object.zhicheng = aDic[@"stitle"];
        object.picUrl = aDic[@"picurl"];
        object.shanchang = aDic[@"content2"];
        object.title =aDic[@"title"];
        [array addObject:object];
    }
    
    return array;
}
@end
