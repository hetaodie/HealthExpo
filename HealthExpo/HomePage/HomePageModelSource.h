//
//  HomePageModelSource.h
//  HealthExpo
//
//  Created by zhanyawei on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol HomePageModelSourceDelegate <NSObject>
- (void)getHomePageNewsSuccess:(NSArray *)dataArray;
- (void)getHomePageNewsFailed;

@end

@interface HomePageModelSource : NSObject

@property (nonatomic, weak) id <HomePageModelSourceDelegate>delegate;

- (void)getHomePageNews;

- (NSArray *)getDataArray;

@end
