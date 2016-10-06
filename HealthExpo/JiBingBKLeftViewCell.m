//
//  JiBingBKRightViewCell.m
//  HealthExpo
//
//  Created by Weixu on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "JiBingBKLeftViewCell.h"
#import "UIColor+HEX.h"
#import "UIImageView+WebCache.h"


@interface JiBingBKLeftViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *Titile;
@property (strong, nonatomic) ClassifyObject *object;

@end


@implementation JiBingBKLeftViewCell



- (void)showCellWithClassifyObject:(ClassifyObject *)aObject{
    self.object = aObject;
    [self showLogoIamge:aObject isSelect:NO];
    self.Titile.text =  aObject.title;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self noSelectCellColor];
}

- (void)prepareForReuse{
    [self noSelectCellColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        [self selectCellColor];
         [self showLogoIamge:self.object isSelect:YES];
    }
    else{
        [self noSelectCellColor];
         [self showLogoIamge:self.object isSelect:NO];
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


- (void)showLogoIamge:(ClassifyObject *)aObject isSelect:(BOOL)isSelect{
    
    if (isSelect) {
        if (aObject.selectImageUrl) {
            [self.logoImageView sd_setImageWithURL:[NSURL URLWithString:aObject.selectImageUrl] placeholderImage:nil];
        }else{
            self.logoImageView.image = aObject.selectImage;
        }
    }
    else{
        if (aObject.defaultImageUrl) {
            [self.logoImageView sd_setImageWithURL:[NSURL URLWithString:aObject.defaultImageUrl] placeholderImage:nil];
        }else{
            self.logoImageView.image = aObject.defaultImage;
        }
    }

}
@end
