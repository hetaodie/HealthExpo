//
//  CallDetailModelSource.h
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/14.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CallDetailModelSourceDelegate <NSObject>

- (void)onCallDetailSuccess:(NSDictionary *)dataArr;
- (void)onCallDetailFailed;

@end

@interface CallDetailModelSource : NSObject
@property (nonatomic, weak) id<CallDetailModelSourceDelegate> delegate;

- (void)getCallDetail;
@end
