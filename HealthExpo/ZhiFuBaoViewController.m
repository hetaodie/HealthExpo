//
//  ZhiFuBaoViewController.m
//  HealthExpo
//
//  Created by weixu on 16/11/21.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "ZhiFuBaoViewController.h"
#import "ZhifubaoObject.h"
#import "ZhifuBaoCollectionViewCell.h"

@interface ZhiFuBaoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIButton *chongzhiButton;
@property (strong, nonatomic) NSMutableArray *contentArray;

@end

@implementation ZhiFuBaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpCollectionView];
    self.chongzhiButton.clipsToBounds = YES;
    self.chongzhiButton.layer.cornerRadius = 10;
    self.contentArray = [[NSMutableArray alloc] init];
    
    [self addDataToArray];
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
}

#pragma mark -
#pragma mark UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSInteger count = [self.contentArray count];
    return count;
}

- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZhifuBaoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZhifuBaoCollectionViewCell" forIndexPath:indexPath];
    
    ZhifubaoObject *object= [self.contentArray objectAtIndex:indexPath.row];
    [cell showCellWithObject:object];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZhifubaoObject *object = [self.contentArray objectAtIndex:indexPath.row];
    
    
    CGSize size =[ZhifuBaoCollectionViewCell cellSizeWithObject:object];
    return size;
}

- (void)addDataToArray{
    ZhifubaoObject *object1 = [[ZhifubaoObject alloc] init];
    object1.price = @"30";
    object1.wPrice = @"10";
    
    [self.contentArray addObject:object1];
    
    ZhifubaoObject *object2 = [[ZhifubaoObject alloc] init];
    object2.price = @"60";
    object2.wPrice = @"20";
    
    [self.contentArray addObject:object2];

    
    ZhifubaoObject *object3 = [[ZhifubaoObject alloc] init];
    object3.price = @"175";
    object3.wPrice = @"50";
    
    [self.contentArray addObject:object3];

    
    ZhifubaoObject *object4 = [[ZhifubaoObject alloc] init];
    object4.price = @"400";
    object4.wPrice = @"100";
    
    [self.contentArray addObject:object4];

}

- (void)setUpCollectionView{
    UINib *nib = [UINib nibWithNibName:@"ZhifuBaoCollectionViewCell" bundle:nil];
    
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"ZhifuBaoCollectionViewCell"];
}

@end
