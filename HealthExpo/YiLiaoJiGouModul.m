//
//  JiBingModul.m
//  HealthExpo
//
//  Created by Weixu on 16/8/10.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "YiLiaoJiGouModul.h"
#import "HENetTask.h"
#import "ClassifyObject.h"
#import "DiQunObject.h"
#import "JiGouRightObject.h"


@implementation YiLiaoJiGouModul
- (void)getDiQu{
    NSString *urlPath = @"/mobile/getCategory.action?catid=8";
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, NSArray *responseObject) {
        NSLog(@"%@", responseObject);
        NSMutableArray *array = [self getArrayWithResponstObject:responseObject];
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetDiQuSeccess:)]) {
            [weakSelf.delegate onGetDiQuSeccess:array];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetDiQuError)]) {
            [weakSelf.delegate onGetDiQuError];
        }
    };
    
    [task runInMethod:HE_GET];
}

- (void)getKeShiFenLei{
    NSString *urlPath = @"/mobile/getCategory.action?catid=9";
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, NSArray *responseObject) {
        NSLog(@"%@", responseObject);
        NSMutableArray *array = [self getArrayWithResponstObject:responseObject];
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetKeShiFenLei:)]) {
            [weakSelf.delegate onGetKeShiFenLei:array];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetKeShiFenLeiError)]) {
            [weakSelf.delegate onGetKeShiFenLeiError];
        }
    };
    
    [task runInMethod:HE_GET];
}

- (void)getDiQuDetail:(DiQunObject *)aObject index:(NSInteger)aIndex{
    NSString *urlPath = [NSString stringWithFormat:@"/mobile/getContentList.action?catid=%ld",(long)aObject.id];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, NSArray *responseObject) {
        NSLog(@"%@", responseObject);
        NSMutableArray *array = [self getYiyuanArrayWithResponstObject:responseObject];
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetDiQuDetailSeccess:index:)]) {
            [weakSelf.delegate onGetDiQuDetailSeccess:array index:aIndex];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetDiQuDetailErrorindex:)]) {
            [weakSelf.delegate onGetDiQuDetailErrorindex:aIndex];
        }
    };
    
    [task runInMethod:HE_GET];

}

- (void)getKeShiFenLeiDetail:(ClassifyObject *)aObject index:(NSInteger)aIndex{
    NSString *urlPath = [NSString stringWithFormat:@"/mobile/getContentList1.action?catid=%ld",(long)aObject.id];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, NSArray *responseObject) {
        NSLog(@"%@", responseObject);
        NSMutableArray *array = [self getYiyuanArrayWithResponstObject:responseObject];
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetKeShiFenLeiDetailSeccess:index:)]) {
            [weakSelf.delegate onGetKeShiFenLeiDetailSeccess:array index:aIndex];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetKeShiFenLeiDetailErrorindex:)]) {
            [weakSelf.delegate onGetKeShiFenLeiDetailErrorindex:aIndex];
        }
    };
    
    [task runInMethod:HE_GET];
}


- (NSMutableArray *)getArrayWithResponstObject:(NSArray *)aArray{
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in aArray) {
        DiQunObject *object = [[DiQunObject alloc] init];
        object.title = dic[@"title"];
        object.id    = [dic[@"id"] integerValue];
        object.pid   = [dic[@"pid"] integerValue];
        [array addObject:object];
    }
    return array;
}


- (NSMutableArray *)getYiyuanArrayWithResponstObject:(NSArray *)aArray{
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in aArray) {
        JiGouRightObject *object = [[JiGouRightObject alloc] init];
        object.title = dic[@"title"];
        object.dizhi = dic[@"content2"];
        object.dengji = dic[@"content1"];
        object.dianhua = dic[@"phone"];
        
        object.id    = [dic[@"id"] integerValue];
        object.pid   = [dic[@"pid"] integerValue];
        [array addObject:object];
    }
    return array;
}

@end
