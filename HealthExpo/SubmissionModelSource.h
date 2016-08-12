//
//  SubmissionModelSource.h
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/10.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SubmissionModelSourceDelegate <NSObject>

- (void)getSubmissionDataSuccess:(NSDictionary *)data;
- (void)getSubmissionDataFailed;

- (void)getCooperateDataSuccess:(NSDictionary *)data;
- (void)getCooperateDataFailed;
@end

@interface SubmissionModelSource : NSObject
@property (nonatomic, weak)id<SubmissionModelSourceDelegate> delegate;

- (void)getSubmissionData;

- (void)getCooperateData;
@end
