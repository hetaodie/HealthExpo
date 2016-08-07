//
//  PhoneViewController.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/6/24.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "PhoneViewController.h"
#import "CustomTabBarController.h"

@interface PhoneViewController ()
@property (strong, nonatomic) IBOutlet UILabel *phoneNumLabel;
@property (nonatomic, strong) NSString *phoneNum;
@property (strong, nonatomic) IBOutlet UIScrollView *topBannerScrollView;

@end

@implementation PhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    self.phoneNumLabel.layer.cornerRadius = 15;
    self.phoneNumLabel.clipsToBounds = YES;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -- button action
- (IBAction)tongXunLuClicked:(id)sender {
    [[CustomTabBarController getInstance] clickAtIndex:2];
}

- (IBAction)deleteClicked:(id)sender {
    [self deleteAphoneNum];
}

- (IBAction)onDiscoverClicked:(id)sender {
    [[CustomTabBarController getInstance] clickAtIndex:0];
}

- (IBAction)onChargeClicked:(id)sender {
}

- (IBAction)onShareClicked:(id)sender {
}

- (IBAction)onContactsClicked:(id)sender {
    [[CustomTabBarController getInstance] clickAtIndex:2];
}

#pragma mark -- phone Num action
- (IBAction)onPhoneNumClicked:(UIButton *)sender {
    [self updatePhoneNum:sender.titleLabel.text];
}

#pragma mark -- private Func
- (void)updatePhoneNum:(NSString *)aNum{
    if (!_phoneNum) {
        self.phoneNum = [NSString string];
    }
    if (_phoneNum.length <= 11) {
        self.phoneNum = [_phoneNum stringByAppendingString:aNum];
        self.phoneNumLabel.text = _phoneNum;
    }
}
- (void)deleteAphoneNum{
    if(_phoneNum.length > 0){
        self.phoneNum = [_phoneNum substringToIndex:(_phoneNum.length-1)];
        self.phoneNumLabel.text = _phoneNum;
    }
}

@end
