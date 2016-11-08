//
//  PhoneViewNumTableViewCell.m
//  HealthExpo
//
//  Created by weixu on 16/11/8.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "PhoneViewNumTableViewCell.h"

@implementation PhoneViewNumTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(PhoneViewNumTableViewCell *)viewWithXIb{
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"PhoneViewNumTableViewCell" owner:nil options:nil];
    return [views firstObject];
}

@end
