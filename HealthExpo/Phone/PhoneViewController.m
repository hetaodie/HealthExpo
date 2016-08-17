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
#import "UIView+Toast.h"
#import "UIButton+WebCache.h"
#import "CallViewController.h"

@interface PhoneViewController ()<PhoneModelSourceDelegate>
@property (strong, nonatomic) IBOutlet UITextField *phoneNumText;

@property (nonatomic, strong) NSString *phoneNum;
@property (strong, nonatomic) IBOutlet UIView *topView;
@property (strong, nonatomic) IBOutlet UIScrollView *topBannerScrollView;
@property (strong, nonatomic) IBOutlet UIView *topbannerContaintView;
@property (nonatomic, strong) NSTimer *bannerTimer;
@property (strong, nonatomic) IBOutlet UIButton *banner0;
@property (strong, nonatomic) IBOutlet UIButton *banner1;
@property (strong, nonatomic) IBOutlet UIButton *banner2;
@property (strong, nonatomic) IBOutlet UIButton *banner3;
@property (strong, nonatomic) IBOutlet UIButton *banner4;
@property (strong, nonatomic) IBOutlet UIButton *banner5;
@property (strong, nonatomic) IBOutlet UIButton *banner6;
@property (strong, nonatomic) IBOutlet UIButton *banner7;

@property (nonatomic, strong) PhoneModelSource *modelSource;

@property (nonatomic, strong) NSDictionary *bannersDict;

@end

@implementation PhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.phoneNumLabel.layer.cornerRadius = 15;
//    self.phoneNumLabel.clipsToBounds = YES;
    
    self.modelSource = [[PhoneModelSource alloc] init];
    self.modelSource.delegate = self;
    [self.modelSource getADBanners];
    

    for (NSInteger i = 0; i < 7; i ++) {
        NSString *buttonName = [NSString stringWithFormat:@"banner%zd",i];
        UIButton *button = [self valueForKey:buttonName];
        
        button.imageView.contentMode = UIViewContentModeScaleToFill;
    }
    
    UIView* dummyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    dummyView.backgroundColor = [UIColor clearColor];
    self.phoneNumText.inputView = dummyView;//不显示键盘，显示光标。

    [self bannerCycleSetting];
}

- (void)vieDidAppear:(BOOL)animated{
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
//    [[CustomTabBarController getInstance] clickAtIndex:2];
    if (self.phoneNum.length >= 2 && self.phoneNum.length <= 11) {
        CallViewController *vc = [[CallViewController alloc] initWithNibName:@"CallViewController" bundle:nil];
        vc.phoneNum = self.phoneNum;
        [self.navigationController pushViewController:vc animated:YES];
    }
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
        self.phoneNumText.text = _phoneNum;
    }
}
- (void)deleteAphoneNum{
    if(_phoneNum.length > 0){
        self.phoneNum = [_phoneNum substringToIndex:(_phoneNum.length-1)];
        self.phoneNumText.text = _phoneNum;
    }
}

#pragma mark - banner ScrollView handler
- (IBAction)onBannerClicked:(UIButton *)sender {
    NSArray *allUrls = [self.bannersDict allValues];
    
    if (sender.tag < allUrls.count) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:allUrls[sender.tag]]];
    }    
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
- (void)getADBannersSuccess:(NSDictionary *)dict{
    self.bannersDict = dict;
    NSArray *allPics = [dict allKeys];
    UIImage *placeHolderImage = [UIImage imageNamed:@"banner"];
    for (NSInteger i = 0; i < allPics.count; i ++) {
        NSString *buttonName = [NSString stringWithFormat:@"banner%zd",i];
        UIButton *button = [self valueForKey:buttonName];
        
        [button sd_setImageWithURL:allPics[i] forState:UIControlStateNormal placeholderImage:placeHolderImage];
    }
    
}

- (void)getADBannersFailed{
    
}

#pragma mark -- PhoneCallModelSourceDelegate
- (void)onPhoneCallSuccess:(NSString *)tipString{
    [self.view makeToast:tipString duration:0.8 position:CSToastPositionCenter];
}

- (void)onPhoneCallFailed{
    [self.view makeToast:@"呼叫失败" duration:0.8 position:CSToastPositionCenter];

}

@end
