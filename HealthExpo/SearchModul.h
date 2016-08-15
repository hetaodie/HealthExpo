//
//  SearchModul.h
//  HealthExpo
//
//  Created by Weixu on 16/8/15.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchModulDelegate <NSObject>

- (void)onSearchSuccess:(NSArray *)aArray;
- (void)onSearchError;

@end

@interface SearchModul : UIView
@property (nonatomic, weak) id<SearchModulDelegate>delegate;


- (void)seachText:(NSString *)aText;

@end
