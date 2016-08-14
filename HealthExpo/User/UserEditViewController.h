//
//  UserEditViewController.h
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/14.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, EditType){
    HEEditName = 0,
    HEEditPhone,
    HEEditBirthday,
    HEEditEmail,
    HEEditAddress
};

@interface UserEditViewController : UIViewController

@property (nonatomic, strong) NSString *editTitle;
@property (nonatomic, assign) EditType editType;
@end
