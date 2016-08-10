//
//  DianZiZaZhiDetailViewController.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/10.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "DianZiZaZhiDetailViewController.h"
#import "DianZiZaZhiDetailModelSource.h"

@interface DianZiZaZhiDetailViewController ()<DianZiZaZhiDetailModelSourceDelegate>
@property DianZiZaZhiDetailModelSource *modelSource;
@end

@implementation DianZiZaZhiDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self adjustNavigationBar];
    
    self.modelSource = [[DianZiZaZhiDetailModelSource alloc] init];
    self.modelSource.delegate = self;
    [self.modelSource getDianZiZaZhiDetailWithID:self.detailID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fillDetailID:(NSString *)cID andTitle:(NSString *)title{
    self.detailID = cID;
    self.topTitle = title;
}

- (void)adjustNavigationBar{
    [self.navigationController setNavigationBarHidden:NO];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12, 21);
    [backBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    self.navigationItem.title = self.topTitle;
    
//    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    rightBtn.frame = CGRectMake(0, 0, 18, 16);
//    [rightBtn setImage:[UIImage imageNamed:@"riqi"] forState:UIControlStateNormal];
//    [rightBtn addTarget:self action:@selector(doRightButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
//    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark -- DianZiZaZhiDetailModelSourceDelegate
- (void)getDianZiZaZhiDetailSuccess:(NSArray *)dataArr{
    
}

- (void)getDianZiZaZhiDetailFailed{
    
}
@end
