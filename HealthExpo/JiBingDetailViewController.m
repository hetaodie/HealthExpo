//
//  JiBingDetailViewController.m
//  HealthExpo
//
//  Created by Weixu on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "JiBingDetailViewController.h"
#import "JiBingDetailmodul.h"
#import "JiBingInfoView.h"
#import "MessageInfoView.h"
#import "LiuYanModul.h"

@interface JiBingDetailViewController () <JiBingDetailmodulDelegete,LiuYanModulDelegate>
@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (strong, nonatomic) JiBingDetailmodul *modul;
@property (strong, nonatomic) LiuYanModul *liuYanModul;

@property (weak, nonatomic) IBOutlet JiBingInfoView *jibingInfoView;
@property (weak, nonatomic) IBOutlet MessageInfoView *MessageInfoView;


@end

@implementation JiBingDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.searchView.layer.cornerRadius = 15;
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12, 21);
    [backBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    _modul = [[JiBingDetailmodul alloc] init];
    self.modul.delegate = self;
    [self.modul getJiBingDetailWithCid:self.cid];
    
    _liuYanModul = [[LiuYanModul alloc] init];
    self.liuYanModul.delegate = self;

    [self.liuYanModul getLiyanList:self.cid];
    [self.liuYanModul setjibingLiuYan:nil];
    [self.liuYanModul liuYanReply:nil];
    
}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)houtuiButtonPress:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)onGetJiBingDetailSeccess:(JiBingDetailObject *)aObject{
    [self.jibingInfoView showViewWithObject:aObject];
}

- (void)onGetJiBingDetailError{

}

- (void)onGetLiyanListSeccess:(NSMutableArray *)aArray{
    [self.MessageInfoView showViewWithArray:aArray];
}

- (void)onGetLiyanListError{

}

@end
