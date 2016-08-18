//
//  TouGaoViewController.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/18.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "TouGaoViewController.h"

@interface TouGaoViewController ()

@end

@implementation TouGaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self adjustNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)adjustNavigationBar{
    [self.navigationController setNavigationBarHidden:NO];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12, 21);
    [backBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    self.navigationItem.title = @"我要投稿";
}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
