//
//  PhoneModelSource.h
//  TestAFNetWorking
//
//  Created by hzzhanyawei on 16/8/11.
//  Copyright © 2016年 hzzhanyawei. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PhoneModelSourceDelegate <NSObject>
- (void)getADBannersSuccess:(NSDictionary *)dict;
- (void)getADBannersFailed;


@end

@interface PhoneModelSource : NSObject

@property (nonatomic, weak) id<PhoneModelSourceDelegate> delegate;

- (void)getADBanners;

@end
