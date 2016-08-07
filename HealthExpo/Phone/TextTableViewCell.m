//
//  TextTableViewCell.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/7.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "TextTableViewCell.h"

@implementation TextTableViewCell

+ (instancetype)cellFromNib{
    return [[[NSBundle mainBundle] loadNibNamed:@"TextTableViewCell" owner:nil options:nil]firstObject];
}

- (void)fillTitleLabel:(NSString *)desc{
    self.descLabel.text = desc;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
