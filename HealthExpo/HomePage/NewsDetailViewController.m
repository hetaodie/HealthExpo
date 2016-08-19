//
//  NewsDetailViewController.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/10.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "NewsDetailModelSource.h"
#import "HENetTask.h"
#import "UIImageView+WebCache.h"
#import "UIView+Toast.h"

@interface NewsDetailViewController ()<NewsDetailModelSourceDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UITextView *contextView;

@property (nonatomic, strong)NewsDetailModelSource *modelSource;
@property (nonatomic, strong)NSArray *dataArray;
@property (nonatomic, strong)UIButton *collectButton;

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self adjustNavigationBar];
    
    self.modelSource = [[NewsDetailModelSource alloc] init];
    self.modelSource.delegate = self;
    [self.modelSource getNewsDetailModelSource:self.newsID];
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
    
    self.navigationItem.title = @"新闻";
    
    self.collectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.collectButton.frame = CGRectMake(0, 0, 30, 30);
    [self.collectButton setTitle:@"收藏" forState:UIControlStateNormal];
    self.collectButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.collectButton addTarget:self action:@selector(onCollectionButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *registerItem = [[UIBarButtonItem alloc] initWithCustomView:self.collectButton];
    self.navigationItem.rightBarButtonItem = registerItem;
}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)onCollectionButtonClicked:(UIButton *)button{
    [self.modelSource collectionNewsWithID:self.newsID];
}

#pragma mark -- NewsDetailModelSourceDelegate
- (void)getNewsDetailModelSourceSuccess:(NSDictionary *)dict{
    NSString *urlPath = [NSString stringWithFormat:@"%@%@", HEHttpServer, dict[@"picurl"]];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:urlPath] placeholderImage:[UIImage imageNamed:@"homeDefault01"]];
    
    self.titleLabel.text = dict[@"title"];
    self.contextView.text = dict[@"contenttext"];
    
}

- (void)getNewsDetailModelSourceFailed{
    
}

- (void)collectionNewsSuccess:(NSDictionary *)dict{
    [self.view makeToast:@"收藏成功" duration:0.8 position:CSToastPositionCenter];
}

- (void)collectionNewsFailed{
    
}

@end
