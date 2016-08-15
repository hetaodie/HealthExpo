//
//  MingYICell.m
//  HealthExpo
//
//  Created by Weixu on 16/8/15.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "MingYICell.h"
#import "UIImageView+WebCache.h"

@interface MingYICell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *zhichengLabel;
@property (weak, nonatomic) IBOutlet UILabel *zhuangchangLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@end

@implementation MingYICell

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (void)showCellWithData:(MingYiObject *)aObject{
    self.titleLabel.text = aObject.title;
    self.zhichengLabel.text =aObject.zhicheng;
    self.zhuangchangLabel.text = aObject.shanchang;
    
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:aObject.picUrl] placeholderImage:[UIImage imageNamed:@"03"]];
}
@end
