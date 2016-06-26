//
//  UserInfoImageTableViewCell.h
//  HealthExpo
//
//  Created by zhanyawei on 16/6/26.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoImageTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *rightImage;

+ (instancetype)cellFromNib;

- (void)fillCellWithTitle:(NSString *)title andImage:(UIImage *)image;

@end
