//
//  YilLiaoJiGuoViewController.m
//  HealthExpo
//
//  Created by Weixu on 16/7/6.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "YiLiaoJiGouViewController.h"
#import "YiLiaoJiGouRightView.h"

@interface YiLiaoJiGouViewController ()<YiLiaoJiGouRightViewDelegate>
@property (weak, nonatomic) IBOutlet YiLiaoJiGouRightView *yiLiaoJiGouView;

@end

@implementation YiLiaoJiGouViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.yiLiaoJiGouView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)onYiLiaoJiGouRightViewSelectIndex:(NSUInteger)aIndex{
    
}
@end
