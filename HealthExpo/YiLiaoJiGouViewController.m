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

@interface YiLiaoJiGouViewController ()<YiLiaoJiGouRightViewDelegate,YiLiaoJiGouModulDelegate,YiLiaoJiGouLeftViewDelegate,YiLiaoJiGouRightViewDelegate>

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
    
    self.yiLiaoJiGouView.delegate = self;
    
    [self.topView setViewLeftName:@"按地区" andRightName:@"按科室"];
    
    self.leftView.delegate = self;
    self.rightView.delegate = self;
    
    _modul = [[YiLiaoJiGouModul alloc] init];
    self.modul.delegate = self;
    
    [self.modul getDiQu];
    
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


- (void)onSelectButtonOfIndex:(NSInteger)aIndex{
    self.selectIndex = aIndex;
    
    if (aIndex == 0) {
        [self.modul getDiQu];
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
//    JiBingDetailViewController *jkdeVC = [[JiBingDetailViewController alloc] initWithNibName:@"JiBingDetailViewController" bundle:nil];
//    
//    jkdeVC.cid = aObject.id;
//    jkdeVC.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:jkdeVC animated:YES];
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
//    [self.rightView showContentWithArray:aArray];
}

- (void)onGetKeShiFenLeiDetailSeccess:(NSMutableArray *)aArray index:(NSInteger)aIndex{
//    [self.rightView showContentWithArray:aArray];
}

- (void)onGetDianXingRenQunDetailErrorindex:(NSInteger)aIndex{
    
}
@end
