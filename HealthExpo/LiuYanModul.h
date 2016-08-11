//
//  LiuYanModul.h
//  HealthExpo
//
//  Created by Weixu on 16/8/11.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LiuYanObject.h"
@protocol LiuYanModulDelegate <NSObject>

- (void)onGetLiyanListSeccess:(NSMutableArray *)aArray;

- (void)onGetLiyanListError;

@end

@interface LiuYanModul : NSObject
@property (nonatomic,weak)id <LiuYanModulDelegate>delegate;
- (void)getLiyanList:(NSInteger)cid;

- (void)setjibingLiuYan:(LiuYanObject *)aObject;

- (void)cexiaoLiuYan:(LiuYanObject *)aObject;

- (void)liuYanReply:(LiuYanObject *)aObject;
@end
