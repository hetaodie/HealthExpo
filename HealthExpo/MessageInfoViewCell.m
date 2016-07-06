//
//  MessageInfoViewCell.m
//  HealthExpo
//
//  Created by Weixu on 16/7/6.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "MessageInfoViewCell.h"
#import "UIColor+HEX.h"

@interface MessageInfoViewCell()
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *fristContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *louLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondeDateLabel;
@property (weak, nonatomic) IBOutlet UIButton *pinglunButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@property (weak, nonatomic) IBOutlet UIView *middeView;
@end

@implementation MessageInfoViewCell

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect frame = self.topView.frame;
    frame.size.height = 0.5;
    [self.topView setFrame:frame];
}

+(CGFloat)heighCellOfIndex:(NSInteger)aIndex{
    return 166;
//    if (aIndex%2) {
//        return 166;
//    }
//    return 101;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupControlStatus];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setupControlStatus{
    self.titleLabel.textColor = [UIColor colorWithHexString:@"0x00b38a" alpha:1.0];
    self.fristContentLabel.textColor = [UIColor colorWithHexString:@"0xdcdcdc" alpha:1.0];
    
    self.firstDateLabel.textColor = [UIColor colorWithHexString:@"0xdcdcdc" alpha:1.0];
    self.secondTitleLabel.textColor = [UIColor colorWithHexString:@"0x00b38a" alpha:1.0];
    
    self.louLabel.textColor = [UIColor colorWithHexString:@"0x00b38a" alpha:1.0];
    self.secondContentLabel.textColor = [UIColor colorWithHexString:@"0xdcdcdc" alpha:1.0];
    
    self.secondeDateLabel.textColor = [UIColor colorWithHexString:@"0xdcdcdc" alpha:1.0];
    self.topView.backgroundColor = [UIColor colorWithHexString:@"0x333333" alpha:1.0];
     self.middeView.backgroundColor = [UIColor colorWithHexString:@"0xdcdcdc" alpha:1.0];
    self.topView.backgroundColor = [UIColor colorWithHexString:@"0xdcdcdc" alpha:1.0];
}
@end