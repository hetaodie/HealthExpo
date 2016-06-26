//
//  AFFNumberiCallboard.h
//  回拨SdkDemo
//
//  Created by yingzhijie2 on 16/3/7.
//  Copyright © 2016年 yingzhijie2. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AFFNumberiCallboardDelegate <NSObject>

-(void)numberkeyboardDelete;
-(void)numberkeyboardCall;
//-(void)numberkeyboardhide;

@end

@interface AFFNumberiCallboard : UIView

@property (nonatomic,strong) UIButton *hideBtn;

@property (nonatomic,assign) id<AFFNumberiCallboardDelegate>delegate;

@end
