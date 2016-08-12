//
//  DianZiZaZhiDetailModelSource.h
//  TestAFNetWorking
//
//  Created by hzzhanyawei on 16/8/10.
//  Copyright © 2016年 hzzhanyawei. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol DianZiZaZhiDetailModelSourceDelegate <NSObject>
- (void)getDianZiZaZhiDetailSuccess:(NSDictionary *)dict;
- (void)getDianZiZaZhiDetailFailed;
- (void)getDianZiZaZhiDetailListSuccess:(NSArray *)array;
- (void)getDianZiZaZhiDetailListFailed;

@end

@interface DianZiZaZhiDetailModelSource : NSObject
@property (nonatomic, weak)id <DianZiZaZhiDetailModelSourceDelegate>delegate;

- (void)getDianZiZaZhiDetailWithID:(NSString *)cID;

- (void)getDianZiZaZhiDetailListWithID:(NSString *)cID;
@end
