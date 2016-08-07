//
//  TextTableViewCell.h
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/7.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *descLabel;

+ (instancetype)cellFromNib;

- (void)fillTitleLabel:(NSString *)desc;

@end
