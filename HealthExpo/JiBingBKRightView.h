//
//  JiBingBKRightView.h
//  HealthExpo
//
//  Created by Weixu on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassifyObject.h"

@protocol JiBingBKRightViewDelegate <NSObject>
- (void)onDidSelectRightView:(ClassifyObject *)aObject  index:(NSInteger)aIndex;
- (void)onSelectIndex:(NSUInteger)aIndex;

@end

@interface JiBingBKRightView : UIView
@property (nonatomic, weak) id <JiBingBKRightViewDelegate>delegate;

- (void)showContentWithArray:(NSArray *)aArray;
@end
