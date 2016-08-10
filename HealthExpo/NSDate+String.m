//
//  NSDate+String.m
//  HealthExpo
//
//  Created by zhanyawei on 16/7/6.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "NSDate+String.h"

@implementation NSDate (String)

+ (NSString *)stringFromTimeInterval:(NSTimeInterval)timeInterval{
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:timeInterval/1000];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
//    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT+0800"]];
    NSString *string = [formatter stringFromDate:date];
    return string;
}

@end
