//
//  UserSettingTableViewCell.m
//  HealthExpo
//
//  Created by zhanyawei on 16/6/28.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "UserSettingTableViewCell.h"

@implementation UserSettingTableViewCell

+ (instancetype)cellFromNib{
    return [[[NSBundle mainBundle] loadNibNamed:@"UserSettingTableViewCell" owner:nil options:nil] firstObject];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
