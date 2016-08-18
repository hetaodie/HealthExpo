//
//  MessageReplyView.h
//  HealthExpo
//
//  Created by Weixu on 16/8/11.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MessageReplyViewDelegate <NSObject>

- (void)onSendMessageBtnPressName:(NSString *)name phone:(NSString *)phone content:(NSString *)content;

@end
@interface MessageReplyView : UIView
@property (nonatomic ,weak) id <MessageReplyViewDelegate>delegate;
@end
