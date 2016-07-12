//
//  SpeakerMessageItem.h
//  TestAFNetWorking
//
//  Created by hzzhanyawei on 16/7/8.
//  Copyright © 2016年 hzzhanyawei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpeakerMessageItem : NSObject
@property (nonatomic, assign) NSInteger catID;
@property (nonatomic, assign) NSInteger cmpID;
@property (nonatomic, strong) NSString *contentText;
@property (nonatomic, strong) NSString *createdDate;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) BOOL isShow;
@property (nonatomic, assign) NSInteger orderNum;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, assign) NSInteger pYear;
@property (nonatomic, strong) NSString *showName;
@property (nonatomic, strong) NSString *sTitle;
@property (nonatomic, assign) NSInteger sType;
@property (nonatomic, strong) NSString *templateCode;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSInteger viewNum;
@end
