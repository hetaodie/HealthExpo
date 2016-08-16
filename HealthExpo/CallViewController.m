//
//  CallViewController.m
//  HealthExpo
//
//  Created by Weixu on 16/8/16.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "CallViewController.h"
#import "PhoneCallModelSource.h"


@interface CallViewController ()<PhoneCallModelSourceDelegate>
@property (nonatomic,strong) PhoneCallModelSource *callModel;
@property (weak, nonatomic) IBOutlet UILabel *tishiLabel;
@property (weak, nonatomic) IBOutlet UIButton *reCallButton;

@end

@implementation CallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.reCallButton setHidden:NO];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12, 21);
    [backBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    _callModel =[[PhoneCallModelSource alloc] init];
    
    self.callModel.delegate = self;
    
    [self.callModel onPhoneCallWithPhoneNum:self.phoneNum];
}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)reCallBtnPress:(id)sender {
    [self.callModel onPhoneCallWithPhoneNum:self.phoneNum];
    self.tishiLabel.text =@"正在链接，请稍等...";
    [self.reCallButton setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)onPhoneCallSuccess:(NSString *)tipString{
    self.tishiLabel.text = [NSString stringWithFormat:@"%@,正在回拨，请稍等...",tipString];
}

- (void)onPhoneCallFailed{
    self.tishiLabel.text = @"链接是吧，请重试";
    [self.reCallButton setHidden:NO];
}

@end
