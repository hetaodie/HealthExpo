//
//  YiYuanDetailModul.h
//  HealthExpo
//
//  Created by Weixu on 16/8/13.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YiyuanDetailObject.h"
@protocol YiYuanDetailModulDelegate <NSObject>

- (void)onGetYiYuanDetailSeccess:(YiyuanDetailObject *)aObject;
- (void)onGetYiYuanDetailError;


- (void)onGetMingYIListSeccess:(NSArray *)aArray;
- (void)onGetMingYIListError;
@end

@interface YiYuanDetailModul : NSObject
@property (nonatomic, weak) id <YiYuanDetailModulDelegate> delegate;

- (void)getYiYuanDetailWithID:(NSInteger)aid;

- (void)getMingYIListWithID:(NSInteger)aid;
@end
