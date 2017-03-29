//
//  CallViewController.m
//  HealthExpo
//
//  Created by Weixu on 16/8/16.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "CallViewController.h"
#import "PhoneCallModelSource.h"
#import "PhoneModelSource.h"
#import "CycleBannersView.h"

#import <CoreTelephony/CTCallCenter.h>
#import <CoreTelephony/CTCall.h>

@interface CallViewController ()<PhoneCallModelSourceDelegate,PhoneModelSourceDelegate>
@property (nonatomic,strong) PhoneCallModelSource *callModel;
@property (weak, nonatomic) IBOutlet UILabel *tishiLabel;
@property (weak, nonatomic) IBOutlet UIButton *reCallButton;

@property (nonatomic, strong) CTCallCenter *callCenter;
@property (weak, nonatomic) IBOutlet UILabel *bigNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *smallNumLabel;
@property (nonatomic, strong) PhoneModelSource *modelSource;

@property (weak, nonatomic) IBOutlet CycleBannersView *cycleBannersView;
@property (weak, nonatomic) IBOutlet UIImageView *adImageView;
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
    [self.navigationController setNavigationBarHidden:NO];
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12, 21);
    [backBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    _callModel =[[PhoneCallModelSource alloc] init];
    self.bigNumLabel.text = self.phoneNum;
    self.smallNumLabel.text = self.phoneNum;
    
    self.callModel.delegate = self;
    if ([Comment isUseNetPhone]) {
        [self.callModel onPhoneCallWithPhoneNum:self.phoneNum];
        self.modelSource = [[PhoneModelSource alloc] init];
        self.modelSource.delegate = self;
        [self.modelSource getADBanners];
    }
    else{
        NSString *phoneStr = [NSString stringWithFormat:@"tel://%@",self.phoneNum];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneStr]];
    }
    //[self.callModel onPhoneCallWithPhoneNum:self.phoneNum];
     [self.reCallButton setHidden:YES];
    
    self.navigationItem.title = @"便民电话";
}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)reCallBtnPress:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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

- (void)getADBannersSuccess:(NSDictionary *)dict{
    
    NSArray *allPics = [dict allKeys];
    if ([allPics count]>0) {
        self.cycleBannersView.hidden = NO;
        self.adImageView.hidden = YES;
        [self.cycleBannersView showBannersWithBannersArray:allPics];
        
    }
    else{
        self.cycleBannersView.hidden = YES;
        self.adImageView.hidden = NO;
    }
    
}

- (void)getADBannersFailed{
    self.cycleBannersView.hidden = YES;
    self.adImageView.hidden = NO;
}


@end
