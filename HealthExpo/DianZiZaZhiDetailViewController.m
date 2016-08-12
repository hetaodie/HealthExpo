//
//  DianZiZaZhiDetailViewController.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/10.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "DianZiZaZhiDetailViewController.h"
#import "DianZiZaZhiDetailModelSource.h"
#import "HENetTask.h"
#import "UIImageView+WebCache.h"

@interface DianZiZaZhiDetailViewController ()<DianZiZaZhiDetailModelSourceDelegate, UITableViewDelegate, UITableViewDataSource>
@property DianZiZaZhiDetailModelSource *modelSource;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *oneLabel;
@property (strong, nonatomic) IBOutlet UILabel *twoLabel;
@property (strong, nonatomic) IBOutlet UILabel *threeLabel;
@property (strong, nonatomic) IBOutlet UILabel *fourLabel;

@property (strong, nonatomic) IBOutlet UILabel *fiveLabel;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *listArray;
@end

@implementation DianZiZaZhiDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self adjustNavigationBar];
    
    self.modelSource = [[DianZiZaZhiDetailModelSource alloc] init];
    self.modelSource.delegate = self;
    [self.modelSource getDianZiZaZhiDetailWithID:self.detailID];
    [self.modelSource getDianZiZaZhiDetailListWithID:self.detailID];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fillDetailID:(NSString *)cID andTitle:(NSString *)title{
    self.detailID = cID;
    self.topTitle = title;
}

- (void)adjustNavigationBar{
    [self.navigationController setNavigationBarHidden:NO];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12, 21);
    [backBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    self.navigationItem.title = self.topTitle;
    
//    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    rightBtn.frame = CGRectMake(0, 0, 18, 16);
//    [rightBtn setImage:[UIImage imageNamed:@"riqi"] forState:UIControlStateNormal];
//    [rightBtn addTarget:self action:@selector(doRightButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
//    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark -- DianZiZaZhiDetailModelSourceDelegate
- (void)getDianZiZaZhiDetailSuccess:(NSDictionary *)dict{
    NSString *urlPath = [NSString stringWithFormat:@"%@%@", HEHttpServer, dict[@"picurl"]];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:urlPath] placeholderImage:[UIImage imageNamed:@"dianzizazhi1"]];
    self.oneLabel.text = dict[@"content1"];
    self.twoLabel.text = dict[@"content2"];
    self.threeLabel.text = dict[@"content3"];
    self.fourLabel.text = dict[@"content4"];
    self.fiveLabel.text = dict[@"contenttext"];
}

- (void)getDianZiZaZhiDetailFailed{
    
}

- (void)getDianZiZaZhiDetailListSuccess:(NSArray *)array{
    self.listArray = array;
    [self.tableView reloadData];
}

- (void)getDianZiZaZhiDetailListFailed{
    
}

#pragma mark -- UItableViewDelegate && UItableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 25;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ListCell"];
    }
    
    return cell;
}

@end
