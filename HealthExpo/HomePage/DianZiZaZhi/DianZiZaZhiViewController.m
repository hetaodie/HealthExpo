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
#import "DianZiZaZhiItemCollectionViewCell.h"

#import "ZaZhiYearsView.h"

@interface DianZiZaZhiViewController ()<DianZiZaZhiItemViewDelegate, DianZiZaZhiModelSourceDelegate,UICollectionViewDelegate,UICollectionViewDataSource,ZaZhiYearsViewDelegate>
@property (strong, nonatomic) IBOutlet DianZiZaZhiItemView *firstItemView;
@property (strong, nonatomic) IBOutlet DianZiZaZhiItemView *secondItemView;
@property (strong, nonatomic) IBOutlet DianZiZaZhiItemView *thirdItemView;
@property (strong, nonatomic) IBOutlet DianZiZaZhiItemView *fourthItemView;

@property (nonatomic, strong) DianZiZaZhiModelSource *modelSource;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *zazhiYearArray;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet ZaZhiYearsView *yearsView;

@end

@implementation DianZiZaZhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpCollectionView];
    [self adjustNavigationBar];
    
    self.modelSource = [[DianZiZaZhiModelSource alloc] init];
    self.modelSource.delegate = self;
    
    [self.modelSource getDianZiZaZhiList];
    self.dataArray = [[NSMutableArray alloc] init];
    
    self.zazhiYearArray = [[NSMutableArray alloc] init];
    
    self.yearsView.hidden = YES;
    self.yearsView.delegate = self;
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
    [self.zazhiYearArray setArray:dataArr];
    
    
    for (NSDictionary *dict in dataArr) {
        NSString *title = dict[@"title"];
        if ([title containsString:@"2016"]) {
            [self getZaZhiListOfYear:dict[@"title"] withID:dict[@"id"]];
        }
    }
}

- (void)getZaZhiListOfYear:(NSString *)aYear withID:(NSString *)aId{
    [self.modelSource getDianZiZaZhiListWithID:aId];
}

- (void)getDianZiZaZhiListFailed{
    
}

- (void)getDianZiZaZhiListWithIDSuccess:(NSArray *)dataArr{
    [self.dataArray setArray:dataArr];
    
    [self.collectionView reloadData];
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
    self.yearsView.hidden = NO;
    [self.yearsView showViewWithArray:self.zazhiYearArray];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict = [self.dataArray objectAtIndex:indexPath.row];
    DianZiZaZhiDetailViewController *dzzzdVC = [[DianZiZaZhiDetailViewController alloc] initWithNibName:@"DianZiZaZhiDetailViewController" bundle:nil];
    [dzzzdVC fillDetailID:dict[@"id"] andTitle:dict[@"title"]];
    dzzzdVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:dzzzdVC animated:YES];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSInteger count = [self.dataArray count];
    return count;
}

- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DianZiZaZhiItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DianZiZaZhiItemCollectionViewCell" forIndexPath:indexPath];
    
    NSDictionary *dict = [self.dataArray objectAtIndex:indexPath.row];
    
    [cell fillItemWithCoverUrl:[dict objectForKey:@"picurl"] title:[dict objectForKey:@"title"] andIndex:indexPath.row];
    
    return cell;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CGSize size =[DianZiZaZhiItemCollectionViewCell cellSizeWithData:nil];
    return size;
}

- (void)setUpCollectionView{
    UINib *nib = [UINib nibWithNibName:@"DianZiZaZhiItemCollectionViewCell" bundle:nil];
    
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"DianZiZaZhiItemCollectionViewCell"];
}

- (void)onOneElementSelectWithDic:(NSDictionary *)aDic andIndex:(NSInteger)aIndex{
    [self getZaZhiListOfYear:aDic[@"title"] withID:aDic[@"id"]];
    
}

@end
