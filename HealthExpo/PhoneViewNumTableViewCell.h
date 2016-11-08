//
//  PhoneViewNumTableViewCell.h
//  HealthExpo
//
//  Created by weixu on 16/11/8.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhoneViewNumTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumLabel;

+(PhoneViewNumTableViewCell *)viewWithXIb;
@end
