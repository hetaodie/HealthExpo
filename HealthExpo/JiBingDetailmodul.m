//
//  JiBingDetailmodul.m
//  HealthExpo
//
//  Created by Weixu on 16/8/11.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "JiBingDetailmodul.h"

#import "HENetTask.h"
#import "ClassifyObject.h"

@implementation JiBingDetailmodul

- (void)getJiBingDetailWithCid:(NSInteger)aCid{
    NSString *urlPath = [NSString stringWithFormat:@"/mobile/getContentDetail.action?cid=%ld",(long)aCid];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        NSLog(@"%@", responseObject);
        JiBingDetailObject *object = [self getDetailObjectFromDictionary:responseObject];
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetJiBingDetailSeccess:)]) {
            [weakSelf.delegate onGetJiBingDetailSeccess:object];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onGetJiBingDetailError)]) {
            [weakSelf.delegate onGetJiBingDetailError];
        }
    };
    
    [task runInMethod:HE_GET];
}


- (JiBingDetailObject *)getDetailObjectFromDictionary:(NSDictionary *)aDic{
    JiBingDetailObject *object = [[JiBingDetailObject alloc] init];
    object.title = aDic[@"title"];
    object.id = [aDic[@"id"] integerValue];
    object.catid = [aDic[@"catid"] integerValue];
    object.contenttext = aDic[@"contenttext"];
    
    return object;
}
@end
