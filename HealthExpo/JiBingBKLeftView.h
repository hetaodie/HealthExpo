//
//  JiBingBKLeftView.h
//  HealthExpo
//
//  Created by Weixu on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassifyObject.h"
@protocol JiBingBKLeftViewDelegate <NSObject>


- (void)onDidSelectLeftView:(ClassifyObject *)aObject  index:(NSInteger)aIndex;

@end

@interface JiBingBKLeftView : UIView
@property (nonatomic, weak) id <JiBingBKLeftViewDelegate>delegate;

- (void)showContentWithArray:(NSArray *)aArray;
@end
