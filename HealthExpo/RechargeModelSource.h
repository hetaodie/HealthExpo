//
//  RechargeModelSource.h
//  HealthExpo
//
//  Created by NetEase-zyw on 16/9/24.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RechargeModelSourceDelegate <NSObject>

- (void)onRechargeSuccess:(NSString *)tip;
- (void)onRechargeFailed;

@end

@interface RechargeModelSource : NSObject
@property (nonatomic, weak) id<RechargeModelSourceDelegate>delegate;

- (void)onRechargeWithCardNum:(NSString *)num andCardPassword:(NSString *)password;

@end
