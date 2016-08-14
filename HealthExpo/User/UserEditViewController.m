//
//  UserEditViewController.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/14.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "UserEditViewController.h"
#import "UserInfoManager.h"

@interface UserEditViewController ()
@property (strong, nonatomic) IBOutlet UITextField *editText;
@property (nonatomic, strong) UserInfo *userInfo;
@end

@implementation UserEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self adjustNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.userInfo = [[UserInfoManager shareManager] userInfoFromUserDefaults];
    [self.editText becomeFirstResponder];
    
    switch (self.editType) {
        case HEEditName:
            self.editText.text = self.userInfo.userName;
            break;
        case HEEditPhone:
            self.editText.text = self.userInfo.phone;
            break;
        case HEEditBirthday:
            self.editText.text = self.userInfo.birthday;
            break;
        case HEEditEmail:
            self.editText.text = self.userInfo.email;
            break;
        case HEEditAddress:
            self.editText.text = self.userInfo.address;
            break;
        default:
            break;
    }
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.editText resignFirstResponder];
    
    switch (self.editType) {
        case HEEditName:
            self.userInfo.userName = self.editText.text;
            break;
        case HEEditPhone:
            self.userInfo.phone = self.editText.text;
            break;
        case HEEditBirthday:
            self.userInfo.birthday = self.editText.text;
            break;
        case HEEditEmail:
            self.userInfo.email = self.editText.text;
            break;
        case HEEditAddress:
            self.userInfo.address = self.editText.text;
            break;
        default:
            break;
    }
    
    [[UserInfoManager shareManager] saveEditedUserInfo:self.userInfo];
}

- (void)adjustNavigationBar{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12, 21);
    [backBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    self.navigationItem.title = [NSString stringWithFormat:@"编辑%@", _editTitle];
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.frame = CGRectMake(0, 0, 30, 30);
    [registerBtn setTitle:@"确定" forState:UIControlStateNormal];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    //    [registerBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *registerItem = [[UIBarButtonItem alloc] initWithCustomView:registerBtn];
    self.navigationItem.rightBarButtonItem = registerItem;
}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
