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

@interface HomePageViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIButtonClickedAction

- (IBAction)onTopMsgClicked:(id)sender {
}
- (IBAction)onBaiKeClicked:(id)sender {
}
- (IBAction)onJiGouClicked:(id)sender {
}
- (IBAction)onZaZhiClicked:(id)sender {
}
- (IBAction)onGuaHaoClicked:(id)sender {
}

#pragma mark - UITableViewDelegate && UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
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
//        [cell fillCellImage:<#(UIImage *)#> title:<#(NSString *)#>]
        return cell;
    } else {
        HomePageCommonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomePageCommonTableViewCell"];
        if (!cell) {
            cell = [HomePageCommonTableViewCell cellFromNib];
        }
        //filldata
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
