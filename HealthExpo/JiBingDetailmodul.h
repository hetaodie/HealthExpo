//
//  JiBingDetailmodul.h
//  HealthExpo
//
//  Created by Weixu on 16/8/11.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JiBingDetailObject.h"


@protocol JiBingDetailmodulDelegete <NSObject>

- (void)onGetJiBingDetailSeccess:(JiBingDetailObject *)aObject;
- (void)onGetJiBingDetailError;
@end

@interface JiBingDetailmodul : NSObject
@property (nonatomic, weak) id <JiBingDetailmodulDelegete>delegate;

- (void)getJiBingDetailWithCid:(NSInteger)aCid;
@end
