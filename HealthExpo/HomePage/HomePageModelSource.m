//
//  HomePageModelSource.m
//  HealthExpo
//
//  Created by zhanyawei on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "HomePageModelSource.h"
#import "HENetTask.h"
#import "HomePageNewsItem.h"
#import "NSDate+String.h"
#import "SpeakerMessageItem.h"

@interface HomePageModelSource()
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation HomePageModelSource

- (void)getHomePageNews{
    HENetTask *task = [[HENetTask alloc] initWithUrlString:@"/mobile/getContentList.action?catid=1"];
//    HENetTask *task = [[HENetTask alloc] initWithUrlString:@"/mobile/getContentList.action?top=1"];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *array = [self itemsArrayFromJsonArray:responseObject];
        weakSelf.dataArray = array;
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(getHomePageNewsSuccess:)]) {
            [weakSelf.delegate getHomePageNewsSuccess:array];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(getHomePageNewsFailed)]) {
            [self.delegate getHomePageNewsFailed];
        }
    };
    
    [task runInMethod:HE_GET];
}

- (void)getSpeakerMessage{
    HENetTask *task1 = [[HENetTask alloc] initWithUrlString:@"mobile/getContentDetail.action?cid=1"];
    __weak __typeof(self) weakSelf = self;
    task1.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        SpeakerMessageItem *item = [self speakerMessageItemFromResponse:responseObject];
        if ([weakSelf.delegate respondsToSelector:@selector(getSpearkMessageSuccess:)]) {
            [weakSelf.delegate getSpearkMessageSuccess:item];
        }
    };
    
    task1.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if ([weakSelf respondsToSelector:@selector(getSpearkMessageFailed)]) {
            [self.delegate getSpearkMessageFailed];
        }
    };
    
    [task1 runInMethod:HE_GET];
}

- (NSArray *)getDataArray{
    return _dataArray;
}

- (SpeakerMessageItem *)speakerMessageItemFromResponse:(NSDictionary *)responseDict{
    SpeakerMessageItem *item = [[SpeakerMessageItem alloc] init];
    item.catID = [responseDict[@"catid"] integerValue];
    item.cmpID = [responseDict[@"cmpid"] integerValue];
    item.contentText = responseDict[@"contenttext"];
    item.contentText = [NSDate stringFromTimeInterval:[responseDict[@"createdDate"] doubleValue]];
    item.ID = [responseDict[@"id"] integerValue];
    item.isShow = [responseDict[@"isshow"] boolValue];
    item.orderNum = [responseDict[@"ordernum"] integerValue];
    item.phone = responseDict[@"phone"];
    item.pYear = [responseDict[@"pyeare"] integerValue];
    item.showName = responseDict[@"showname"];
    item.sTitle = responseDict[@"stitle"];
    item.sType = [responseDict[@"stype"] integerValue];
    item.templateCode = responseDict[@"templatecode"];
    item.title = responseDict[@"title"];
    item.viewNum = [responseDict[@"viewnum"] integerValue];
    
    return item;
}

- (NSArray *)itemsArrayFromJsonArray:(NSArray *)jsonArray{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in jsonArray) {
        HomePageNewsItem *item = [[HomePageNewsItem alloc] init];
        NSDictionary *cateDict = dict[@"category"];
        item.category = [self categoryDataFromDict:cateDict];
        item.catID = [dict[@"catid"] integerValue];
        item.cmpID = [dict[@"cmpid"] integerValue];
        item.contentText = dict[@"contenttext"];
        item.createDate = [NSDate stringFromTimeInterval: [dict[@"createdDate"] doubleValue]];
        item.ID = [dict[@"id"] integerValue];
        item.isShow = [dict[@"isshow"] boolValue];
        item.orderNum = [dict[@"ordernum"] integerValue];
        item.phone = dict[@"phone"];
        item.picUrl = dict[@"picurl"];
        item.pYear = [dict[@"pyear"] integerValue];
        item.showName = dict[@"showname"];
        item.sTitle = dict[@"stitle"];
        item.stype = [dict[@"stype"] integerValue];
        item.templateCode = dict[@"templatecode"];
        item.title = dict[@"title"];
        item.viewNum = [dict[@"viewnum"] integerValue];
        
        [array addObject:item];
    }
    
    return array;
}

- (HEDataCategory *)categoryDataFromDict:(NSDictionary *)dict{
    HEDataCategory *category = [[HEDataCategory alloc] init];
    category.cmpID = [dict[@"cmpid"] integerValue];
    category.createdDate = [NSDate stringFromTimeInterval:[dict[@"createdDate"] doubleValue]];
    category.ID = [dict[@"id"] integerValue];
    category.isPerm = [dict[@"isperm"] boolValue];
    category.isShow = [dict[@"isshow"] boolValue];
    category.orderNum = [dict[@"ordernum"] integerValue];
    category.permName = dict[@"permName"];
    category.pID = [dict[@"pid"] integerValue];
    category.showName = dict[@"showname"];
    category.stype = [dict[@"stype"] integerValue];
    category.templateCode = dict[@"templatecode"];
    category.title = dict[@"title"];
    
    return category;
}
@end
