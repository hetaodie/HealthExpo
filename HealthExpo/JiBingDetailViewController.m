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
#import "MessageReplyView.h"
#import "LiuYanObject.h"

@interface JiBingDetailViewController () <JiBingDetailmodulDelegete,LiuYanModulDelegate,MessageInfoViewDelegate,MessageReplyViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (strong, nonatomic) JiBingDetailmodul *modul;
@property (strong, nonatomic) LiuYanModul *liuYanModul;

@property (weak, nonatomic) IBOutlet JiBingInfoView *jibingInfoView;
@property (weak, nonatomic) IBOutlet MessageInfoView *MessageInfoView;
@property (weak, nonatomic) IBOutlet MessageReplyView *messageReplyView;


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
//    [self.liuYanModul setjibingLiuYan:nil];
//    [self.liuYanModul liuYanReply:nil];
    
    self.MessageInfoView.delegate = self;
    self.messageReplyView.delegate = self;
    
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


- (void)onBtnMessagePress{
    self.messageReplyView.hidden = NO;
}

- (void)onSendMessageBtnPress:(NSString *)content{
    LiuYanObject *object = [[LiuYanObject alloc] init];
    object.id =self.cid;
    object.username = @"weixu";
    object.phone = @"15067152144";
    object.content = content;
    
    [self.liuYanModul setjibingLiuYan:object];
    [self.messageReplyView setHidden:YES];
}
@end
