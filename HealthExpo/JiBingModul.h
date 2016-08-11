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
- (void)onGetDianXingRenQunError;
- (void)onGetKeShiFenLeiError;

- (void)onGetDianXingRenQunDetailSeccess:(NSMutableArray *)aArray index:(NSInteger)aIndex;

- (void)onGetKeShiFenLeiDetailSeccess:(NSMutableArray *)aArray index:(NSInteger)aIndex;


- (void)onGetDianXingRenQunDetailErrorindex:(NSInteger)aIndex;

- (void)onGetKeShiFenLeiDetailErrorindex:(NSInteger)aIndex;
@end

@interface JiBingModul : NSObject
@property (nonatomic,weak) id <JiBingModulDelegate>delegate;

- (void)getDianXingRenQun;

- (void)getKeShiFenLei;

- (void)getDianXingRenQunDetail:(ClassifyObject *)aObject index:(NSInteger)aIndex;

- (void)getKeShiFenLeiDetail:(ClassifyObject *)aObject index:(NSInteger)aIndex;



@end
