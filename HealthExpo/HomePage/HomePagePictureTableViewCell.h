//
//  HomePagePictureTableViewCell.h
//  HealthExpo
//
//  Created by zhanyawei on 16/7/1.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePagePictureTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

+ (instancetype)cellFromNib;

- (void)fillCellImage:(UIImage *)aImage title:(NSString *)aTitle;

@end
