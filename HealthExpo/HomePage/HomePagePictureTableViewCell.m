//
//  HomePagePictureTableViewCell.m
//  HealthExpo
//
//  Created by zhanyawei on 16/7/1.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "HomePagePictureTableViewCell.h"
#import "HomePageNewsItem.h"
#import "UIImageView+WebCache.h"

@implementation HomePagePictureTableViewCell

+ (instancetype)cellFromNib{
    return [[[NSBundle mainBundle] loadNibNamed:@"HomePagePictureTableViewCell" owner:nil options:nil] firstObject];
}

//- (void)fillCellImage:(UIImage *)aImage title:(NSString *)aTitle{
//    self.coverImageView.image = aImage;
//    self.titleLabel.text = aTitle;
//}

- (void)fillCellWithData:(HomePageNewsItem *)data{
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"homeDefault01"]];//image Data
    self.titleLabel.text = data.title;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
