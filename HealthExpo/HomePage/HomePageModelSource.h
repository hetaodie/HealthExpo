//
//  HomePageModelSource.h
//  HealthExpo
//
//  Created by zhanyawei on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SpeakerMessageItem;
@protocol HomePageModelSourceDelegate <NSObject>
- (void)getHomePageNewsSuccess:(NSArray *)dataArray;
- (void)getHomePageNewsFailed;

- (void)getSpearkMessageSuccess:(SpeakerMessageItem *)data;
- (void)getSpearkMessageFailed;
@end

@interface HomePageModelSource : NSObject

@property (nonatomic, weak) id <HomePageModelSourceDelegate>delegate;

- (void)getHomePageNews;

- (NSArray *)getDataArray;

@end
