//
//  UserCenterModelSource.h
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/12.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol UserCenterModelSourceDelegate <NSObject>
- (void)getUserInfoSuccess:(NSArray *)data;
- (void)getUserInfoFailed;

- (void)editUserInfoSuccess:(NSArray *)data;
- (void)editUserInfoFailed;
@end

@interface UserCenterModelSource : NSObject
@property (nonatomic, weak) id <UserCenterModelSourceDelegate>delegate;
- (void)getUserInfoWithName:(NSString *)name;

- (void)editUserInfoWithName:(NSString *)name andEmail:(NSString *)email;
@end
