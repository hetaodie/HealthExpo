//
//  SearchView.h
//  HealthExpo
//
//  Created by Weixu on 16/8/15.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchObject.h"

@protocol SearchViewDelegate <NSObject>

- (void)onSelectSearchData:(SearchObject *)aObject;
- (void)onCancelSearch;

@end

@interface SearchView : UIView

@property (nonatomic,weak) id<SearchViewDelegate> delegate;

- (void)showSearchView;
@end
