//
//  YiMiaoDetailView.m
//  HealthExpo
//
//  Created by Weixu on 16/7/6.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "YiMiaoDetailView.h"

@interface YiMiaoDetailView()
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *yimiaoNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yumangLabel;
@property (weak, nonatomic) IBOutlet UILabel *tishiLabel;
@property (weak, nonatomic) IBOutlet UILabel *duixiangLabel;

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@end

@implementation YiMiaoDetailView


- (void)awakeFromNib{
    [super awakeFromNib];
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



@end
