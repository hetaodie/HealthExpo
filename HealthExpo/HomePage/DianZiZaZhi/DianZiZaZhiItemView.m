//
//  DianZiZaZhiItemView.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/7/27.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "DianZiZaZhiItemView.h"
#import "UIImageView+WebCache.h"

@implementation DianZiZaZhiItemView

+ (instancetype)viewFromNib{
    return [[[NSBundle mainBundle] loadNibNamed:@"DianZiZaZhiItemView" owner:nil options:nil]firstObject];
}

- (void)awakeFromNib{
    [super awakeFromNib];
}

- (void)fillItemWithCoverUrl:(NSString *)aUrl title:(NSString *)title andIndex:(NSInteger)index{
    self.itemIndex = index;
    self.titleLabel.text = title;
    NSString *placeHolder = [NSString stringWithFormat:@"dianzizazhi%zd", index];
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:aUrl] placeholderImage:[UIImage imageNamed:placeHolder]];
}
- (IBAction)ItemClicked:(id)sender {
    if ([self.delegate respondsToSelector:@selector(ClickedDianZiZaZhiItemViewIndex:)]) {
        [self.delegate ClickedDianZiZaZhiItemViewIndex:self.itemIndex];
    }
}

@end
