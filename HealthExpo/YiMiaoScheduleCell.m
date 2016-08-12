//
//  YiMiaoScheduleCell.m
//  HealthExpo
//
//  Created by Weixu on 16/7/6.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "YiMiaoScheduleCell.h"

@interface YiMiaoScheduleCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *desLabel;


@end

@implementation YiMiaoScheduleCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)showCellWithData:(YiMiaoObject *)aObject{
    self.titleLabel.text = aObject.title;
}

@end
