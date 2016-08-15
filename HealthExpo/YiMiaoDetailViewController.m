//
//  YiMiaoDetailViewController.m
//  HealthExpo
//
//  Created by Weixu on 16/7/6.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "YiMiaoDetailViewController.h"
#import "YiMiaoModul.h"
#import "MessageInfoView.h"
#import "YiMiaoDetailView.h"
#import "LiuYanModul.h"
#import "MessageReplyView.h"
#import "UserInfoManager.h"
#import "UserInfo.h"
#import "UIView+Toast.h"
#import "SearchView.h"
#import "PushViewControllerWithSearchData.h"

@interface YiMiaoDetailViewController () <YiMiaoModulDelegate,MessageInfoViewDelegate,LiuYanModulDelegate,MessageReplyViewDelegate,SearchViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *searchView;

@property (strong, nonatomic) YiMiaoModul *yimiaoModul;
@property (strong, nonatomic) NSMutableArray *contentArray;
@property (weak, nonatomic) IBOutlet YiMiaoDetailView *detailView;
@property (weak, nonatomic) IBOutlet MessageInfoView *MessageInfoView;

@property (strong, nonatomic) LiuYanModul *liuYanModul;
@property (weak, nonatomic) IBOutlet MessageReplyView *messageReplyView;
@property (assign, nonatomic) NSInteger messageOrReplay;   // 0 表示是留言， 1 表示是回复
@property (strong, nonatomic) LiuYanObject *replayLiuYanObject;

@property (weak, nonatomic) IBOutlet SearchView *searchContentView;
@end

@implementation YiMiaoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchView.layer.cornerRadius = 15;
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12, 21);
    [backBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    _yimiaoModul = [[YiMiaoModul alloc] init];
    self.yimiaoModul.delegate = self;
    
    [self.yimiaoModul getyimiaoDetail:self.cid];
    
    _liuYanModul = [[LiuYanModul alloc] init];
    self.liuYanModul.delegate = self;
    
    [self.liuYanModul getLiyanList:self.cid];
    
    self.MessageInfoView.delegate = self;
    self.messageReplyView.delegate = self;
    
    self.searchContentView.delegate = self;
}

- (IBAction)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
     [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onGetyimiaoDetailSeccess:(YiMiaoDetailObject *)aObject{
    [self.detailView showViewWithData:aObject];
}

- (void)onGetyimiaoDetailError{
    
}

- (void)onGetLiyanListSeccess:(NSMutableArray *)aArray{
    [self.MessageInfoView showViewWithArray:aArray];
}

- (void)onGetLiyanListError{
    
}

- (IBAction)searchBtnPress:(id)sender {
    [self.searchContentView showSearchView];
}

- (void)onBtnMessagePress{
    self.messageReplyView.hidden = NO;
    self.messageOrReplay = 0;
}

- (void)onSendMessageBtnPress:(NSString *)content{
    
    if (self.messageOrReplay == 0) {
        LiuYanObject *object = [[LiuYanObject alloc] init];
        
        UserLoginInfo *info = [[UserInfoManager shareManager] getUserLoginInfo];
        object.id =self.cid;
        object.username = info.userName;
        object.phone = info.phone;
        object.content = content;
        
        [self.liuYanModul setjibingLiuYan:object];
        [self.messageReplyView setHidden:YES];
    }
    else{
        
        self.replayLiuYanObject.content = content;
        [self.liuYanModul liuYanReply:self.replayLiuYanObject];
        [self.messageReplyView setHidden:YES];
    }
    
}

- (void)onDeleteMessageWithObject:(LiuYanObject *)aObject{
    [self.liuYanModul cexiaoLiuYan:aObject];
}

- (void)onReplayMessageWithObject:(LiuYanObject *)aObject{
    self.messageOrReplay = 1;
    self.replayLiuYanObject = aObject;
}

- (void)oncexiaoSeccess{
    [self.liuYanModul getLiyanList:self.cid];
}

- (void)oncexiaoError{
    
}

#pragma mark -- PhoneCallModelSourceDelegate
- (void)onPhoneCallSuccess:(NSString *)tipString{
    [self.view makeToast:tipString duration:0.8 position:CSToastPositionCenter];
}

- (void)onPhoneCallFailed{
    [self.view makeToast:@"呼叫失败" duration:0.8 position:CSToastPositionCenter];
    
}

- (void)onSelectSearchData:(SearchObject *)aObject{
    [PushViewControllerWithSearchData pushViewControllerWithdata:aObject oldViewController:self];
}

@end
