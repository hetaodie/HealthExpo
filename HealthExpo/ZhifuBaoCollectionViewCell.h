//
//  ZhifuBaoCollectionViewCell.h
//  HealthExpo
//
//  Created by weixu on 16/11/21.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZhifubaoObject.h"

@interface ZhifuBaoCollectionViewCell : UICollectionViewCell

+ (CGSize)cellSizeWithObject:(ZhifubaoObject *)aObject;

- (void)showCellWithObject:(ZhifubaoObject *)aObject;
@end
