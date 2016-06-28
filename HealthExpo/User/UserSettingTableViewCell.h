//
//  UserSettingTableViewCell.h
//  HealthExpo
//
//  Created by zhanyawei on 16/6/28.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserSettingTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *separatorLine;

+ (instancetype)cellFromNib;

@end
