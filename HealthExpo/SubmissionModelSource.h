//
//  SubmissionModelSource.h
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/10.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SubmissionModelSourceDelegate <NSObject>

- (void)getSubmissionDataSuccess:(NSArray *)data;
- (void)getSubmissionDataFailed;

@end

@interface SubmissionModelSource : NSObject
@property (nonatomic, weak)id<SubmissionModelSourceDelegate> delegate;

- (void)getSubmissionData;
@end
