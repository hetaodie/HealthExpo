//
//  CollectionModelSource.h
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/14.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CollectionModelSourceDelegate <NSObject>

- (void)onGetCollectionSuccess:(NSArray *)data;
- (void)onGetCollectionFailed;

@end

@interface CollectionModelSource : NSObject
@property (nonatomic, weak) id <CollectionModelSourceDelegate> delegate;

- (void)getCollectionRequest;

@end
