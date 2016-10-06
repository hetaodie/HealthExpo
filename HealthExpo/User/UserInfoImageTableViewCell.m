//
//  UserInfoImageTableViewCell.m
//  HealthExpo
//
//  Created by zhanyawei on 16/6/26.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "UserInfoImageTableViewCell.h"

@implementation UserInfoImageTableViewCell

+ (instancetype)cellFromNib{
    return [[[NSBundle mainBundle] loadNibNamed:@"UserInfoImageTableViewCell" owner:nil options:nil] firstObject];
}

- (void)fillCellWithTitle:(NSString *)title andImage:(UIImage *)image{
    self.titleLabel.text = title;
    self.rightImage.image = image;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
