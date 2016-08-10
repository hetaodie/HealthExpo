//
//  DianZiZaZhiModelSource.h
//  HealthExpo
//
//  Created by hzzhanyawei on 16/7/27.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol DianZiZaZhiModelSourceDelegate <NSObject>

- (void)getDianZiZaZhiListSuccess:(NSArray *)dataArr;
- (void)getDianZiZaZhiListFailed;

- (void)getDianZiZaZhiListWithIDSuccess:(NSArray *)dataArr;
- (void)getDianZiZaZhiListWithIDFailed;

@end

@interface DianZiZaZhiModelSource : NSObject

@property (nonatomic, weak) id<DianZiZaZhiModelSourceDelegate> delegate;

- (void)getDianZiZaZhiList;

- (void)getDianZiZaZhiListWithID:(NSString *)cID;

@end