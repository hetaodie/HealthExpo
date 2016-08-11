//
//  JiBingInfoView.m
//  HealthExpo
//
//  Created by Weixu on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "JiBingInfoView.h"
#import "UIColor+HEX.h"

@interface JiBingInfoView()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet UILabel *lookMoreLabel;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *titleBottomView;
@property (weak, nonatomic) IBOutlet UIView *lookMoreTopView;

@end


@implementation JiBingInfoView

- (void)showViewWithObject:(JiBingDetailObject *)aObject{
    self.titleLabel.text = aObject.title;
    self.contentLabel.text = aObject.contenttext;
}

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

- (IBAction)moreInfoButtonPress:(id)sender {
}

- (void)setupControlStatus{
    self.titleLabel.textColor = [UIColor colorWithHexString:@"0x333333" alpha:1.0];
    self.contentLabel.textColor = [UIColor colorWithHexString:@"0x333333" alpha:1.0];
    
    self.lookMoreLabel.textColor = [UIColor colorWithHexString:@"0x888888" alpha:1.0];
    self.titleBottomView.backgroundColor = [UIColor colorWithHexString:@"0xdcdcdc" alpha:1.0];
    self.lookMoreTopView.backgroundColor = [UIColor colorWithHexString:@"0xdcdcdc" alpha:1.0];
}

@end
