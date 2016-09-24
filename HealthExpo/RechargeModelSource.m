//
//  RechargeModelSource.m
//  HealthExpo
//
//  Created by NetEase-zyw on 16/9/24.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "RechargeModelSource.h"
#import "HENetTask.h"
#import "NSString+MD5.h"
#import "UserInfoManager.h"

@implementation RechargeModelSource
- (NSString *)resultConvert:(NSInteger)code{
    NSString *retString = @"充值成功!";
    switch (code) {
        case 0:
            retString = @"提交成功正在处理中，请在2分钟以后查询余额!";
            break;
        case 1:
            retString = @"错误提示!";
            break;
        case -1:
            retString = @"卡号或密码错误!";
            break;
        case -2:
            retString = @"充值卡无效或已被使用!";
            break;
        case -3:
            retString = @"充值账号错误!";
            break;
        case -4:
            retString = @"已过有效期!";
            break;
        case -5:
            retString = @"充值金额错误!";
            break;
        case -6:
            retString = @"充值卡号格式错误!";
            break;
            
        default:
            break;
    }
    return retString;
}

- (void)onRechargeWithCardNum:(NSString *)num andCardPassword:(NSString *)password{
    UserLoginInfo *info = [[UserInfoManager shareManager] getUserLoginInfo];
     NSString *key = [info.uid stringByAppendingString:@"gytx@#$.com"];
    NSString *url = [NSString stringWithFormat:@"http://pay.hgvoip.com/recharge/service/easypay.php?uid=%@&src=20&paytype=29&goodstype=2&cardno=%@&cardpwd=%@&pv=Iphone&V=2.1.3&sign=%@", info.uid, num, password, key.MD5];
    HENetTask *task = [[HENetTask alloc] initWithTotalUrlString:url];
    __weak __typeof(self) weakSelf = self;
    task.successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onRechargeSuccess:)]) {
            [weakSelf.delegate onRechargeSuccess:[self resultConvert:[responseObject[@"result"] integerValue]]];
        }
    };
    
    task.failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(onRechargeFailed)]) {
            [weakSelf.delegate onRechargeFailed];
        }
    };
    
    [task runInMethod:HE_POST];
    
    
}
@end
