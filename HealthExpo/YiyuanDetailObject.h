//
//  JiGouRightObject.h
//  HealthExpo
//
//  Created by Weixu on 16/8/13.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YiyuanDetailObject : NSObject
@property (nonatomic, copy) NSString *picUrl;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *dengji;
@property (nonatomic, copy) NSString *dizhi;
@property (nonatomic, copy) NSString *dianhua;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *menzhen;
@property (nonatomic, copy) NSString *type;

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, assign) NSInteger pid;
@property (nonatomic, assign) double zhuobiao1;
@property (nonatomic, assign) double zhuobiao2;

@end
