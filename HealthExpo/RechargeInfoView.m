//
//  RechargeInfoView.m
//  HealthExpo
//
//  Created by weixu on 16/11/21.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "RechargeInfoView.h"
#import "UserInfoManager.h"

@interface RechargeInfoView()
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *nickLabel;

@end


@implementation RechargeInfoView

- (void)layoutSubviews{
    [super layoutSubviews];
    self.contentView.frame = self.bounds;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
    UserLoginInfo *info = [[UserInfoManager shareManager] getUserLoginInfo];
    self.phoneLabel.text = info.phone;
    self.nickLabel.text = info.userName;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        NSString *className = NSStringFromClass([self class]);
        self.contentView = [[[NSBundle mainBundle] loadNibNamed:className owner:self options:nil] firstObject];
        [self addSubview:self.contentView];
    }
    return self;
}

@end
