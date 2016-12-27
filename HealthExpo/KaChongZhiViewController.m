//
//  KaChongZhiViewController.m
//  HealthExpo
//
//  Created by weixu on 16/11/21.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "KaChongZhiViewController.h"
#import "RechargeModelSource.h"
#import "UIView+Toast.h"


@interface KaChongZhiViewController ()<RechargeModelSourceDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *cardNumTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
@property (nonatomic, retain) RechargeModelSource *modelSource;


@end

@implementation KaChongZhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.modelSource = [[RechargeModelSource alloc] init];
    self.modelSource.delegate = self;
    self.cardNumTextField.delegate = self;
    self.passWordTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)commentBtnPress:(id)sender {
    [self.modelSource onRechargeWithCardNum:self.cardNumTextField.text andCardPassword:self.passWordTextField.text];

}
#pragma mark - rechargeModelSourceDelegate

- (void)onRechargeSuccess:(NSString *)tip{
    [self.view makeToast:tip duration:1.0 position:CSToastPositionCenter];
}

- (void)onRechargeFailed{
    [self.view makeToast:@"充值失败，请重试!" duration:1.0 position:CSToastPositionCenter];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

@end
