//
//  MessageInfoViewCell.h
//  HealthExpo
//
//  Created by Weixu on 16/7/6.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LiuYanObject.h"

@protocol MessageInfoViewCellDelegate <NSObject>

- (void)onDeleteMessageBtnPress:(LiuYanObject *)aObject;

- (void)onReplayMessageBtnPress:(LiuYanObject *)aObject;

@end

@interface MessageInfoViewCell : UITableViewCell
@property (nonatomic, weak) id <MessageInfoViewCellDelegate>delegate;

+(CGFloat)heighCellOfIndex:(NSInteger)aIndex;

- (void)showCellWithObject:(LiuYanObject *)aObject;
@end
