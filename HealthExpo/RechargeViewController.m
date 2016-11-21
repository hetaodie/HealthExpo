//
//  RechargeViewController.m
//  HealthExpo
//
//  Created by NetEase-zyw on 16/9/24.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "RechargeViewController.h"
#import "UIColor+HEX.h"
#import "RechargeModelSource.h"
#import "UIView+Toast.h"

#import "ZhiFuBaoViewController.h"

@interface RechargeViewController ()<RechargeModelSourceDelegate>
@property (weak, nonatomic) IBOutlet UIView *cardNumView;
@property (weak, nonatomic) IBOutlet UITextField *cardNum;
@property (weak, nonatomic) IBOutlet UITextField *cardPassword;
@property (weak, nonatomic) IBOutlet UIView *cardPasswordView;
@property (weak, nonatomic) IBOutlet UIButton *commitButton;

@property (nonatomic, retain) RechargeModelSource *modelSource;

@end

@implementation RechargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self adjustNavigationBar];
    [self refreshUI];
    [self.navigationController setNavigationBarHidden:NO];
    self.modelSource = [[RechargeModelSource alloc] init];
    self.modelSource.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onCommitButtonClicked:(id)sender {
//    self.password = self.registerPasswordTextField.text;
//    self.userName = self.registerPhoneNumTextField.text;
//    
//    [self.modelSource registerWithPhoneNum:self.userName andPwd:self.password];
    [self.modelSource onRechargeWithCardNum:self.cardNum.text andCardPassword:self.cardPassword.text];
}


- (void)adjustNavigationBar{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12, 21);
    [backBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    self.navigationItem.title = @"支  付";
    
}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)refreshUI{
    self.cardNumView.layer.borderWidth = 1;
    self.cardNumView.layer.borderColor = [[UIColor colorWithHex:0x00b38a alpha:1] CGColor];
    self.cardNumView.layer.cornerRadius = 5.0;

    self.cardPasswordView.layer.borderWidth = 1;
    self.cardPasswordView.layer.borderColor = [[UIColor colorWithHex:0x00b38a alpha:1] CGColor];
    self.cardPasswordView.layer.cornerRadius = 5.0;

    
    self.commitButton.layer.cornerRadius = 5.0;
    self.commitButton.layer.cornerRadius = 5.0;
}

#pragma mark - rechargeModelSourceDelegate

- (void)onRechargeSuccess:(NSString *)tip{
     [self.view makeToast:tip duration:1.0 position:CSToastPositionCenter];
}

- (void)onRechargeFailed{
     [self.view makeToast:@"充值失败，请重试!" duration:1.0 position:CSToastPositionCenter];
}

- (IBAction)zhifubaobtnPress:(id)sender {
    ZhiFuBaoViewController *rVC = [[ZhiFuBaoViewController alloc] initWithNibName:@"ZhiFuBaoViewController" bundle:nil];
    rVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:rVC animated:YES];

}

- (IBAction)kachongzhibtnPress:(id)sender {
    
}

@end
