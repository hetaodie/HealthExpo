//
//  ClassifyObject.h
//  HealthExpo
//
//  Created by Weixu on 16/8/10.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ClassifyObject : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, assign) NSInteger pid;
@property (nonatomic, copy) NSString *defaultImageUrl;
@property (nonatomic, copy) NSString *selectImageUrl;
@property (nonatomic, strong) UIImage *defaultImage;
@property (nonatomic, strong) UIImage *selectImage;
@property (nonatomic, strong) NSMutableArray *contentArray;

@end
