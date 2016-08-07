//
//  PictureTableViewCell.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/7.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "PictureTableViewCell.h"

@implementation PictureTableViewCell

+ (instancetype)cellFromNib{
    return [[[NSBundle mainBundle] loadNibNamed:@"PictureTableViewCell" owner:nil options:nil] firstObject];
}

- (void)fillCoverWithImage:(UIImage *)cover{
    self.coverImageView.image = cover;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
