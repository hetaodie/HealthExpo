//
//  JiBingBKViewController.m
//  HealthExpo
//
//  Created by Weixu on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "JiBingBKViewController.h"
#import "JiBingBKLeftView.h"
#import "JiBingBKRightView.h"
#import "JiBingDetailViewController.h"
#import "JiBingModul.h"
#import "JiBingBKTopView.h"

@interface JiBingBKViewController ()<JiBingBKRightViewDelegate,JiBingModulDelegate,JiBingBKLeftViewDelegate,JiBingBKTopViewDelegate>
@property (weak, nonatomic) IBOutlet JiBingBKLeftView *leftView;
@property (weak, nonatomic) IBOutlet JiBingBKRightView *rightView;

@property (strong, nonatomic) NSMutableDictionary *contentDic;
@property (strong, nonatomic) JiBingModul *modul;
@property (weak, nonatomic) IBOutlet JiBingBKTopView *topView;
@property (nonatomic, assign) NSInteger selectIndex;

@end

@implementation JiBingBKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.selectIndex = 0;
    
    self.navigationItem.title = @"疾病百科";
    
    self.rightView.delegate = self;
    self.leftView.delegate = self;
    self.topView.delegate = self;
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12, 21);
    [backBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    _modul = [[JiBingModul alloc] init];
    self.modul.delegate = self;
    
    [self.modul getDianXingRenQun];
    
}


- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)onSelectButtonOfIndex:(NSInteger)aIndex{
    self.selectIndex = aIndex;
    
    if (aIndex == 0) {
        [self.modul getDianXingRenQun];
    }
    else{
         [self.modul getKeShiFenLei];
    }
}

- (void)onDidSelectLeftView:(ClassifyObject *)aObject index:(NSInteger)aIndex{
    if (self.selectIndex == 0) {
        [self.modul getDianXingRenQunDetail:aObject index:aIndex];
    }
    else{
        [self.modul getKeShiFenLeiDetail:aObject index:aIndex];
    }
}

- (void)onDidSelectRightView:(ClassifyObject *)aObject  index:(NSInteger)aIndex;{
    JiBingDetailViewController *jkdeVC = [[JiBingDetailViewController alloc] initWithNibName:@"JiBingDetailViewController" bundle:nil];
    
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

- (void)onGetDianXingRenQunDetailSeccess:(NSMutableArray *)aArray index:(NSInteger)aIndex{
    [self.rightView showContentWithArray:aArray];
}

- (void)onGetKeShiFenLeiDetailSeccess:(NSMutableArray *)aArray index:(NSInteger)aIndex{
     [self.rightView showContentWithArray:aArray];
}

- (void)onGetDianXingRenQunDetailErrorindex:(NSInteger)aIndex{

}

@end
