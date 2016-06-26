//
//  UserdefaultAction.h
//  siphone-changAppDe
//
//  Created by yingzhijie on 15/6/4.
//  Copyright (c) 2015年 英之杰讯邦网络科技. All rights reserved.
//

#import <Foundation/Foundation.h>

#define  waitingSoundName  @"wait_sound-fileName"
#define  verifyCodeValue       @"verify_code"  //验证码

@interface UserdefaultAction : NSObject

+(UserdefaultAction *)instance;

-(NSString *)getUserLoginAccountName;
-(NSString *)getUserLoginPassword;

-(NSString *)getUserLoginAccountUId;
-(NSString *)getUserLoginPostPwdString;
-(NSString *)getUserLoginPostCodeString;

-(BOOL)storeObject:(id)object forKey:(id)key;

-(id)getObjectForKey:(id)key;

-(BOOL)removeObjectForKey:(id)key;

@end
