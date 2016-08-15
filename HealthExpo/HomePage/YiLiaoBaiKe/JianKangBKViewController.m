//
//  JianKangBKViewController.m
//  HealthExpo
//
//  Created by zhanyawei on 16/7/3.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "JianKangBKViewController.h"
#import "JianKangBKTableViewCell.h"
#import "JiBingBKViewController.h"
#import "YiMiaoScheduleViewController.h"
#import "SearchView.h"
#import "PushViewControllerWithSearchData.h"

@interface JianKangBKViewController ()<UITableViewDataSource, UITableViewDelegate,SearchViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet SearchView *searchViewShow;

@end

@implementation JianKangBKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self adjustNavigationBar];
    self.searchView.layer.cornerRadius = 15;
    self.searchViewShow.delegate = self;
    
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

- (IBAction)searchBtnPress:(id)sender {
    [self.searchViewShow showSearchView];
     [self.navigationController setNavigationBarHidden:YES];
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
    NSInteger row = indexPath.row;
    if(row ==0){
        JiBingBKViewController *jkbkVC = [[JiBingBKViewController alloc] initWithNibName:@"JiBingBKViewController" bundle:nil];
        jkbkVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:jkbkVC animated:YES];
    }
    else{
        YiMiaoScheduleViewController *yimiaoVC = [[YiMiaoScheduleViewController alloc] initWithNibName:@"YiMiaoScheduleViewController" bundle:nil];
        yimiaoVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:yimiaoVC animated:YES];
    }
}

- (void)onSelectSearchData:(SearchObject *)aObject{
     [self.navigationController setNavigationBarHidden:NO];
    
    [PushViewControllerWithSearchData pushViewControllerWithdata:aObject oldViewController:self];
}

- (void)onCancelSearch{
    [self.navigationController setNavigationBarHidden:NO];
}
@end
