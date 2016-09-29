//
//  RechargeModelSource.h
//  HealthExpo
//
//  Created by NetEase-zyw on 16/9/24.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PhoneServices) {
    PhoneServices_CM,//移动
    PhoneServices_CU,//联通
    PhoneServices_CT,//电信
    PhoneServices_None,//未知
};

@protocol RechargeModelSourceDelegate <NSObject>

- (void)onRechargeSuccess:(NSString *)tip;
- (void)onRechargeFailed;

@end

@interface RechargeModelSource : NSObject
@property (nonatomic, weak) id<RechargeModelSourceDelegate>delegate;

- (void)onRechargeWithCardNum:(NSString *)num andCardPassword:(NSString *)password;

- (PhoneServices)isMobileNumberType:(NSString *)mobileNum;
@end
