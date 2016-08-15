//
//  PushViewControllerWithSearchData.h
//  HealthExpo
//
//  Created by Weixu on 16/8/15.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SearchObject.h"

@interface PushViewControllerWithSearchData : NSObject

+ (void)pushViewControllerWithdata:(SearchObject *)aObject oldViewController:(UIViewController *)aViewController;
@end
