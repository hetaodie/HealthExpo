//
//  DianZiZaZhiItemCollectionViewCell.h
//  HealthExpo
//
//  Created by weixu on 16/11/16.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DianZiZaZhiItemCollectionViewCell : UICollectionViewCell

+ (CGSize)cellSizeWithData:(NSString *)aData;

- (void)fillItemWithCoverUrl:(NSString *)aUrl title:(NSString *)title andIndex:(NSInteger)index;
@end
