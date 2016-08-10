//
//  JiBingModul.m
//  HealthExpo
//
//  Created by Weixu on 16/8/10.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "JiBingModul.h"
#import "HENetTask.h"
#import "ClassifyObject.h"


@implementation JiBingModul
- (void)getDianXingRenQun{
    NSString *urlPath = @"/mobile/getCategory.action?catid=6";
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(getNewsDetailModelSource:)]) {
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

- (void)getKeShiFenLei{

}

- (void)getDianXingRenQunDetail:(ClassifyObject *)aObject index:(NSInteger)aIndex{

}

- (void)getKeShiFenLeiDetail:(ClassifyObject *)aObject index:(NSInteger)aIndex{

}


- (NSArray *)getArrayWithResponstObject:(NSArray *)aArray{
    for (NSDictionary *dic in aArray) {
        ClassifyObject *object = [[ClassifyObject alloc] init];
        object.title = dic[@"title"];
        object.id    = [dic[@"id"] integerValue];
        object.pid   = [dic[@"pid"] integerValue];
        object.selectImageUrl = dic[@"selectImageUrl"];
        object.defaultImageUrl = dic[@"defaultImageUrl"];
    }
}

- (UIImage *)getImageWithTitle:(NSString *)aTitle andSelect:(BOOL)aSelect{
    
    UIImage *image = nil;
    if (aSelect) {
        if ([aTitle isEqualToString:@"上班族"]) {
            image = [UIImage imageNamed:@"shangbanzu-1"];
        }
        else if ([aTitle isEqualToString:@"男性"]) {
            image = [UIImage imageNamed:@"nanxing2"];
        }
        else if ([aTitle isEqualToString:@"女性"]) {
            image = [UIImage imageNamed:@"nvxing2"];
        }
        else if ([aTitle isEqualToString:@"老人"]) {
            image = [UIImage imageNamed:@"laoren2"];
        }
        else if ([aTitle isEqualToString:@"儿童"]) {
            image = [UIImage imageNamed:@"ertong2"];
        }
    }
    else{
        if ([aTitle isEqualToString:@"上班族"]) {
            image = [UIImage imageNamed:@"shangbanzu"];
        }
        else if ([aTitle isEqualToString:@"男性"]) {
            image = [UIImage imageNamed:@"nanxing"];
        }
        else if ([aTitle isEqualToString:@"女性"]) {
            image = [UIImage imageNamed:@"nvxing"];
        }
        else if ([aTitle isEqualToString:@"老人"]) {
            image = [UIImage imageNamed:@"laoren"];
        }
        else if ([aTitle isEqualToString:@"儿童"]) {
            image = [UIImage imageNamed:@"ertong"];
        }
    }
}
@end
