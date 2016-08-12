//
//  JiBingBKTopView.m
//  HealthExpo
//
//  Created by Weixu on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "JiBingBKTopView.h"
#import "UIColor+HEX.h"


@interface JiBingBKTopView()
@property (weak, nonatomic) IBOutlet UIView *middleLine;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *moveViewLeftConstraint;
@property (strong, nonatomic) IBOutlet UIView *contentView;

@end

@implementation JiBingBKTopView


- (void)awakeFromNib{
    [super awakeFromNib];
    
    [self setupControlStatus];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    self.contentView.frame = self.bounds;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSString *className = NSStringFromClass([self class]);
        self.contentView = [[[NSBundle mainBundle] loadNibNamed:className owner:self options:nil] firstObject];
        [self addSubview:self.contentView];
        return self;
    }
    return nil;
}


- (IBAction)leftButtonPress:(id)sender {
    CGFloat sceenWidth = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat leftConstant = (sceenWidth/2.0f - 80)/2;
    
    self.moveViewLeftConstraint.constant = leftConstant;
    self.leftButton.selected = YES;
    self.rightButton.selected = NO;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(onSelectButtonOfIndex:)]) {
        [self.delegate onSelectButtonOfIndex:0];
    }
}

- (IBAction)rightButtonPress:(id)sender {
    
    CGFloat sceenWidth = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat leftConstant = sceenWidth/2.0f + (sceenWidth/2.0f - 60)/2;
    
    self.moveViewLeftConstraint.constant = leftConstant;
    self.leftButton.selected = NO;
    self.rightButton.selected = YES;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(onSelectButtonOfIndex:)]) {
        [self.delegate onSelectButtonOfIndex:1];
    }
}

- (void)setupControlStatus{
    [self.leftButton setTitleColor:[UIColor colorWithHexString:@"0x00b38a" alpha:1.0] forState:UIControlStateSelected];
    [self.leftButton setTitleColor:[UIColor colorWithHexString:@"0x333333" alpha:1.0] forState:UIControlStateNormal];
    
    [self.rightButton setTitleColor:[UIColor colorWithHexString:@"0x00b38a" alpha:1.0] forState:UIControlStateSelected];
    [self.rightButton setTitleColor:[UIColor colorWithHexString:@"0x333333" alpha:1.0] forState:UIControlStateNormal];
    
    self.bottomView.backgroundColor = [UIColor colorWithHexString:@"0xDCDCDC" alpha:1.0];
    self.middleLine.backgroundColor = [UIColor colorWithHexString:@"0xDCDCDC" alpha:1.0];
}

- (void)setViewLeftName:(NSString *)leftName andRightName:(NSString *)rightname{
    [self.leftButton setTitle:leftName forState:UIControlStateNormal];
    [self.leftButton setTitle:leftName forState:UIControlStateSelected];
    
    [self.rightButton setTitle:rightname forState:UIControlStateNormal];
    [self.rightButton setTitle:rightname forState:UIControlStateSelected];
}
@end
