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

@interface DianZiZaZhiViewController ()<DianZiZaZhiItemViewDelegate, DianZiZaZhiModelSourceDelegate>
@property (strong, nonatomic) IBOutlet DianZiZaZhiItemView *firstItemView;
@property (strong, nonatomic) IBOutlet DianZiZaZhiItemView *secondItemView;
@property (strong, nonatomic) IBOutlet DianZiZaZhiItemView *thirdItemView;
@property (strong, nonatomic) IBOutlet DianZiZaZhiItemView *fourthItemView;

@property (nonatomic, strong) DianZiZaZhiModelSource *modelSource;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation DianZiZaZhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self adjustNavigationBar];
    self.firstItemView = [DianZiZaZhiItemView viewFromNib];
    self.secondItemView = [DianZiZaZhiItemView viewFromNib];
    self.thirdItemView = [DianZiZaZhiItemView viewFromNib];
    self.fourthItemView = [DianZiZaZhiItemView viewFromNib];
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
    
    self.navigationItem.title = @"预约挂号";
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 18, 16);
    [rightBtn setImage:[UIImage imageNamed:@"riqi"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(doRightButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)doRightButtonClicked:(id)sender{
    
}

- (IBAction)onTougaoButtonClicked:(id)sender {
}

- (IBAction)onHeZuoButtonClicked:(id)sender {
}

- (void)fillData:(NSDictionary *)dict toItemView:(DianZiZaZhiItemView *)itemView{
    
}

#pragma mark - DianZiZaZhiModelSourceDelegate
- (void)getDianZiZaZhiListSuccess:(NSArray *)dataArr{
    
}
- (void)getDianZiZaZhiListFailed{
    
}

- (void)getDianZiZaZhiListWithIDSuccess:(NSArray *)dataArr{
    self.dataArray = dataArr;
}

- (void)getDianZiZaZhiListWithIDFailed{
    
}
#pragma mark - DianZiZaZhiItemViewDelegate
- (void)ClickedDianZiZaZhiItemViewIndex:(NSInteger)index{
    
}
@end
