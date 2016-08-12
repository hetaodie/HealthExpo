//
//  JiBingModul.h
//  HealthExpo
//
//  Created by Weixu on 16/8/10.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DiQunObject.h"

@protocol YiLiaoJiGouModulDelegate  <NSObject>

- (void)onGetDiQuSeccess:(NSMutableArray *)aArray;
- (void)onGetKeShiFenLei:(NSMutableArray *)aArray;

- (void)onGetDiQuError;
- (void)onGetKeShiFenLeiError;

- (void)onGetDiQuDetailSeccess:(NSMutableArray *)aArray index:(NSInteger)aIndex;

- (void)onGetKeShiFenLeiDetailSeccess:(NSMutableArray *)aArray index:(NSInteger)aIndex;


- (void)onGetDiQuDetailErrorindex:(NSInteger)aIndex;

- (void)onGetKeShiFenLeiDetailErrorindex:(NSInteger)aIndex;
@end

@interface YiLiaoJiGouModul : NSObject
@property (nonatomic,weak) id <YiLiaoJiGouModulDelegate>delegate;

- (void)getDiQu;

- (void)getKeShiFenLei;

- (void)getDiQuDetail:(DiQunObject *)aObject index:(NSInteger)aIndex;

- (void)getKeShiFenLeiDetail:(DiQunObject *)aObject index:(NSInteger)aIndex;



@end
