//
//  DianZiZaZhiViewController.m
//  HealthExpo
//
//  Created by zhanyawei on 16/7/3.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "DianZiZaZhiViewController.h"
#import "DianZiZaZhiItemView.h"
#import "DianZiZaZhiModelSource.h"
#import "DianZiZaZhiDetailViewController.h"
#import "SubmissionViewController.h"
#import "CooperateViewController.h"

@interface DianZiZaZhiViewController ()<DianZiZaZhiItemViewDelegate, DianZiZaZhiModelSourceDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet DianZiZaZhiItemView *firstItemView;
@property (strong, nonatomic) IBOutlet DianZiZaZhiItemView *secondItemView;
@property (strong, nonatomic) IBOutlet DianZiZaZhiItemView *thirdItemView;
@property (strong, nonatomic) IBOutlet DianZiZaZhiItemView *fourthItemView;

@property (nonatomic, strong) DianZiZaZhiModelSource *modelSource;
@property (nonatomic, strong) NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation DianZiZaZhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self adjustNavigationBar];
    
    self.modelSource = [[DianZiZaZhiModelSource alloc] init];
    self.modelSource.delegate = self;
    
    [self.modelSource getDianZiZaZhiList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)adjustNavigationBar{
    [self.navigationController setNavigationBarHidden:NO];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12, 21);
    [backBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    self.navigationItem.title = @"电子杂志";
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 12, 21);
    [rightButton setImage:[UIImage imageNamed:@"riqi"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(selectDate:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)doRightButtonClicked:(id)sender{
    
}

- (IBAction)onTougaoButtonClicked:(id)sender {
    SubmissionViewController *sVC = [[SubmissionViewController alloc] initWithNibName:@"SubmissionViewController" bundle:nil];
    [sVC fillTitle:@"我要投稿" andIsSubssion:YES];
    sVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:sVC animated:YES];
}

- (IBAction)onHeZuoButtonClicked:(id)sender {
    SubmissionViewController *sVC = [[SubmissionViewController alloc] initWithNibName:@"SubmissionViewController" bundle:nil];
    [sVC fillTitle:@"我要投稿" andIsSubssion:NO];
    sVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:sVC animated:YES];
//    CooperateViewController *cVC = [[CooperateViewController alloc] initWithNibName:@"CooperateViewController" bundle:nil];
//    cVC.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:cVC animated:YES];
}

- (void)fillDataIndex:(NSInteger)index toItemView:(DianZiZaZhiItemView *)itemView{
    if (index >= self.dataArray.count) {
        return;
    }
    NSDictionary *dict = [self.dataArray objectAtIndex:index];
    [itemView fillItemWithCoverUrl:[dict objectForKey:@"picurl"] title:[dict objectForKey:@"title"] andIndex:index];
}

#pragma mark - DianZiZaZhiModelSourceDelegate
- (void)getDianZiZaZhiListSuccess:(NSArray *)dataArr{
    for (NSDictionary *dict in dataArr) {
        NSString *title = dict[@"title"];
        if ([title containsString:@"2016"]) {
            [self.modelSource getDianZiZaZhiListWithID:dict[@"id"]];
        }
    }
}

- (void)getDianZiZaZhiListFailed{
    
}

- (void)getDianZiZaZhiListWithIDSuccess:(NSArray *)dataArr{
    self.dataArray = dataArr;
    
    [self.collectionView reloadData];
    if (dataArr) {
        [self fillDataIndex:0 toItemView:self.firstItemView];
        [self fillDataIndex:1 toItemView:self.secondItemView];
        [self fillDataIndex:2 toItemView:self.thirdItemView];
        [self fillDataIndex:3 toItemView:self.fourthItemView];
    }
}

- (void)getDianZiZaZhiListWithIDFailed{
    
}

#pragma mark - DianZiZaZhiItemViewDelegate
- (void)ClickedDianZiZaZhiItemViewIndex:(NSInteger)index{
    NSDictionary *dict = [self.dataArray objectAtIndex:index];
    DianZiZaZhiDetailViewController *dzzzdVC = [[DianZiZaZhiDetailViewController alloc] initWithNibName:@"DianZiZaZhiDetailViewController" bundle:nil];
    [dzzzdVC fillDetailID:dict[@"id"] andTitle:dict[@"title"]];
    dzzzdVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:dzzzdVC animated:YES];
}


- (void)selectDate:(id)sender{
    
}


@end
