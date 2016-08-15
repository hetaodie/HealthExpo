//
//  MingYIDetailModul.h
//  HealthExpo
//
//  Created by Weixu on 16/8/15.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HENetTask.h"
#import "MingYiDetailObject.h"

@protocol MingYIDetailModulDelegate<NSObject>

- (void)onGetMingYiDetialSeccess:(MingYiDetailObject *)aObject;
- (void)onGetMingYiDetialError;
@end

@interface MingYIDetailModul : NSObject
@property (nonatomic , weak) id<MingYIDetailModulDelegate>delegate;

- (void)getMingYiDetial:(NSInteger)cid;
@end
