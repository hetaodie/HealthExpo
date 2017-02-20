//
//  RegisterModelSource.h
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/12.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol RegisterModelSourceDelegate <NSObject>
- (void)onRegisterSuccess:(NSDictionary *)dict;
- (void)onRegisterFailed;

- (void)onRegisterICallSuccess:(NSDictionary *)data;
- (void)onRegisterICallFailed;
@end

@interface RegisterModelSource : NSObject
@property (nonatomic, weak) id <RegisterModelSourceDelegate> delegate;

- (void)registerWithPhoneNum:(NSString *)phone andPwd:(NSString *)pwd andkey1:(NSString *)key1 andkey2:(NSString *)key2;

- (void)registerICallWithPhoneNum:(NSString *)phone andPwd:(NSString *)pwd;

- (void)upDataPhoneToJianKangeBoLan:(NSString *)username uid:(NSString *)uid andPwd:(NSString *)pwd;

- (void)forgetPasswordWithPhoneNum:(NSString *)phone andkey1:(NSString *)key1 andkey2:(NSString *)key2;

@end
