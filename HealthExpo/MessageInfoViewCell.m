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
@property (strong, nonatomic) LiuYanObject *object;
@end

@implementation MessageInfoViewCell

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect frame = self.topView.frame;
    frame.size.height = 0.5;
    [self.topView setFrame:frame];
}

+(CGFloat)heighCellOfIndex:(NSInteger)aIndex{
    return 101;
//    if (aIndex%2) {
//        return 166;
//    }
//    return 101;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)showCellWithObject:(LiuYanObject *)aObject{
    self.object = aObject;
    self.titleLabel.text = aObject.username;
    self.fristContentLabel.text = aObject.content;
}

- (IBAction)deleteBtnPRess:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(onDeleteMessageBtnPress:)]) {
        [self.delegate onDeleteMessageBtnPress:self.object];
    }
}

- (IBAction)pingLunBtnPress:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(onReplayMessageBtnPress:)]) {
        [self.delegate onReplayMessageBtnPress:self.object];
    }
}

@end
