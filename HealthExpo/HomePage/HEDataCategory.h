//
//  HEDataCategory.h
//  HealthExpo
//
//  Created by zhanyawei on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HEDataCategory : NSObject
@property (nonatomic, assign) NSInteger cmpID;
@property (nonatomic, strong) NSString *createdDate;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) BOOL isPerm;
@property (nonatomic, assign) BOOL isShow;
@property (nonatomic, assign) NSInteger orderNum;
@property (nonatomic, strong) NSString *permName;
@property (nonatomic, assign) NSInteger pID;
@property (nonatomic, strong) NSString *showName;
@property (nonatomic, assign) NSInteger stype;
@property (nonatomic, strong) NSString *templateCode;
@property (nonatomic, strong) NSString *title;

@end
