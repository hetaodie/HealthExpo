//
//  HomePageCommonTableViewCell.h
//  HealthExpo
//
//  Created by zhanyawei on 16/7/1.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomePageNewsItem;
@interface HomePageCommonTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *pingLunLabel;
@property (weak, nonatomic) IBOutlet UILabel *lookLabel;

+ (instancetype)cellFromNib;

- (void)fillCellWithData:(HomePageNewsItem *)data;

@end
