//
//  LoginModelSource.h
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/12.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol LoginModelSourceDelegate <NSObject>
- (void)loginSuccess:(NSDictionary *)dict;
- (void)loginFailed;

@end
@interface LoginModelSource : NSObject
@property (nonatomic, weak) id <LoginModelSourceDelegate> delegate;

- (void)loginWithUserName:(NSString *)userName andPwd:(NSString *)pwd;
@end
