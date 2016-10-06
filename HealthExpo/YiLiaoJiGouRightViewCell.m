//
//  JiBingBKRightViewCell.m
//  HealthExpo
//
//  Created by Weixu on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "YiLiaoJiGouRightViewCell.h"

@interface YiLiaoJiGouRightViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *jibieLabel;
@property (weak, nonatomic) IBOutlet UILabel *dizhiLabel;
@property (weak, nonatomic) IBOutlet UILabel *dianHuaLabel;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation YiLiaoJiGouRightViewCell

- (void)awakeFromNib {
     [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)showCellWithData:(JiGouRightObject *)aObject{
    self.titleLabel.text = aObject.title;
    self.dizhiLabel.text = aObject.dizhi;
    self.dianHuaLabel.text = aObject.dianhua;
    self.jibieLabel.text =aObject.dengji;
    
}
@end
