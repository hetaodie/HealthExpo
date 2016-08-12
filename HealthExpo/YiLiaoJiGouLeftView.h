//
//  JiBingBKLeftView.h
//  HealthExpo
//
//  Created by Weixu on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiQunObject.h"
@protocol YiLiaoJiGouLeftViewDelegate <NSObject>


- (void)onDidSelectLeftView:(DiQunObject *)aObject  index:(NSInteger)aIndex;

@end

@interface YiLiaoJiGouLeftView : UIView
@property (nonatomic, weak) id <YiLiaoJiGouLeftViewDelegate>delegate;

- (void)showContentWithArray:(NSArray *)aArray;
@end
