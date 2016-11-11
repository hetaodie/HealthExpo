//
//  SubmissionViewController.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/10.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "SubmissionViewController.h"
#import "SubmissionModelSource.h"
#import "LiuYanModul.h"
#import "MessageInfoView.h"
#import "MessageReplyView.h"
#import "UserInfo.h"
#import "UserInfoManager.h"
#import "UITextView+HtmlString.h"

@interface SubmissionViewController ()<SubmissionModelSourceDelegate, LiuYanModulDelegate, MessageInfoViewDelegate, MessageReplyViewDelegate,UIWebViewDelegate>

@property (nonatomic, strong)SubmissionModelSource *modelSource;

@property (nonatomic, strong) NSString *titleText;
@property (nonatomic, assign) BOOL isSubMission;//yes 为我要投稿，no 为广告合作。
@property (weak, nonatomic) IBOutlet UIWebView *contentWebView;
@property (strong, nonatomic) IBOutlet UITextView *descLabel;

@property (strong, nonatomic) LiuYanModul *liuYanModul;

@property (weak, nonatomic) IBOutlet MessageInfoView *MessageInfoView;
@property (weak, nonatomic) IBOutlet MessageReplyView *messageReplyView;

@property (assign, nonatomic) NSInteger messageOrReplay;   // 0 表示是留言， 1 表示是回复
@property (strong, nonatomic) LiuYanObject *replayLiuYanObject;

@property (nonatomic, assign) NSInteger cid;

//@property (nonatomic, strong)

@end

@implementation SubmissionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self adjustNavigationBar];
    
    self.modelSource = [[SubmissionModelSource alloc] init];
    self.modelSource.delegate = self;
    
    _liuYanModul = [[LiuYanModul alloc] init];
    self.liuYanModul.delegate = self;
    
    if (self.isSubMission) {
        [self.modelSource getSubmissionData];
        [self.liuYanModul getLiyanList:1000];//自定义1000对应投稿
        self.cid = 1000;
    } else {
        [self.modelSource getCooperateData];
        [self.liuYanModul getLiyanList:1001];//自定义1001对应招商。
        self.cid = 1001;
    }
   
    self.MessageInfoView.delegate = self;
    self.messageReplyView.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fillTitle:(NSString *)title andIsSubssion:(BOOL)isSub{
    self.titleText = title;
    self.isSubMission = isSub;
}

- (void)adjustNavigationBar{
    [self.navigationController setNavigationBarHidden:NO];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12, 21);
    [backBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    self.navigationItem.title = self.titleText;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- SubmissionModelSourceDelegate
- (void)getSubmissionDataSuccess:(NSDictionary *)data{
    //[self.descLabel showTextWithHtmlString:data[@"contenttext"]];
    
    [self.contentWebView loadHTMLString:data[@"contenttext"] baseURL:nil];

}

- (void)getSubmissionDataFailed{
    
}

- (void)getCooperateDataSuccess:(NSDictionary *)data{
    NSString *content = data[@"contenttext"];
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[content dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    self.descLabel.attributedText = attributedString;
}

- (void)getCooperateDataFailed{
    
}

#pragma mark -- 留言

- (void)onGetJiBingDetailError{
    
}

- (void)onGetLiyanListSeccess:(NSMutableArray *)aArray{
    [self.MessageInfoView showViewWithArray:aArray];
}

- (void)onGetLiyanListError{
    
}


- (void)onBtnMessagePress{
    self.messageReplyView.hidden = NO;
    self.messageOrReplay = 0;
}

- (void)onSendMessageBtnPressName:(NSString *)name phone:(NSString *)phone content:(NSString *)content{
    if (self.messageOrReplay == 0) {
        LiuYanObject *object = [[LiuYanObject alloc] init];

        object.id =self.cid;
        object.username = name;
        object.phone = phone;
        
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


- (void)webViewDidFinishLoad:(UIWebView *)webView{
    // NSString *jsString = [[NSString alloc] initWithFormat:@"document.body.style.fontSize=%f;document.body.style.color=%@",12.0f,[UIColor redColor]];
    NSString *jsString = @"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '60%'";
    
    [webView stringByEvaluatingJavaScriptFromString:jsString];
}

@end
