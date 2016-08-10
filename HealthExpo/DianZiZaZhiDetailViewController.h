//
//  DianZiZaZhiDetailViewController.h
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/10.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DianZiZaZhiDetailViewController : UIViewController
@property (nonatomic, strong)NSString *detailID;
@property (nonatomic, strong)NSString *topTitle;

- (void)fillDetailID:(NSString *)cID andTitle:(NSString *)title;
@end
