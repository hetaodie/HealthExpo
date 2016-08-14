//
//  RegisterViewController.m
//  HealthExpo
//
//  Created by zhanyawei on 16/6/22.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "RegisterViewController.h"
#import "UIColor+HEX.h"
#import "UIButton+CountDown.h"
#import "RegisterModelSource.h"
#import "UserInfoManager.h"
#import "HENotificationKey.h"

@interface RegisterViewController ()<RegisterModelSourceDelegate>
@property (weak, nonatomic) IBOutlet UIView *registerPhoneNumBackgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *registerPhoneNumImage;
@property (weak, nonatomic) IBOutlet UITextField *registerPhoneNumTextField;
@property (weak, nonatomic) IBOutlet UIView *checkNumBackgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *checkNumImage;
@property (weak, nonatomic) IBOutlet UITextField *checkNumTextField;
@property (weak, nonatomic) IBOutlet UIView *registerPasswordBackgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *registerPasswordImage;
@property (weak, nonatomic) IBOutlet UITextField *registerPasswordTextField;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIButton *getCheckNumButton;

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *password;

@property (nonatomic, strong) RegisterModelSource *modelSource;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshUI];
    [self adjustNavigationBar];
    
    self.modelSource = [[RegisterModelSource alloc] init];
    self.modelSource.delegate = self;
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
    
    self.navigationItem.title = @"注 册";
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.frame = CGRectMake(0, 0, 30, 30);
    [registerBtn setTitle:@"登录" forState:UIControlStateNormal];
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
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onGetCheckNumButtonClicked:(id)sender {
    [self.getCheckNumButton startWithTime:10 title:@"获取验证码" countDownTile:@"" mainColor:[UIColor colorWithHex:0x00b38a alpha:1] countColor:[UIColor colorWithHex:0xdcdcdc alpha:1]];
}

- (IBAction)onRegisterButtonClicked:(id)sender {
    self.password = self.registerPasswordTextField.text;
    self.userName = self.registerPhoneNumTextField.text;
    
    [self.modelSource registerWithPhoneNum:self.userName andPwd:self.password];
}

- (void)refreshUI{
    self.registerPhoneNumBackgroundView.layer.borderWidth = 1;
    self.registerPhoneNumBackgroundView.layer.borderColor = [[UIColor colorWithHex:0x00b38a alpha:1] CGColor];
    self.registerPhoneNumBackgroundView.layer.cornerRadius = 5.0;
    
    self.checkNumBackgroundView.layer.borderWidth = 1;
    self.checkNumBackgroundView.layer.borderColor = [[UIColor colorWithHex:0x00b38a alpha:1] CGColor];
    self.checkNumBackgroundView.layer.cornerRadius = 5.0;
    
    self.registerPasswordBackgroundView.layer.borderWidth = 1;
    self.registerPasswordBackgroundView.layer.borderColor = [[UIColor colorWithHex:0x00b38a alpha:1] CGColor];
    self.registerPasswordBackgroundView.layer.cornerRadius = 5.0;
    
    self.registerButton.layer.cornerRadius = 5.0;
    self.getCheckNumButton.layer.cornerRadius = 5.0;
}

#pragma mark -- RegisterModelSourceDelegate
- (void)onRegisterSuccess:(NSDictionary *)dict{
    [self.modelSource registerICallWithPhoneNum:self.userName andPwd:self.password];
}

- (void)onRegisterFailed{
    
}

- (void)onRegisterICallSuccess:(NSDictionary *)data{
    if([data[@"err_code"] integerValue] == 0){
        [[UserInfoManager shareManager] registerSuccessWithUserName:self.userName andPassword:self.password andUID:[data[@"uid"] stringValue]];
        [[NSNotificationCenter defaultCenter] postNotificationName:HELogin_Success_Notification object:nil];
    }
}

- (void)onRegisterICallFailed{
    
}

@end
