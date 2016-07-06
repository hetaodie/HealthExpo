//
//  YiMiaoScheduleViewController.m
//  HealthExpo
//
//  Created by Weixu on 16/7/6.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "YiMiaoScheduleViewController.h"
#import "YiMiaoScheduleCell.h"
#import "YiMiaoDetailViewController.h"
#define YIMiaoCellHeight 75

@interface YiMiaoScheduleViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation YiMiaoScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title = @"疫苗时间表";
    
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return YIMiaoCellHeight;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YiMiaoScheduleCell *cell = (YiMiaoScheduleCell *)[tableView dequeueReusableCellWithIdentifier:@"YiMiaoScheduleCell"];
    if (!cell) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"YiMiaoScheduleCell" owner:nil options:nil];
        cell = [views firstObject];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    YiMiaoDetailViewController *jkbkVC = [[YiMiaoDetailViewController alloc] initWithNibName:@"YiMiaoDetailViewController" bundle:nil];
    jkbkVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:jkbkVC animated:YES];
}
@end
