//
//  YiMiaoScheduleViewController.m
//  HealthExpo
//
//  Created by Weixu on 16/7/6.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "YiMiaoViewController.h"
#import "YiMiaoScheduleCell.h"
#import "YiMiaoDetailViewController.h"
#import "YiMiaoModul.h"

#define YIMiaoCellHeight 75

@interface YiMiaoViewController ()<UITableViewDataSource,UITableViewDelegate,YiMiaoModulDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) YiMiaoModul *yimiaoModul;
@property (strong, nonatomic) NSMutableArray *contentArray;
@end

@implementation YiMiaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title = @"疫苗表";
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12, 21);
    [backBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    _yimiaoModul = [[YiMiaoModul alloc] init];
    self.yimiaoModul.delegate = self;
    
    _contentArray = [[NSMutableArray alloc] init];
    
    [self.yimiaoModul getYImiaoList:self.cid];
    

}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return YIMiaoCellHeight;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = [self.contentArray count];
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YiMiaoScheduleCell *cell = (YiMiaoScheduleCell *)[tableView dequeueReusableCellWithIdentifier:@"YiMiaoScheduleCell"];
    if (!cell) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"YiMiaoScheduleCell" owner:nil options:nil];
        cell = [views firstObject];
    }
    
    YiMiaoObject *object = [self.contentArray objectAtIndex:indexPath.row];
    [cell showCellWithData:object];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    YiMiaoDetailViewController *jkbkVC = [[YiMiaoDetailViewController alloc] initWithNibName:@"YiMiaoDetailViewController" bundle:nil];
    
    YiMiaoObject *object = [self.contentArray objectAtIndex:indexPath.row];
    
    jkbkVC.cid = object.id;
    
    jkbkVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:jkbkVC animated:YES];
}

- (void)onGetYIMiaoListSeccess:(NSArray *)aArray{
    [self.contentArray setArray:aArray];
    [self.tableView reloadData];
}
@end
