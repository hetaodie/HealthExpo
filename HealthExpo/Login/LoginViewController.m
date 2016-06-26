//
//  LoginViewController.m
//  HealthExpo
//
//  Created by zhanyawei on 16/6/22.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "UIColor+HEX.h"

#import "rescourceDown.h"

@interface LoginViewController ()<rescourceDelegate>
@property (weak, nonatomic) IBOutlet UIView *phoneNumBackgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *phoneNumImage;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTextField;
@property (weak, nonatomic) IBOutlet UIView *passwordBackgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *passwordImage;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *forgetPasswordButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self adjustNavigationBar];
    [self refreshUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    
}

- (void)adjustNavigationBar{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12, 21);
    [backBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    self.navigationItem.title = @"登 录";
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.frame = CGRectMake(0, 0, 30, 30);
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
//    [registerBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(gotoRegister:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *registerItem = [[UIBarButtonItem alloc] initWithCustomView:registerBtn];
    self.navigationItem.rightBarButtonItem = registerItem;
}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)gotoRegister:(id)sender{
    RegisterViewController *registerVC = [[RegisterViewController alloc] initWithNibName:@"RegisterViewController" bundle:nil];
    [self.navigationController pushViewController:registerVC animated:YES];
}

- (IBAction)onForgetPasswordButtonClicked:(id)sender {
    //TODO 忘记密码view
}

- (IBAction)onLoginButtonClicked:(id)sender {
    NSString *userName = self.phoneNumTextField.text;
    NSString *password = self.passwordTextField.text;
    //TODO 校验 跳转
    
    
    //测试登录
    rescourceDown *rD = [[rescourceDown alloc] init];
    rD.delegate = self;
    [rD requestForRegistNum:@"sdkceshi" andPwd:@"888888" withAgentId:@"1"];
}

//测试icallsdk
- (void)registResult:(NSDictionary *)resultDic withError:(NSString *)errMsg{
    NSLog(@"resultDic desc %@, errMsg is %@", resultDic.description, errMsg);
}

- (void)refreshUI{
    self.phoneNumBackgroundView.layer.borderWidth = 1;
    self.phoneNumBackgroundView.layer.borderColor = [[UIColor colorWithHex:0x00b38a alpha:1] CGColor];
    self.phoneNumBackgroundView.layer.cornerRadius = 5.0;
    
    self.passwordBackgroundView.layer.borderWidth = 1;
    self.passwordBackgroundView.layer.borderColor = [[UIColor colorWithHex:0x00b38a alpha:1] CGColor];
    self.passwordBackgroundView.layer.cornerRadius = 5.0;
    
    self.loginButton.layer.cornerRadius = 5.0;
}

@end
