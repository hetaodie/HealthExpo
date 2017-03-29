//
//  Comment.m
//  HealthExpo
//
//  Created by weixu on 2017/2/23.
//  Copyright © 2017年 AllWantsLab. All rights reserved.
//

#import "Comment.h"

@implementation Comment

+ (NSDate *)stringToDate:(NSString *)strdate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];// NSString的时间格式
    NSDate *retdate = [dateFormatter dateFromString:strdate];
    return retdate;
}

+(BOOL)isUseNetPhone{
    NSDate *currentDate = [NSDate date];
    
    NSString *strDate = @"2017-03-17 08:00:00";
    
    NSDate *disDate = [self stringToDate:strDate];
    NSComparisonResult result = [currentDate compare:disDate];
    switch(result){
        case NSOrderedSame:
            NSLog(@"对象时间等于参数时间");
            return YES;
            break;
        case NSOrderedAscending:
            NSLog(@"对象时间早于参数时间");
            return NO;
            break;
        case NSOrderedDescending:
            NSLog(@"对象时间晚于参数时间");
            return YES;
            break;
    }
    return NO;
}
@end
