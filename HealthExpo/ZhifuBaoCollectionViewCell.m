//
//  ZhifuBaoCollectionViewCell.m
//  HealthExpo
//
//  Created by weixu on 16/11/21.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "ZhifuBaoCollectionViewCell.h"
#import "UIColor+HEX.h"

@interface ZhifuBaoCollectionViewCell()
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *wpriceLabel;


@end

@implementation ZhifuBaoCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor= [UIColor colorWithHexString:@"ffffff" alpha:1.0];
    self.priceLabel.textColor = [UIColor colorWithHexString:@"00b38a" alpha:1.0];
    self.wpriceLabel.textColor = [UIColor colorWithHexString:@"00b38a" alpha:1.0];
    
    self.layer.cornerRadius = 10;
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [UIColor colorWithHexString:@"00b38a" alpha:1.0].CGColor;
}

+ (CGSize)cellSizeWithObject:(ZhifubaoObject *)aObject{
    CGSize size = CGSizeMake(135,63 );
    return size;
}

- (void)showCellWithObject:(ZhifubaoObject *)aObject{
    self.priceLabel.text = [NSString stringWithFormat:@"%@元",aObject.price];
    self.wpriceLabel.text = [NSString stringWithFormat:@"只需%@元",aObject.wPrice];
}

- (void)setSelected:(BOOL)selected{
    if (selected) {
        self.backgroundColor= [UIColor colorWithHexString:@"00b38a" alpha:1.0];
        self.priceLabel.textColor = [UIColor colorWithHexString:@"ffffff" alpha:1.0];
        self.wpriceLabel.textColor = [UIColor colorWithHexString:@"ffffff" alpha:1.0];
    }
    else{
        self.backgroundColor= [UIColor colorWithHexString:@"ffffff" alpha:1.0];
        self.priceLabel.textColor = [UIColor colorWithHexString:@"00b38a" alpha:1.0];
        self.wpriceLabel.textColor = [UIColor colorWithHexString:@"00b38a" alpha:1.0];
    }
}

@end
