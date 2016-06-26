//
//  rescourceDown.h
//  IcallSDkDemo
//
//  Created by yingzhijie2 on 16/3/5.
//  Copyright (c) 2016年 yingzhijie2. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol rescourceDelegate <NSObject>

-(void)registResult:(NSDictionary *)resultDic withError:(NSString *)errMsg;

@end

@interface rescourceDown : UIViewController
@property (nonatomic,assign) id<rescourceDelegate>delegate;


//注册登录
-(void)requestForRegistNum:(NSString *)nametext andPwd:(NSString *)pwdtext withAgentId:(NSString *)agentid;

//充值
-(void)requestForRechargeWithCard:(NSString *)cardNum password:(NSString *)cardPwd;

//账号查询
-(void)requestAccountBalanceUrl;


//回拨
- (void)call:(NSString *)address displayName:(NSString*)displayName;


@end
