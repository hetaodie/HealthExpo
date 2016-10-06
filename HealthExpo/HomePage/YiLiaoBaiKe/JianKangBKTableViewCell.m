//
//  JianKangBKTableViewCell.m
//  HealthExpo
//
//  Created by zhanyawei on 16/7/3.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "JianKangBKTableViewCell.h"

@implementation JianKangBKTableViewCell

+ (instancetype)cellFromNib{
    return [[[NSBundle mainBundle] loadNibNamed:@"JianKangBKTableViewCell" owner:nil options:nil] firstObject];
}

- (void)fillCellImage:(UIImage *)aImage title:(NSString *)aTitle{
    self.coverImageView.image = aImage;
    self.titleLabel.text = aTitle;
}

- (void)awakeFromNib {
    [super awakeFromNib];// Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
