//
//  DianZiZaZhiViewController.m
//  HealthExpo
//
//  Created by zhanyawei on 16/7/3.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "DianZiZaZhiViewController.h"

@interface DianZiZaZhiViewController ()

@end

@implementation DianZiZaZhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self adjustNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)adjustNavigationBar{
    [self.navigationController setNavigationBarHidden:NO];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12, 21);
    [backBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    self.navigationItem.title = @"预约挂号";
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 18, 16);
    [rightBtn setImage:[UIImage imageNamed:@"riqi"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(doRightButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.leftBarButtonItem = rightItem;
}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)doRightButtonClicked:(id)sender{
    
}

@end
