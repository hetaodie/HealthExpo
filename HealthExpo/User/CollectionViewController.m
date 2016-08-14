//
//  CollectionViewController.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/14.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionModelSource.h"

@interface CollectionViewController ()<CollectionModelSourceDelegate, UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArr;

@property (nonatomic, strong) CollectionModelSource *modelSource;

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
}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}
#pragma mark - CollectionModelSourceDelegate
- (void)onGetCollectionSuccess:(NSArray *)data{
    self.dataArr = data;
    [self.tableView reloadData];
}

- (void)onGetCollectionFailed{
    
}
@end
