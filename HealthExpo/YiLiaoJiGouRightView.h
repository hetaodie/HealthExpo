//
//  JiBingBKRightView.h
//  HealthExpo
//
//  Created by Weixu on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JiGouRightObject.h"

@protocol YiLiaoJiGouRightViewDelegate <NSObject>

- (void)onYiLiaoJiGouRightView:(JiGouRightObject *)aObject SelectIndex:(NSUInteger)aIndex;

@end

@interface YiLiaoJiGouRightView : UIView
@property (nonatomic, weak) id <YiLiaoJiGouRightViewDelegate>delegate;

- (void)showContentWithArray:(NSArray *)aArray;
@end
