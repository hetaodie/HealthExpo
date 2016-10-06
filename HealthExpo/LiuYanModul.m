//
//  LiuYanModul.m
//  HealthExpo
//
//  Created by Weixu on 16/8/11.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "LiuYanModul.h"
#import "HENetTask.h"

@implementation LiuYanModul

- (void)getLiyanList:(NSInteger)cid{
    NSString *urlPath = [NSString stringWithFormat:@"/mobile/getCommentInfoList.action?cid=%ld",cid];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, NSArray *responseObject) {
        NSLog(@"%@", responseObject);
        NSMutableArray *array = [self getListLiuYanForArray:responseObject];

        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetLiyanListSeccess:)]) {
            [weakSelf.delegate onGetLiyanListSeccess:array];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetLiyanListError)]) {
            [weakSelf.delegate onGetLiyanListError];
        }
    };
    
    [task runInMethod:HE_GET];
}

- (void)setjibingLiuYan:(LiuYanObject *)aObject{
    NSString *urlPath =[NSString stringWithFormat:@"/mobile/newCommentInfo.action?cid=%ld&username=%@&phone=%@&content=%@",(long)aObject.id,aObject.username,aObject.phone,aObject.content];
    
    NSString *urlPathUtf = [urlPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPathUtf];
//    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        NSLog(@"%@", responseObject);

    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
 
    };
    
    [task runInMethod:HE_GET];
}

- (void)cexiaoLiuYan:(LiuYanObject *)aObject{
    NSString *urlPath =[NSString stringWithFormat:@"/mobile/delCommentInfo.action?cmid=%ld",(long)aObject.id];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
//    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        NSLog(@"%@", responseObject);
        if (self.delegate && [self.delegate respondsToSelector:@selector(oncexiaoSeccess)]) {
            [self.delegate oncexiaoSeccess];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(oncexiaoError)]) {
            [self.delegate oncexiaoError];
        }
    };
    
    [task runInMethod:HE_GET];
}

- (void)liuYanReply:(LiuYanObject *)aObject{
    NSString *urlPath = @"/mobile/replyCommentInfo.action?cmid=29&username=13588001234&phone=11111111&content=32323232";
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
//    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        NSLog(@"%@", responseObject);
        //        JiBingDetailObject *object = [self getDetailObjectFromDictionary:responseObject];
        //        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetJiBingDetailSeccess:)]) {
        //            [weakSelf.delegate onGetJiBingDetailSeccess:object];
        //        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        //        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetJiBingDetailError)]) {
        //            [weakSelf.delegate onGetJiBingDetailError];
        //        }
    };
    
    [task runInMethod:HE_GET];
}

- (NSMutableArray *)getListLiuYanForArray:(NSArray *)aArray{
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in aArray){
        LiuYanObject *object = [[LiuYanObject alloc] init];
        object.id    = [dic[@"id"] integerValue];
        object.username = dic[@"username"];
        object.dateLong = [dic[@"createdDate"] longLongValue];
        object.phone = dic[@"phone"];
        object.content = dic[@"content"];
        [array addObject:object];
    }
    return array;
}
@end
