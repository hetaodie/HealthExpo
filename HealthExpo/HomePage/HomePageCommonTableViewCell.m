//
//  HomePageCommonTableViewCell.m
//  HealthExpo
//
//  Created by zhanyawei on 16/7/1.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "HomePageCommonTableViewCell.h"

@implementation HomePageCommonTableViewCell

+ (instancetype)cellFromNib{
    return [[[NSBundle mainBundle] loadNibNamed:@"HomePageCommonTableViewCell" owner:nil options:nil]firstObject];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
