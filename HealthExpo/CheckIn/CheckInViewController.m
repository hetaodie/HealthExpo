//
//  CheckInViewController.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/6/24.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "CheckInViewController.h"
#import "CheckInModelSource.h"
#import "UIView+Toast.h"

@interface CheckInViewController ()<CheckInModelSourceDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *coverImageView;
@property (strong, nonatomic) IBOutlet UILabel *descLabel;

@property (nonatomic, strong) CheckInModelSource *modelSouce;

@end

@implementation CheckInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self adjustNavigationBar];
    self.descLabel.text = @"1.每个用户每日只能签到一次\n2.签到后会有随机的话费奖励";
    
    self.modelSouce = [[CheckInModelSource alloc] init];
    self.modelSouce.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)adjustNavigationBar{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12, 21);
    //    [backBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    //    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    self.navigationItem.title = @"签 到";
}

- (IBAction)checkInButtonClicked:(id)sender {
    [self.modelSouce onCheckInRequst];
}

#pragma mark -- CheckInModelSourceDelegate
- (void)onCheckInSuccess:(NSDictionary *)dict{
    [self.view makeToast:dict[@"err_msg"] duration:0.8 position:CSToastPositionCenter];
}

- (void)onCheckInFailed{
    
}

@end
