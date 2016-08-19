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

- (void)cancelCollectionSuccess:(NSDictionary *)dict;
- (void)cancelCollectionFailed;

@end

@interface CollectionModelSource : NSObject
@property (nonatomic, weak) id <CollectionModelSourceDelegate> delegate;

- (void)getCollectionRequest;

- (void)cancelCollection:(NSString *)cID;

@end
