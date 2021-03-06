//
//  PhoneCallModelSource.h
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/14.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol PhoneCallModelSourceDelegate <NSObject>


- (void)onPhoneCallSuccess:(NSString *)tipString;

- (void)onPhoneCallFailed:(NSString *)tipString;

@end

@interface PhoneCallModelSource : NSObject

@property (nonatomic, weak) id<PhoneCallModelSourceDelegate> delegate;

- (void)onPhoneCallWithPhoneNum:(NSString *)num;

@end
