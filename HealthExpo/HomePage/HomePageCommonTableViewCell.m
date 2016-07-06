//
//  HomePageCommonTableViewCell.m
//  HealthExpo
//
//  Created by zhanyawei on 16/7/1.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "HomePageCommonTableViewCell.h"
#import "HomePageNewsItem.h"
#import "UIImageView+WebCache.h"

@implementation HomePageCommonTableViewCell

+ (instancetype)cellFromNib{
    return [[[NSBundle mainBundle] loadNibNamed:@"HomePageCommonTableViewCell" owner:nil options:nil]firstObject];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)fillCellWithData:(HomePageNewsItem *)data{
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"homeDefault01"]];//image Data
    self.titleLabel.text = data.title;
    self.timeLabel.text = data.createDate;
    
    self.lookLabel.text = [NSString stringWithFormat:@"%zd", data.viewNum];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
