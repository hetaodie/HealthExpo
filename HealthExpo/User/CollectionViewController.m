//
//  CollectionViewController.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/14.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionModelSource.h"
#import "NewsDetailViewController.h"

@interface CollectionViewController ()<CollectionModelSourceDelegate, UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) CollectionModelSource *modelSource;

@property (nonatomic, strong) UIButton *editButton;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self adjustNavigationBar];
    self.modelSource = [[CollectionModelSource alloc] init];
    self.modelSource.delegate = self;
    [self.modelSource getCollectionRequest];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)adjustNavigationBar{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12, 21);
    [backBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    self.navigationItem.title = @"我的收藏";
    
    self.editButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.editButton.frame = CGRectMake(0, 0, 30, 30);
    [self.editButton setTitle:@"编辑" forState:UIControlStateNormal];
    self.editButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.editButton addTarget:self action:@selector(onEditButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *registerItem = [[UIBarButtonItem alloc] initWithCustomView:self.editButton];
    self.navigationItem.rightBarButtonItem = registerItem;
}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)onEditButtonClicked:(UIButton *)button{
    if (self.tableView.editing) {
        [self.tableView setEditing:NO];
        [self.editButton setTitle:@"编辑" forState:UIControlStateNormal];
    } else {
        [self.tableView setEditing:YES];
        [self.editButton setTitle:@"完成" forState:UIControlStateNormal];
    }
    
}
#pragma mark - UITableViewDelegate && UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CollectionViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CollectionViewCell"];
    }
    NSDictionary *dict = self.dataArr[indexPath.row];
    cell.textLabel.text = dict[@"ctitle"];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSDictionary *dict = self.dataArr[indexPath.row];
        [self.modelSource cancelCollection:[dict[@"id"] stringValue]];
        [self.dataArr removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
     NSDictionary *dict = self.dataArr[indexPath.row];
    NewsDetailViewController *ndVC = [[NewsDetailViewController alloc] initWithNibName:@"NewsDetailViewController" bundle:nil];
    ndVC.newsID = [dict[@"cid"] stringValue];
    ndVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:ndVC animated:YES];
}

#pragma mark - CollectionModelSourceDelegate
- (void)onGetCollectionSuccess:(NSArray *)data{
    self.dataArr = [NSMutableArray arrayWithArray:data];
    [self.tableView reloadData];
}

- (void)onGetCollectionFailed{
    
}

- (void)cancelCollectionSuccess:(NSDictionary *)dict{
    
}

- (void)cancelCollectionFailed{
    
}
@end
