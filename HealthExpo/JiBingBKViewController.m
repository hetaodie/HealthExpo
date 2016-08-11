//
//  JiBingBKViewController.m
//  HealthExpo
//
//  Created by Weixu on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "JiBingBKViewController.h"
#import "JiBingBKLeftView.h"
#import "JiBingBKRightView.h"
#import "JiBingDetailViewController.h"
#import "JiBingModul.h"
@interface JiBingBKViewController ()<JiBingBKRightViewDelegate,JiBingModulDelegate>
@property (weak, nonatomic) IBOutlet JiBingBKLeftView *leftView;
@property (weak, nonatomic) IBOutlet JiBingBKRightView *rightView;

@property (strong, nonatomic) NSMutableDictionary *contentDic;
@property (strong, nonatomic) JiBingModul *modul;

@end

@implementation JiBingBKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title = @"疾病百科";
    self.rightView.delegate = self;
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12, 21);
    [backBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    _modul = [[JiBingModul alloc] init];
    self.modul.delegate = self;
    
    [self.modul getDianXingRenQun];
    
}



- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)onSelectIndex:(NSUInteger)aIndex{
    JiBingDetailViewController *jkdeVC = [[JiBingDetailViewController alloc] initWithNibName:@"JiBingDetailViewController" bundle:nil];
    jkdeVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:jkdeVC animated:YES];
}


- (void)onGetDianXingRenQun:(NSMutableArray *)aArray{
    [self.leftView showContentWithArray:aArray];
}

- (void)onGetDianXingRenQunError{

}

- (void)onGetKeShiFenLeiError{

}

@end
