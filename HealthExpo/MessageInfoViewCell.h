//
//  MessageInfoViewCell.h
//  HealthExpo
//
//  Created by Weixu on 16/7/6.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LiuYanObject.h"

@interface MessageInfoViewCell : UITableViewCell

+(CGFloat)heighCellOfIndex:(NSInteger)aIndex;

- (void)showCellWithObject:(LiuYanObject *)aObject;
@end
