//
//  SearchModul.m
//  HealthExpo
//
//  Created by Weixu on 16/8/15.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "SearchModul.h"
#import "HENetTask.h"
#import "SearchObject.h"

@implementation SearchModul

- (void)seachText:(NSString *)aText{
    NSString *urlPath = [NSString stringWithFormat:@"/mobile/contentSearch.action?keyword=%@",aText];
    urlPath =  [urlPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    HENetTask *task = [[HENetTask alloc] initWithUrlString:urlPath];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, NSArray *responseObject) {
        NSLog(@"%@", responseObject);
        NSArray *array = [self getSearchArrayFromArray:responseObject];
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onSearchSuccess:)]) {
            [weakSelf.delegate onSearchSuccess:array];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onSearchError)]) {
            [weakSelf.delegate onSearchError];
        }
    };
    
    [task runInMethod:HE_GET];
}

- (NSArray *)getSearchArrayFromArray:(NSArray *)aArray{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (NSDictionary *aDic in aArray) {
        SearchObject *object = [[SearchObject alloc] init];
        object.title = aDic[@"title"];
        object.id = [aDic[@"id"] integerValue];
        
        object.searchtype = [aDic[@"stype"] intValue];
        [array addObject:object];
    }
    return array;
}
@end
