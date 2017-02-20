//
//  ForgetPassWordSource.h
//  HealthExpo
//
//  Created by weixu on 2017/2/12.
//  Copyright © 2017年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ForgetPassWordSourceDelegate <NSObject>

- (void)onForgetPassword:(NSString *)password;
- (void)onForgetPassworderrer;
@end

@interface ForgetPassWordSource : NSObject
@property (nonatomic, weak) id <ForgetPassWordSourceDelegate>delegate;

- (void)forgetPasswordWithPhoneNum:(NSString *)phone andkey1:(NSString *)key1 andkey2:(NSString *)key2;

@end
