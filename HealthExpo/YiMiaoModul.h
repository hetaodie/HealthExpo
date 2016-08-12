//
//  YiMiaoModul.h
//  HealthExpo
//
//  Created by Weixu on 16/8/12.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YiMiaoDetailObject.h"

@protocol YiMiaoModulDelegate <NSObject>

@optional
- (void)onGetYIMiaoTimeListSeccess:(NSArray *)aArray;

- (void)onGetYIMiaoTimeListError;



- (void)onGetYIMiaoListSeccess:(NSArray *)aArray;

- (void)onGetYIMiaoListError;

- (void)onGetyimiaoDetailSeccess:(YiMiaoDetailObject *)aObject;

- (void)onGetyimiaoDetailError;

@end

@interface YiMiaoModul : NSObject
@property (nonatomic, weak) id <YiMiaoModulDelegate>delegate;
- (void)getYIMiaoTimeList;

- (void)getYImiaoList:(NSInteger)aId;

- (void)getyimiaoDetail:(NSInteger)aId;
@end
