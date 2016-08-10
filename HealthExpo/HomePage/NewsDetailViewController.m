//
//  NewsDetailViewController.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/10.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "NewsDetailModelSource.h"

@interface NewsDetailViewController ()<NewsDetailModelSourceDelegate>

@property (nonatomic, strong)NewsDetailModelSource *modelSource;
@property (nonatomic, strong)NSArray *dataArray;
@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self adjustNavigationBar];
    
    self.modelSource = [[NewsDetailModelSource alloc] init];
    self.modelSource.delegate = self;
    [self.modelSource getNewsDetailModelSource:self.newsID];
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
    
    self.navigationItem.title = @"新闻";
}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- NewsDetailModelSourceDelegate
- (void)getNewsDetailModelSourceSuccess:(NSArray *)dataArr{
    
}

- (void)getNewsDetailModelSourceFailed{
    
}

@end
