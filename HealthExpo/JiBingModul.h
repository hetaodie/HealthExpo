//
//  JiBingModul.h
//  HealthExpo
//
//  Created by Weixu on 16/8/10.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassifyObject.h"

@protocol JiBingModulDelegate  <NSObject>

- (void)onGetDianXingRenQun:(NSMutableArray *)aArray;
- (void)onGetKeShiFenLei:(NSMutableArray *)aArray;

- (void)onDianXingRenQunDetailSeccess:(NSMutableArray *)aArray index:(NSInteger)aIndex;

- (void)onKeShiFenLeiDetailSeccess:(NSMutableArray *)aArray index:(NSInteger)aIndex;


- (void)onDianXingRenQunDetailErrorindex:(NSInteger)aIndex;

- (void)onKeShiFenLeiDetailErrorindex:(NSInteger)aIndex;
@end

@interface JiBingModul : NSObject

- (void)getDianXingRenQun;

- (void)getKeShiFenLei;

- (void)getDianXingRenQunDetail:(ClassifyObject *)aObject index:(NSInteger)aIndex;

- (void)getKeShiFenLeiDetail:(ClassifyObject *)aObject index:(NSInteger)aIndex;
@end
