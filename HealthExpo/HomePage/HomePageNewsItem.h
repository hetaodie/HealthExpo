//
//  HomePageNewsItem.h
//  HealthExpo
//
//  Created by zhanyawei on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HEDataCategory.h"

@interface HomePageNewsItem : NSObject
@property (nonatomic, strong)HEDataCategory *category;
@property (nonatomic, assign) NSInteger catID;
@property (nonatomic, assign) NSInteger cmpID;
@property (nonatomic, strong) NSString *contentText;
@property (nonatomic, strong) NSString *createDate;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) BOOL isShow;
@property (nonatomic, assign) NSInteger orderNum;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, assign) NSInteger pYear;
@property (nonatomic, strong) NSString *showName;
@property (nonatomic, strong) NSString *sTitle;
@property (nonatomic, assign) NSInteger stype;
@property (nonatomic, strong) NSString *templateCode;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSInteger viewNum;
@end
