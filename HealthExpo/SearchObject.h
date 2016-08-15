//
//  SearchObject.h
//  HealthExpo
//
//  Created by Weixu on 16/8/15.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, SEARCHTYPE) {
    NEWS = 1,
    JIBING =2,
    YILIAOJIGOU =3,
    ZAZHI =4,
    YIMIAO =5,
    MINGYI =11,
    ZASHIMULU =12
};


@interface SearchObject : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, assign) SEARCHTYPE searchtype;
@end
