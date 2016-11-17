//
//  ZaZhiYearsView.h
//  HealthExpo
//
//  Created by weixu on 16/11/17.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZaZhiYearsViewDelegate <NSObject>

- (void)onOneElementSelectWithDic:(NSDictionary *)aDic andIndex:(NSInteger)aIndex;

@end

@interface ZaZhiYearsView : UIView
@property (nonatomic, weak) id <ZaZhiYearsViewDelegate>delegate;

- (void)showViewWithArray:(NSArray *)aArray;

- (void)setSelectedWithIndex:(NSInteger)aIndex;

@end
