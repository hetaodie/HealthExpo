//
//  UserSettingViewController.m
//  HealthExpo
//
//  Created by zhanyawei on 16/6/28.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "UserSettingViewController.h"
#import "UserSettingTableViewCell.h"
#import "HENotificationKey.h"
#import "UserInfoManager.h"
#import "UserEditViewController.h"

@interface UserSettingViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation UserSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self adjustNavigationBar];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
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
    
    self.navigationItem.title = @"设 置";
}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onLogOutButtonClicked:(id)sender {
    [[UserInfoManager shareManager] clearLoginKeys];
    [[NSNotificationCenter defaultCenter] postNotificationName:HELogout_Notification object:nil userInfo:nil];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    UserSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserSettingTableViewCell"];
    if (!cell) {
        cell = [UserSettingTableViewCell cellFromNib];
    }
    
    if (row == 0) {
        cell.titleLabel.text = @"重新设置电话";
    } else if (row == 1){
        cell.titleLabel.text = @"修改密码";
    } else if (row == 2){
        cell.titleLabel.text = @"清理缓存";
    } else if (row == 3){
        cell.titleLabel.text = @"帮助与反馈";
    } else if (row == 4){
        cell.titleLabel.text = @"关于本系统";
        cell.separatorLine.hidden = YES;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UserEditViewController *ueVC = [[UserEditViewController alloc] initWithNibName:@"UserEditViewController" bundle:nil];
        ueVC.hidesBottomBarWhenPushed = YES;
        ueVC.editType = HEEditPhone;
        ueVC.editTitle = @"电话";
        [self.navigationController pushViewController:ueVC animated:YES];
    }
}
@end
