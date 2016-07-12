//
//  JiBingBKModelSource.h
//  HealthExpo
//
//  Created by hzzhanyawei on 16/7/12.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JiBingBKModelSourceDelegate <NSObject>



@end

@interface JiBingBKModelSource : NSObject
@property (nonatomic, weak) id<JiBingBKModelSourceDelegate> delegate;

- (void)getJiBingList;
@end
