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

- (void)getDianXingRenQunDetail:(ClassifyObject *)aObject index:(NSInteger)aIndex{
    NSString *urlPath = [NSString stringWithFormat:@"/mobile/getContentList.action?catid=%ld",(long)aObject.id];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, NSArray *responseObject) {
        NSLog(@"%@", responseObject);
        NSMutableArray *array = [self getArrayWithResponstObject:responseObject];
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetDianXingRenQunDetailSeccess:index:)]) {
            [weakSelf.delegate onGetDianXingRenQunDetailSeccess:array index:aIndex];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetDianXingRenQunDetailErrorindex:)]) {
            [weakSelf.delegate onGetDianXingRenQunDetailErrorindex:aIndex];
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
        NSMutableArray *array = [self getArrayWithResponstObject:responseObject];
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
//        object.selectImageUrl = dic[@"selectImageUrl"];
//        object.defaultImageUrl = dic[@"defaultImageUrl"];
//        
//        object.defaultImage = [self getImageWithTitle:object.title andSelect:NO];
//        object.selectImage = [self getImageWithTitle:object.title andSelect:YES];
        [array addObject:object];
    }
    return array;
}


//- (UIImage *)getImageWithTitle:(NSString *)aTitle andSelect:(BOOL)aSelect{
//    
//    UIImage *image = nil;
//    if (aSelect) {
//        if ([aTitle isEqualToString:@"上班族"]) {
//            image = [UIImage imageNamed:@"shangbanzu-1"];
//        }
//        else if ([aTitle isEqualToString:@"男性"]) {
//            image = [UIImage imageNamed:@"nanxing2"];
//        }
//        else if ([aTitle isEqualToString:@"女性"]) {
//            image = [UIImage imageNamed:@"nvxing2"];
//        }
//        else if ([aTitle isEqualToString:@"老人"]) {
//            image = [UIImage imageNamed:@"laoren2"];
//        }
//        else if ([aTitle isEqualToString:@"儿童"]) {
//            image = [UIImage imageNamed:@"ertong2"];
//        }
//        else{
//            image = [UIImage imageNamed:@"nanxing2"];
//        }
//    }
//    else{
//        if ([aTitle isEqualToString:@"上班族"]) {
//            image = [UIImage imageNamed:@"shangbanzu"];
//        }
//        else if ([aTitle isEqualToString:@"男性"]) {
//            image = [UIImage imageNamed:@"nanxing"];
//        }
//        else if ([aTitle isEqualToString:@"女性"]) {
//            image = [UIImage imageNamed:@"nvxing"];
//        }
//        else if ([aTitle isEqualToString:@"老人"]) {
//            image = [UIImage imageNamed:@"laoren"];
//        }
//        else if ([aTitle isEqualToString:@"儿童"]) {
//            image = [UIImage imageNamed:@"ertong"];
//        }
//        else{
//            image = [UIImage imageNamed:@"nanxing"];
//        }
//    }
//    
//    return image;
//}

@end
