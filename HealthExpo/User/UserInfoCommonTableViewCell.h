//
//  UserInfoCommonTableViewCell.h
//  HealthExpo
//
//  Created by zhanyawei on 16/6/26.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoCommonTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

+ (instancetype)cellFromNib;

- (void)fillCellWithTitle:(NSString *)title andDescription:(NSString *)description;

@end
