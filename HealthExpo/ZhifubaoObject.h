//
//  ZhifubaoObject.h
//  HealthExpo
//
//  Created by weixu on 16/11/21.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZhifubaoObject : NSObject
@property (nonatomic,strong) NSString *price;  // 原始价格
@property (nonatomic, strong) NSString *wPrice; //优惠后的价格
@end
