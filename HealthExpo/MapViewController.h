//
//  MapViewController.h
//  MapDemo
//
//  Created by Weixu on 16/8/16.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapViewController : UIViewController

- (void)addLocationToMap:(CGFloat)latitude longitude:(CGFloat)longitude title:(NSString *)title dizhi:(NSString *)dizhi;
@end
