//
//  CallViewController.m
//  HealthExpo
//
//  Created by Weixu on 16/8/16.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "CallViewController.h"
#import "PhoneCallModelSource.h"

#import <CoreTelephony/CTCallCenter.h>
#import <CoreTelephony/CTCall.h>

@interface CallViewController ()<PhoneCallModelSourceDelegate>
@property (nonatomic,strong) PhoneCallModelSource *callModel;
@property (weak, nonatomic) IBOutlet UILabel *tishiLabel;
@property (weak, nonatomic) IBOutlet UIButton *reCallButton;

@property (nonatomic, strong) CTCallCenter *callCenter;
@end

@implementation CallViewController

- (void)monitorCallCenter{
    
    __weak __typeof(self) weakSelf = self;
    
    _callCenter = [[CTCallCenter alloc] init];
    self.callCenter.callEventHandler = ^(CTCall* call) {
        if ([call.callState isEqualToString:CTCallStateDisconnected])
        {
            NSLog(@"Call has been disconnected");
        }
        else if ([call.callState isEqualToString:CTCallStateConnected])
        {
            NSLog(@"Call has just been connected");
        }
        else if([call.callState isEqualToString:CTCallStateIncoming])
        {
            NSLog(@"Call is incoming");
            [weakSelf doBack:nil];
        }
        else if ([call.callState isEqualToString:CTCallStateDialing])
        {
            NSLog(@"call is dialing");
        }
        else  
        {  
            NSLog(@"Nothing is done");  
        }  
    };
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self monitorCallCenter];

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
     [self.reCallButton setHidden:YES];
}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)reCallBtnPress:(id)sender {
    [self.callModel onPhoneCallWithPhoneNum:self.phoneNum];
    self.tishiLabel.text =@"正在连接，请稍等...";
    [self.reCallButton setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)onPhoneCallSuccess:(NSString *)tipString{
    self.tishiLabel.text = [NSString stringWithFormat:@"%@,正在回拨，请稍等...",tipString];
     [self.reCallButton setHidden:YES];
}

- (void)onPhoneCallFailed:(NSString *)tipString{
    self.tishiLabel.text = [NSString stringWithFormat:@"%@",tipString];
    [self.reCallButton setHidden:NO];
}

@end
