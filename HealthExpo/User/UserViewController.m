//
//  UserViewController.m
//  HealthExpo
//
//  Created by zhanyawei on 16/6/26.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "UserViewController.h"
#import "UserInfoCommonTableViewCell.h"
#import "UserInfoImageTableViewCell.h"
#import "UserInfoManager.h"
#import "UserSettingViewController.h"

@interface UserViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *topUserCover;
@property (weak, nonatomic) IBOutlet UILabel *topUserName;
@property (weak, nonatomic) IBOutlet UILabel *topUserPhoneNum;
@property (weak, nonatomic) IBOutlet UILabel *storeNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneFareLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) UserInfo *userInfo;

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.userInfo = [[UserInfoManager shareManager] userInfoFromUserDefaults];
    
    [self refreshTopView];
    [self adjustNavigationBar];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate && UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UserInfoImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserInfoImageTableViewCell"];
        if (!cell) {
            cell = [UserInfoImageTableViewCell cellFromNib];
        }
        [cell fillCellWithTitle:@"头像" andImage:self.userInfo.cover];
        return cell;
    } else {
        UserInfoCommonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserInfoCommonTableViewCell"];
        if (!cell) {
            cell = [UserInfoCommonTableViewCell cellFromNib];
        }
        if (indexPath.row == 1) {
            [cell fillCellWithTitle:@"名字" andDescription:self.userInfo.userName];
        } else if (indexPath.row == 2){
            [cell fillCellWithTitle:@"电话" andDescription:self.userInfo.phone];
        } else if (indexPath.row == 3){
            [cell fillCellWithTitle:@"性别" andDescription:self.userInfo.gender];
        } else if (indexPath.row == 4){
            [cell fillCellWithTitle:@"生日" andDescription:self.userInfo.birthday];
        } else if (indexPath.row == 5){
            [cell fillCellWithTitle:@"邮箱" andDescription:self.userInfo.email];
        } else if (indexPath.row == 6){
            [cell fillCellWithTitle:@"地址" andDescription:self.userInfo.address];
        }
        return cell;
    }
}

#pragma mark - private Func 

- (void)adjustNavigationBar{
    self.navigationItem.title = @"我 的";
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.frame = CGRectMake(0, 0, 30, 30);
    [registerBtn setTitle:@"设置" forState:UIControlStateNormal];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    //    [registerBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(doSetting:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *registerItem = [[UIBarButtonItem alloc] initWithCustomView:registerBtn];
    self.navigationItem.rightBarButtonItem = registerItem;
}

- (void)doSetting:(id)sender{
    UserSettingViewController *usVC = [[UserSettingViewController alloc] initWithNibName:@"UserSettingViewController" bundle:nil];
    [self.navigationController pushViewController:usVC animated:YES];
}

- (void)refreshTopView{
    self.topUserCover.image = _userInfo.cover;
    self.topUserName.text = _userInfo.userName;
    self.topUserPhoneNum.text = _userInfo.phone;
}

@end
