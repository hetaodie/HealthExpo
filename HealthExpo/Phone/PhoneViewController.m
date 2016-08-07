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

@end

@implementation PhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.phoneNumLabel.layer.cornerRadius = 15;
    self.phoneNumLabel.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- button action
- (IBAction)tongXunLuClicked:(id)sender {
    [[CustomTabBarController getInstance] clickAtIndex:2];
}

- (IBAction)deleteClicked:(id)sender {
    [self deleteAphoneNum];
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
