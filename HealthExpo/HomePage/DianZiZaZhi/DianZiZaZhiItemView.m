//
//  DianZiZaZhiItemView.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/7/27.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "DianZiZaZhiItemView.h"
#import "UIImageView+WebCache.h"
#import "HENetTask.h"

@implementation DianZiZaZhiItemView

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSString *className = NSStringFromClass([self class]);
        self.containtView = [[[NSBundle mainBundle] loadNibNamed:className owner:self options:nil] firstObject];
        [self addSubview:self.containtView];
        return self;
    }
    return nil;
}

- (void)awakeFromNib{
    [super awakeFromNib];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.containtView.frame = self.bounds;
}

- (void)fillItemWithCoverUrl:(NSString *)aUrl title:(NSString *)title andIndex:(NSInteger)index{
    self.itemIndex = index;
    self.titleLabel.text = title;
    aUrl = [NSString stringWithFormat:@"%@%@%@", HEHttpServer,@"/upload", aUrl];
    NSString *placeHolder = [NSString stringWithFormat:@"dianzizazhi%zd", (index + 1)];
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:aUrl] placeholderImage:[UIImage imageNamed:placeHolder]];
}
- (IBAction)ItemClicked:(id)sender {
    if ([self.delegate respondsToSelector:@selector(ClickedDianZiZaZhiItemViewIndex:)]) {
        [self.delegate ClickedDianZiZaZhiItemViewIndex:self.itemIndex];
    }
}

@end
