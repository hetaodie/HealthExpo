//
//  PictureTableViewCell.h
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/7.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PictureTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *coverImageView;

+ (instancetype)cellFromNib;

- (void)fillCoverWithImage:(UIImage *)cover;

@end
