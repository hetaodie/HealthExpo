//
//  CallDetailModelSource.h
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/14.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UserModelSourceDelegate <NSObject>

- (void)onCallNumSuccess:(NSDictionary *)dataArr;
- (void)onCallNumFailed;

@end

@interface UserModelSource : NSObject
@property (nonatomic, weak) id<UserModelSourceDelegate> delegate;

- (void)getCallNum;
@end
