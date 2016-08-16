//
//  YilLiaoJiGuoViewController.m
//  HealthExpo
//
//  Created by Weixu on 16/7/6.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "YiLiaoJiGouViewController.h"
#import "YiLiaoJiGouRightView.h"
#import "JiBingBKTopView.h"
#import "YiLiaoJiGouModul.h"
#import "YiLiaoJiGouLeftView.h"
#import "YiLiaoJiGouRightView.h"
#import "YiYuanViewController.h"
#import "JiBingBKTopView.h"

@interface YiLiaoJiGouViewController ()<YiLiaoJiGouRightViewDelegate,YiLiaoJiGouModulDelegate,YiLiaoJiGouLeftViewDelegate,YiLiaoJiGouRightViewDelegate,JiBingBKTopViewDelegate>

@property (weak, nonatomic) IBOutlet YiLiaoJiGouRightView *yiLiaoJiGouView;
@property (weak, nonatomic) IBOutlet JiBingBKTopView *topView;

@property (nonatomic, strong) YiLiaoJiGouModul *modul;
@property (weak, nonatomic) IBOutlet YiLiaoJiGouLeftView *leftView;
@property (weak, nonatomic) IBOutlet YiLiaoJiGouRightView *rightView;

@property (nonatomic, assign) NSInteger selectIndex;

@end

@implementation YiLiaoJiGouViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.selectIndex = 0;
    
    self.navigationItem.title = @"医疗机构";
    
    self.rightView.delegate = self;
    self.leftView.delegate = self;

    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12, 21);
    [backBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    

    
    self.yiLiaoJiGouView.delegate = self;
    

    [self.topView setViewLeftName:@"按地区" andRightName:@"按科室"];
    
    self.topView.delegate = self;

    self.leftView.delegate = self;
    self.rightView.delegate = self;
    
    _modul = [[YiLiaoJiGouModul alloc] init];
    self.modul.delegate = self;
    
    [self.modul getDiQu];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)onYiLiaoJiGouRightViewSelectIndex:(NSUInteger)aIndex{
    
}


- (void)onGetDiQuSeccess:(NSMutableArray *)aArray{
    [self.leftView showContentWithArray:aArray];
}


- (void)onGetDiQuError{


}

- (IBAction)doBack:(id)sender {
     [self.navigationController popViewControllerAnimated:YES];
}


- (void)onSelectButtonOfIndex:(NSInteger)aIndex{
    self.selectIndex = aIndex;
    
    if (aIndex == 0) {
        [self.modul getDiQu];
    }
    else{
        [self.modul getKeShiFenLei];
    }
}

- (void)onDidSelectLeftView:(DiQunObject *)aObject index:(NSInteger)aIndex{
    if (self.selectIndex == 0) {
        [self.modul getDiQuDetail:aObject index:aIndex];
    }
    else{
        [self.modul getKeShiFenLeiDetail:aObject index:aIndex];
    }
}

- (void)onYiLiaoJiGouRightView:(JiGouRightObject *)aObject SelectIndex:(NSUInteger)aIndex{
    YiYuanViewController *jkdeVC = [[YiYuanViewController alloc] initWithNibName:@"YiYuanViewController" bundle:nil];
    
    jkdeVC.cid = aObject.id;
    jkdeVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:jkdeVC animated:YES];
}


- (void)onGetDianXingRenQun:(NSMutableArray *)aArray{
    [self.leftView showContentWithArray:aArray];
}

- (void)onGetKeShiFenLei:(NSMutableArray *)aArray{
    [self.leftView showContentWithArray:aArray];
}

- (void)onGetDianXingRenQunError{
    
}

- (void)onGetKeShiFenLeiError{
    
}

- (void)onGetDiQuDetailSeccess:(NSMutableArray *)aArray index:(NSInteger)aIndex{
    [self.rightView showContentWithArray:aArray];
}

- (void)onGetKeShiFenLeiDetailSeccess:(NSMutableArray *)aArray index:(NSInteger)aIndex{
    [self.rightView showContentWithArray:aArray];
}

- (void)onGetDiQuDetailErrorindex:(NSInteger)aIndex{
    
}
@end
