//
//  MIngYiViewController.m
//  HealthExpo
//
//  Created by Weixu on 16/8/15.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "MIngYiViewController.h"
#import "MingYIDetailModul.h"
#import "UIView+Toast.h"
#import "CallViewController.h"
@interface MIngYiViewController ()<MingYIDetailModulDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *zhichengLabel;
@property (weak, nonatomic) IBOutlet UILabel *yiyuanLabel;
@property (weak, nonatomic) IBOutlet UILabel *shanchangLabel;
@property (weak, nonatomic) IBOutlet UILabel *jianjieLabel;
@property (weak, nonatomic) IBOutlet UIButton *dianhua1Button;

@property (weak, nonatomic) IBOutlet UIButton *dianhua2Button;
@property (strong, nonatomic) MingYIDetailModul *modul;


@end

@implementation MIngYiViewController

- (void)viewDidLoad {
    
    self.navigationItem.title = self.yiyuanTitle;
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12, 21);
    [backBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    
    [super viewDidLoad];
    _modul = [[MingYIDetailModul alloc] init];
    self.modul.delegate =self;
    [self.modul getMingYiDetial:self.cid];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)doBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)dianhuaBtnPress:(id)sender {
    UIButton *button = (UIButton *)sender;
    NSString *title = [button titleForState:UIControlStateNormal];
    
    
    CallViewController *vc = [[CallViewController alloc] initWithNibName:@"CallViewController" bundle:nil];
    vc.phoneNum = title;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)onGetMingYiDetialSeccess:(MingYiDetailObject *)aObject{
    self.titleLabel.text =aObject.title;
    self.zhichengLabel.text = aObject.zhicheng;
    self.yiyuanLabel.text = aObject.yiyuan;
    self.shanchangLabel.text =aObject.shanchang;
    self.jianjieLabel.text = aObject.jianjie;
    [self.dianhua1Button setTitle:aObject.phone forState:UIControlStateNormal];
    [self.dianhua2Button setTitle:aObject.phone forState:UIControlStateNormal];
    self.yiyuanLabel.text = self.yiyuanTitle;
}


- (void)onGetMingYiDetialError{

}

@end
