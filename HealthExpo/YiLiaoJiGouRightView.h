//
//  JiBingBKRightView.h
//  HealthExpo
//
//  Created by Weixu on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YiLiaoJiGouRightViewDelegate <NSObject>

- (void)onYiLiaoJiGouRightViewSelectIndex:(NSUInteger)aIndex;

@end

@interface YiLiaoJiGouRightView : UIView
@property (nonatomic, weak) id <YiLiaoJiGouRightViewDelegate>delegate;

@end
