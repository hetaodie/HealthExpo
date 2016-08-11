//
//  MessageInfoView.h
//  HealthExpo
//
//  Created by Weixu on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MessageInfoViewDelegate <NSObject>

- (void)onBtnMessagePress;

@end

@interface MessageInfoView : UIView
@property (nonatomic, weak) id <MessageInfoViewDelegate>delegate;

- (void)showViewWithArray:(NSArray *)aArray;
@end
