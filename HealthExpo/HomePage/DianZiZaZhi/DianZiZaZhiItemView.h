//
//  DianZiZaZhiItemView.h
//  HealthExpo
//
//  Created by hzzhanyawei on 16/7/27.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DianZiZaZhiItemViewDelegate <NSObject>
- (void)ClickedDianZiZaZhiItemViewIndex:(NSInteger)index;
@end


@interface DianZiZaZhiItemView : UIView
@property (strong, nonatomic) IBOutlet UIImageView *coverImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIView *containtView;

@property (nonatomic, assign) NSInteger itemIndex;

@property (nonatomic, weak) IBOutlet id <DianZiZaZhiItemViewDelegate>delegate;

- (void)fillItemWithCoverUrl:(NSString *)aUrl title:(NSString *)title andIndex:(NSInteger) index;
@end
