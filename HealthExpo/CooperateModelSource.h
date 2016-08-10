//
//  CooperateModelSource.h
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/10.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CooperateModelSourceDelegate <NSObject>

- (void)getCooperateDataSuccess:(NSArray *)data;
- (void)getCooperateDataFailed;

@end

@interface CooperateModelSource : NSObject
@property (nonatomic, weak) id<CooperateModelSourceDelegate> delegate;

- (void)getCooperateData;

@end
