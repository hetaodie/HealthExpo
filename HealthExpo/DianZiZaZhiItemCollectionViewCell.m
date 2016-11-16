//
//  DianZiZaZhiItemCollectionViewCell.m
//  HealthExpo
//
//  Created by weixu on 16/11/16.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "DianZiZaZhiItemCollectionViewCell.h"
#import "DianZiZaZhiItemView.h"

@interface DianZiZaZhiItemCollectionViewCell()
@property (weak, nonatomic) IBOutlet DianZiZaZhiItemView *itemView;


@end

@implementation DianZiZaZhiItemCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

+ (CGSize)cellSizeWithData:(NSString *)aData{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat cellWidth = (screenWidth - 40)/2;
    CGFloat cellHeight = cellWidth*244/188;
    CGSize size = CGSizeMake(cellWidth, cellHeight);
    return size;
}

- (void)fillItemWithCoverUrl:(NSString *)aUrl title:(NSString *)title andIndex:(NSInteger)index{
    [self.itemView fillItemWithCoverUrl:aUrl title:title andIndex:index];
    
}

@end
