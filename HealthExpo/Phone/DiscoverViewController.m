//
//  DiscoverViewController.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/7.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "DiscoverViewController.h"
#import "TextTableViewCell.h"
#import "PictureTableViewCell.h"

@interface DiscoverViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self adjustNavigationBar];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //假数据
    self.dataArray = @[[UIImage imageNamed:@"discover01"], [UIImage imageNamed:@"discover02"]];
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
    
    self.navigationItem.title = @"发 现";
}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- tableViewDelegate && tableViewDatasource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;//根据返回数据更改
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    if (row == 0) {
        TextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextTableViewCell"];
        if (!cell) {
            cell = [TextTableViewCell cellFromNib];
        }
//        [cell fillTitleLabel:@""];
        return cell;
    } else {
        PictureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PictureTableViewCell"];
        if (!cell) {
            cell = [PictureTableViewCell cellFromNib];
        }
        [cell fillCoverWithImage:self.dataArray[row -1]];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
