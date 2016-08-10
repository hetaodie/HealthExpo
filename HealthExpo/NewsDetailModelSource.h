//
//  NewsDetailModelSource.h
//  TestAFNetWorking
//
//  Created by hzzhanyawei on 16/8/10.
//  Copyright © 2016年 hzzhanyawei. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol NewsDetailModelSourceDelegate <NSObject>
- (void)getNewsDetailModelSourceSuccess:(NSArray *)dataArr;
- (void)getNewsDetailModelSourceFailed;
@end

@interface NewsDetailModelSource : NSObject
@property (nonatomic, weak) id<NewsDetailModelSourceDelegate> delegate;

- (void)getNewsDetailModelSource:(NSString *)cID;
@end
