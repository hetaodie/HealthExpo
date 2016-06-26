//
//  StringsUtils.h
//  linphone
//
//  Created by aicall on 13-5-31.
//
//

#import <Foundation/Foundation.h>

#define phoneNumReg @"^[1][3-8]+\\d{9}$"


#define phone_key @"phone"
#define pwd_key @"pwd"
#define agent_id_key @"agent_id"
#define agent_id_value  [[NSBundle mainBundle] objectForInfoDictionaryKey:@"agent_id"]
#define v_key @"v"
//#define v_value @"2.1.8"
#define v_value     [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]
#define app_displayName  [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]
#define pv_key @"pv"
#define pv_value @"iphone"
#define uid_key @"uid"
#define sc_key @"sc"



#define username_preference @"username_preference"
#define password_preference @"password_preference"
#define calltype_preference @"calltype_preference"
#define shownumtype_preference @"shownumtype_preference" 
#define changenum_preference @"changenum_preference"
#define backpwd_preference @"backpwd_preference"
#define retakepwd_preference @"retakepwd_preference"
#define agent_id_preference @"agent_id_preference"
#define uid_preference @"uid_preference" 
#define update_addr_preference @"update_addr_preference"
#define user_type_preference @"user_type_preference"
#define call_number_preference @"call_number_preference"
#define call_displayName_preference @"call_displayName_preference"
#define news_preference  @"news_preference"
#define service_phone_preference @"service_phone_preference"
#define server_ctrl_preference @"server_ctrl_preference"

#define msg_syslist @"syslist"
#define msg_update_addr @"update_addr"
#define msg_id @"id"
#define msg_title @"title"
#define msg_content @"content"
#define msg_service_phone @"service_phone"
#define msg_server_ctrl @"sysctrl"

#define CALL_UPDATE_CODE @"call_update_code"                    //回拨呼叫广播
#define CALL_CONNECTION_START @"call_connection_start"    //加载动画
#define CALL_CONNECTION_END @"call_connection_end"             //loading动画取消

#define GET_USER_TYPE @"get_user_type"


#define sign_key @"sign"



#define tagsAliasSetting   DefaulTagsAliasSetting

#define dialerView_pageChange   @"changeDialerViewPage"         //切换拨号、通话记录页面



#define ICLightGrayColor [UIColor colorWithRed:0.91 green:0.91 blue:0.91 alpha:1.00]
#define  windowHeight  [UIScreen mainScreen].bounds.size.height
#define  windowWidth  [UIScreen mainScreen].bounds.size.width


@interface StringsUtils : NSObject

+(NSString*) get_pwd:(NSString*) tmpIn;
+(int) getResultForJson:(NSData*)data;
+(id) getResultForJson:(NSData*)data key:(NSString*) k;
+(id) getResultForJsonArrays:(NSString*)data key:(NSString*) k;
+(NSString *)toMD5:(NSString*) to ;

+(NSString *)toRemoteAddress:(NSString *)normalAddrss;      //number转remoteAddress
+(NSString *)toNormalAddress:(NSString *)remoteAddress; //remoteAddress 转普通号码

+(NSString *)URLEncodeString:(NSString *)URLString;     //URLEncode编码，请求URL会有敏感字符

+(BOOL)isRegiste;
+(NSString *)fileNameFromURLString:(NSString *)urlString;
+(NSString *)currentDateFromInterval:(double)interval;          //时间戳，转成当前事件 fromat
+(NSString *)currentDateOfTodayFormatter;           /**< 当前日期格式YYYY-MM-DD */

+(BOOL)callWaitingSoundExist:(NSString *)urlString;
+(NSString *)waitingSoundPath;

+(void)setJPushTagAlias;

+(void)callWithWebviewForPhone:(NSString *)telNum;

+(void)dismissAccount;    /**<注销账号 */


@end
