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

@interface JiBingBKViewController ()<JiBingBKRightViewDelegate>
@property (weak, nonatomic) IBOutlet JiBingBKLeftView *leftView;
@property (weak, nonatomic) IBOutlet JiBingBKRightView *rightView;

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
