//
//  PhoneViewController.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/6/24.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "PhoneViewController.h"
#import "CustomTabBarController.h"
#import "DiscoverViewController.h"
#import "PhoneModelSource.h"

@interface PhoneViewController ()<PhoneModelSourceDelegate>
@property (strong, nonatomic) IBOutlet UILabel *phoneNumLabel;
@property (nonatomic, strong) NSString *phoneNum;
@property (strong, nonatomic) IBOutlet UIView *topView;
@property (strong, nonatomic) IBOutlet UIScrollView *topBannerScrollView;
@property (strong, nonatomic) IBOutlet UIView *topbannerContaintView;
@property (nonatomic, strong) NSTimer *bannerTimer;
@property (strong, nonatomic) IBOutlet UIButton *firstBanner;
@property (strong, nonatomic) IBOutlet UIButton *secondBanner;
@property (strong, nonatomic) IBOutlet UIButton *thirdBanner;
@property (strong, nonatomic) IBOutlet UIButton *fourthBanner;
@property (strong, nonatomic) IBOutlet UIButton *fifthBanner;
@property (strong, nonatomic) IBOutlet UIButton *sixthBanner;
@property (strong, nonatomic) IBOutlet UIButton *seventhBanner;
@property (strong, nonatomic) IBOutlet UIButton *eighthBanner;

@property (nonatomic, strong) PhoneModelSource *modelSource;

@end

@implementation PhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.phoneNumLabel.layer.cornerRadius = 15;
    self.phoneNumLabel.clipsToBounds = YES;
    
    self.modelSource = [[PhoneModelSource alloc] init];
    self.modelSource.delegate = self;
    [self.modelSource getADBanners];
    
    [self bannerCycleSetting];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
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
    DiscoverViewController *dVC = [[DiscoverViewController alloc] initWithNibName:@"DiscoverViewController" bundle:nil];
    dVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:dVC animated:YES];
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

#pragma mark - banner ScrollView handler
- (IBAction)onBannerClicked:(id)sender {
    
}


- (void)bannerCycleSetting{
    self.bannerTimer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(cycleShowBanner) userInfo:nil repeats:YES];
}

- (void)cycleShowBanner{
    CGFloat offsetX = self.topBannerScrollView.contentOffset.x + self.topBannerScrollView.frame.size.width;
    if (offsetX >= self.topBannerScrollView.contentSize.width) {
        offsetX = 0.0;
         [self.topBannerScrollView setContentOffset:CGPointMake(offsetX, 0.0) animated: NO];
    } else {
        [self.topBannerScrollView setContentOffset:CGPointMake(offsetX, 0.0) animated:YES];
    }    
}

#pragma mark -- PhoneModelSourceDelegate
- (void)getADBannersSuccess:(NSArray *)dataArr{
    
}

- (void)getADBannersFailed{
    
}

@end
