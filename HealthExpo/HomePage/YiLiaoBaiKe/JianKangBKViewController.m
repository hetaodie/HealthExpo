//
//  JianKangBKViewController.m
//  HealthExpo
//
//  Created by zhanyawei on 16/7/3.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "JianKangBKViewController.h"
#import "JianKangBKTableViewCell.h"

@interface JianKangBKViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation JianKangBKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self adjustNavigationBar];
    self.searchView.layer.cornerRadius = 15;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    
    self.navigationItem.title = @"健康百科";
}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JianKangBKTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JianKangBKTableViewCell"];
    if (!cell) {
        cell = [JianKangBKTableViewCell cellFromNib];;
    }
    if (indexPath.row == 0) {
        [cell fillCellImage:[UIImage imageNamed:@"jibingbaike"] title:@"疾病百科"];
    } else if (indexPath.row == 1){
        [cell fillCellImage:[UIImage imageNamed:@"yimiaoshijianbiao"] title:@"疫苗时间表"];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
@end
