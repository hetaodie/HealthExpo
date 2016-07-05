//
//  JiBingBKRightViewCell.m
//  HealthExpo
//
//  Created by Weixu on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "JiBingBKLeftViewCell.h"
#import "UIColor+HEX.h"


@interface JiBingBKLeftViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *Titile;

@end


@implementation JiBingBKLeftViewCell

- (void)awakeFromNib {
    [self noSelectCellColor];
}

- (void)prepareForReuse{
    [self noSelectCellColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        [self selectCellColor];
    }
    else{
        [self noSelectCellColor];
    }
}


- (void)selectCellColor{
    self.backgroundColor = [UIColor colorWithHexString:@"0xffffff" alpha:1.0];
    self.Titile.textColor = [UIColor colorWithHexString:@"0x333333" alpha:1.0];
}

- (void)noSelectCellColor{
    self.backgroundColor = [UIColor colorWithHexString:@"0xDCDCDC" alpha:1.0];
    self.Titile.textColor = [UIColor colorWithHexString:@"0xBBBBBB" alpha:1.0];
}

@end
