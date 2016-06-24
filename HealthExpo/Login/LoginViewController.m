//
//  LoginViewController.m
//  HealthExpo
//
//  Created by zhanyawei on 16/6/22.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()
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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    
}

- (IBAction)onForgetPasswordButtonClicked:(id)sender {
    //TODO 忘记密码view
}

- (IBAction)onLoginButtonClicked:(id)sender {
    NSString *userName = self.phoneNumTextField.text;
    NSString *password = self.passwordTextField.text;
    
    //TODO 校验 跳转
}

- (void)refreshUI{
    
}

@end
