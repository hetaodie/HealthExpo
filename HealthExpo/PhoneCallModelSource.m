//
//  PhoneCallModelSource.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/14.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "PhoneCallModelSource.h"
#import "HENetTask.h"
#import "NSString+MD5.h"
#import "UserInfoManager.h"

@interface PhoneCallModelSource ()
@property (nonatomic, strong) NSDictionary *resultDict;
@end

@implementation PhoneCallModelSource

- (instancetype)init{
    self = [super init];
    if (self) {
        self.resultDict = @{@"0":@"呼叫成功",
                            @"-1":@"账户余额查找失败，请重新登录",
                            @"-2":@"密码错误请重新登录",
                            @"-3":@"呼叫的号码错误或者短号对应的号码不存在",
                            @"-4":@"绑定手机号查找失败，请重新登录",
                            @"-6":@"信号错误",
                            @"-8":@"你的账户已过有效期，须充值登录",
                            @"-9":@"余额不足，请充值",
                            @"-10":@"账户已被冻结，请联系客服人员!",
                            @"-11":@"后台程序错误",
                            @"-12":@"后台程序错误",
                            @"-13":@"后台程序错误"};
    }
    return self;
}

- (void)onPhoneCallWithPhoneNum:(NSString *)num{

    UserLoginInfo *info = [[UserInfoManager shareManager] getUserLoginInfo];
    NSString *key = [info.uid stringByAppendingString:@"gytx@#$.com"];
    NSString *url = [NSString stringWithFormat:@"http://mob.scback.cn:8899/call?sign=%@&called=%@&uid=%@&v=1.0&pv=Iphone&pwd=%@&echo=1", key.MD5, num, info.uid, info.pwmPassWord];
    HENetTask *task = [[HENetTask alloc] initWithTotalUrlString:url];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        NSString *tipString = self.resultDict[responseObject[@"result"]];
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onPhoneCallSuccess:)]) {
            NSString *responseID = responseObject[@"result"];
            if ([responseID isEqualToString:@"0"]) {
                [weakSelf.delegate onPhoneCallSuccess:tipString];
            }
            else{
               [weakSelf.delegate onPhoneCallFailed:tipString];
            }

        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onPhoneCallFailed:)]) {
            [weakSelf.delegate onPhoneCallFailed:@"网络连接失败"];
        }
    };
    
    [task runInMethod:HE_GET];


}
@end
