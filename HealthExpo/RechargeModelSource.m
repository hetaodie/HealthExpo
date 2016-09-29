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
    NSString *payType = [self getPayTypeWithPhoneNum:info.phone];
    NSString *url = [NSString stringWithFormat:@"http://pay.hgvoip.com/recharge/service/easypay.php?uid=%@&src=20&paytype=%@&goodstype=2&cardno=%@&cardpwd=%@&pv=Iphone&V=2.1.3&sign=%@", info.uid, payType,num, password, key.MD5];
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

- (NSString *)getPayTypeWithPhoneNum:(NSString *)phoneNum{
    PhoneServices service = [self isMobileNumberType:phoneNum];
    NSString *retString = @"29";
    switch (service) {
        case PhoneServices_CU:
            retString = @"36";
            break;
        case PhoneServices_CT:
            retString = @"38";
            break;
        case PhoneServices_None:
            retString = @"98";
            break;
        case PhoneServices_CM:
            
        default:
            retString = @"29";
            break;
    }
    return retString;
}

- (PhoneServices)isMobileNumberType:(NSString *)mobileNum
{
    if (mobileNum.length != 11)
    {
        return NO;
    }
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     * 联通号段: 130,131,132,155,156,185,186,145,176,1709
     * 电信号段: 133,153,180,181,189,177,1700
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|70)\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     */
    NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
    /**
     * 中国联通：China Unicom
     * 130,131,132,155,156,185,186,145,176,1709
     */
    NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
    /**
     * 中国电信：China Telecom
     * 133,153,180,181,189,177,1700
     */
    NSString *CT = @"(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    PhoneServices retService = PhoneServices_None;
    if ([regextestmobile evaluateWithObject:mobileNum] == YES){
        if (([regextestcm evaluateWithObject:mobileNum] == YES)) {
            retService = PhoneServices_CM;
        } else if ([regextestct evaluateWithObject:mobileNum] == YES){
            retService = PhoneServices_CT;
        } else if ([regextestcu evaluateWithObject:mobileNum] == YES){
            retService = PhoneServices_CU;
        }
    }
    return retService;
}
@end
