//
//  CustomTabBarController.h
//  HealthExpo
//
//  Created by hzzhanyawei on 16/6/25.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTabBarController : UITabBarController
+ (instancetype)getInstance;

- (void)clickAtIndex:(NSInteger)index;

- (void)showLoginViewController;

@end
