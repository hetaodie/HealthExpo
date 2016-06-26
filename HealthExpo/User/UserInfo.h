//
//  UserInfo.h
//  HealthExpo
//
//  Created by zhanyawei on 16/6/26.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UserInfo : NSObject
@property (nonatomic, strong) UIImage *cover;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *birthday;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *address;

@end
