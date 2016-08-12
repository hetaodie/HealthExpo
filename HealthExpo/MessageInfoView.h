//
//  MessageInfoView.h
//  HealthExpo
//
//  Created by Weixu on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LiuYanObject.h"

@protocol MessageInfoViewDelegate <NSObject>

- (void)onBtnMessagePress;

- (void)onDeleteMessageWithObject:(LiuYanObject *)aObject;

- (void)onReplayMessageWithObject:(LiuYanObject *)aObject;

@end

@interface MessageInfoView : UIView
@property (nonatomic, weak) id <MessageInfoViewDelegate>delegate;

- (void)showViewWithArray:(NSArray *)aArray;
@end
