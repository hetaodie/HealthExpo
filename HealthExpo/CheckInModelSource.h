//
//  CheckInModelSource.h
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/14.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CheckInModelSourceDelegate <NSObject>
- (void)onCheckInSuccess:(NSDictionary *)dict;
- (void)onCheckInFailed;
@end

@interface CheckInModelSource : NSObject
@property (nonatomic, weak) id <CheckInModelSourceDelegate> delegate;

- (void)onCheckInRequst;

@end
