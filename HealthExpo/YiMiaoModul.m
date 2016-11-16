//
//  YiMiaoModul.m
//  HealthExpo
//
//  Created by Weixu on 16/8/12.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "YiMiaoModul.h"
#import "HENetTask.h"
#import "YiMiaoObject.h"
#import "YiMiaoDetailObject.h"

@implementation YiMiaoModul

- (void)getYIMiaoTimeList{
    NSString *urlPath = @"/mobile/getCategory.action?catid=7";
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
        NSMutableArray *array = [self getYiMiaoArrayForArray:responseObject];

        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetYIMiaoTimeListSeccess:)]) {
            [weakSelf.delegate onGetYIMiaoTimeListSeccess:array];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetYIMiaoTimeListError)]) {
            [weakSelf.delegate onGetYIMiaoTimeListError];
        }
    };
    
    [task runInMethod:HE_GET];
}

- (NSMutableArray *)getYiMiaoArrayForArray:(NSMutableArray *)aArray{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in aArray) {
        YiMiaoObject *object = [[YiMiaoObject alloc] init];
        object.title = dic[@"title"];
        object.id = [dic[@"id"] integerValue];
        [array addObject:object];
    }
    return array;
}

- (void)getYImiaoList:(NSInteger)aId{
    NSString *urlPath = [NSString stringWithFormat:@"/mobile/getContentList.action?catid=%ld",(long)aId];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
        NSMutableArray *array = [self getYiMiaoArrayForArray:responseObject];
        
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetYIMiaoListSeccess:)]) {
            [weakSelf.delegate onGetYIMiaoListSeccess:array];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetYIMiaoListError)]) {
            [weakSelf.delegate onGetYIMiaoListError];
        }
    };
    
    [task runInMethod:HE_GET];
}


- (void)getyimiaoDetail:(NSInteger)aId{
    NSString *urlPath = [NSString stringWithFormat:@"/mobile/getContentDetail.action?cid=%ld",(long)aId];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
        YiMiaoDetailObject *object = [self getYiMiaoDetialArrayForDiction:responseObject];
        
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetyimiaoDetailSeccess:)]) {
            [weakSelf.delegate onGetyimiaoDetailSeccess:object];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetyimiaoDetailError)]) {
            [weakSelf.delegate onGetyimiaoDetailError];
        }
    };
    
    [task runInMethod:HE_GET];
}


- (YiMiaoDetailObject *)getYiMiaoDetialArrayForDiction:(NSDictionary *)aDic{
    YiMiaoDetailObject *object = [[YiMiaoDetailObject alloc] init];
    object.id   = [aDic[@"id"] integerValue];
    object.title = aDic[@"title"];
    object.strCount = aDic[@"content1"];
    object.yumangJIbing = aDic[@"content2"];
    object.tishi = aDic[@"contenttext"];
    object.duixiang =aDic[@"content3"];
    
    return object;
}

@end
