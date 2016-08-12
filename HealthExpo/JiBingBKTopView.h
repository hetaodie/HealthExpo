//
//  JiBingBKTopView.h
//  HealthExpo
//
//  Created by Weixu on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol JiBingBKTopViewDelegate <NSObject>

- (void)onSelectButtonOfIndex:(NSInteger)aIndex;
@end

@interface JiBingBKTopView : UIView

@property (nonatomic, weak) id<JiBingBKTopViewDelegate>delegate;

- (void)setViewLeftName:(NSString *)leftName andRightName:(NSString *)rightname;
@end
