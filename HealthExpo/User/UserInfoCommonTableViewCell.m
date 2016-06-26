//
//  UserInfoCommonTableViewCell.m
//  HealthExpo
//
//  Created by zhanyawei on 16/6/26.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "UserInfoCommonTableViewCell.h"

@implementation UserInfoCommonTableViewCell

+ (instancetype)cellFromNib{
    return [[[NSBundle mainBundle] loadNibNamed:@"UserInfoCommonTableViewCell" owner:nil options:nil] firstObject];
}

- (void)fillCellWithTitle:(NSString *)title andDescription:(NSString *)description{
    self.titleLabel.text = title;
    self.descLabel.text = description;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
