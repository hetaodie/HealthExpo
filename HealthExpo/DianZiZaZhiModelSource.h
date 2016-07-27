//
//  DianZiZaZhiModelSource.h
//  HealthExpo
//
//  Created by hzzhanyawei on 16/7/27.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol DianZiZaZhiModelSourceDelegate<NSObject>
- (void)getDianZiZaZhiDataSuccess:(NSArray *)dataArray;
- (void)getDianZiZaZhiDataFailed;

@end

@interface DianZiZaZhiModelSource : NSObject
@property (nonatomic, weak) id <DianZiZaZhiModelSourceDelegate> delegate;

@property (nonatomic, strong) NSArray *dataArray;

- (void)getDianZiZaZhiData;
@end
