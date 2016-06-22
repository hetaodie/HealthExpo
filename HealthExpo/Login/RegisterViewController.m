//
//  RegisterViewController.m
//  HealthExpo
//
//  Created by zhanyawei on 16/6/22.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
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

@end

@implementation RegisterViewController

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

- (IBAction)onGetCheckNumButtonClicked:(id)sender {
}

- (IBAction)onRegisterButtonClicked:(id)sender {
}

- (void)refreshUI{
    
}
@end
