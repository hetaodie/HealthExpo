//
//  HomePageViewController.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/6/24.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageCommonTableViewCell.h"
#import "HomePagePictureTableViewCell.h"
#import "JianKangBKViewController.h"
#import "GuaHaoViewController.h"
#import "HomePageModelSource.h"

#import "YiLiaoJiGouViewController.h"

@interface HomePageViewController ()<UITableViewDelegate, UITableViewDataSource, HomePageModelSourceDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (nonatomic, strong) HomePageModelSource *dataSource;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchView.layer.cornerRadius = 15;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.dataSource = [[HomePageModelSource alloc] init];
    self.dataSource.delegate = self;
    [self.dataSource getHomePageNews];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    // Dispose of any resources that can be recreated.
}

#pragma mark - UIButtonClickedAction

- (IBAction)onTopMsgClicked:(id)sender {
}
- (IBAction)onBaiKeClicked:(id)sender {
    JianKangBKViewController *jkbkVC = [[JianKangBKViewController alloc] initWithNibName:@"JianKangBKViewController" bundle:nil];
    jkbkVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:jkbkVC animated:YES];
}
- (IBAction)onJiGouClicked:(id)sender {
    YiLiaoJiGouViewController *jkbkVC = [[YiLiaoJiGouViewController alloc] initWithNibName:@"YiLiaoJiGuoViewController" bundle:nil];
    jkbkVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:jkbkVC animated:YES];
}
- (IBAction)onZaZhiClicked:(id)sender {
}
- (IBAction)onGuaHaoClicked:(id)sender {
    GuaHaoViewController *ghVC = [[GuaHaoViewController alloc] initWithNibName:@"GuaHaoViewController" bundle:nil];
    ghVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:ghVC animated:YES];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 170;
    } else {
        return 95;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        HomePagePictureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomePagePictureTableViewCell"];
        if (!cell) {
            cell = [HomePagePictureTableViewCell cellFromNib];
        }
        [cell fillCellWithData:self.dataArray[indexPath.row]];
        return cell;
    } else {
        HomePageCommonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomePageCommonTableViewCell"];
        if (!cell) {
            cell = [HomePageCommonTableViewCell cellFromNib];
        }
        [cell fillCellWithData:self.dataArray[indexPath.row]];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - HomePageModelSourceDelegate
- (void)getHomePageNewsFailed{
    
}
- (void)getHomePageNewsSuccess:(NSArray *)dataArray{
    self.dataArray = dataArray;
    [self.tableView reloadData];
}

@end
