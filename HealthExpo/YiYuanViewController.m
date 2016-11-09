//
//  YiYuanViewController.m
//  HealthExpo
//
//  Created by Weixu on 16/7/6.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "YiYuanViewController.h"
#import "YiyuanDetailObject.h"
#import "YiYuanDetailModul.h"
#import "MingYICell.h"
#import "MIngYiViewController.h"
#import "MapViewController.h"
#import "CallViewController.h"
#import "UITextView+HtmlString.h"

@interface YiYuanViewController ()<YiYuanDetailModulDelegate,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *dengjiLabel;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *menzhen;
@property (weak, nonatomic) IBOutlet UILabel *dizhiLabel;
@property (weak, nonatomic) IBOutlet UIButton *dianhuaButton;
@property (weak, nonatomic) IBOutlet UIWebView *contentWebView;
@property (weak, nonatomic) IBOutlet UITextView *desc;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) YiYuanDetailModul *modul;

@property (strong, nonatomic) NSMutableArray *mingyiArray;
@property (strong, nonatomic) NSString *yiyuantitle;
@property (strong, nonatomic) YiyuanDetailObject *yiyuanDetailObject;
@end

@implementation YiYuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12, 21);
    [backBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    UIButton *dituBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    dituBtn.frame = CGRectMake(0, 0, 40, 21);
    [dituBtn setTitle:@"地图" forState:UIControlStateNormal];
    [dituBtn addTarget:self action:@selector(showMap:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *dituItem = [[UIBarButtonItem alloc] initWithCustomView:dituBtn];
    self.navigationItem.rightBarButtonItem = dituItem;
    
    _modul = [[YiYuanDetailModul alloc] init];
    _mingyiArray = [[NSMutableArray alloc] init];
    
    self.modul.delegate = self;
    
    [self.modul getYiYuanDetailWithID:self.cid];
    [self.modul getMingYIListWithID:self.cid];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dianhuaPress:(id)sender {
    UIButton *button = (UIButton *)sender;
    NSString *title = [button titleForState:UIControlStateNormal];

    CallViewController *vc = [[CallViewController alloc] initWithNibName:@"CallViewController" bundle:nil];
    vc.phoneNum = title;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)doBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)showMap:(id)sender {
    MapViewController *jkdeVC = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
    jkdeVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:jkdeVC animated:YES];
    [jkdeVC addLocationToMap:self.yiyuanDetailObject.zhuobiao1 longitude:self.yiyuanDetailObject.zhuobiao2 title:self.yiyuanDetailObject.title dizhi:self.yiyuanDetailObject.dizhi];
}

- (void)onGetYiYuanDetailError{

}

- (void)onGetYiYuanDetailSeccess:(YiyuanDetailObject *)aObject{
    self.yiyuanDetailObject = aObject;
    self.yiyuantitle = aObject.title;
    self.titleLabel.text = aObject.title;
    self.dengjiLabel.text = aObject.dengji;
    self.type.text = aObject.type;
    self.menzhen.text = aObject.menzhen;
    self.dizhiLabel.text = aObject.dizhi;
    [self.dianhuaButton setTitle:aObject.dianhua forState:UIControlStateNormal];
    
    //[self.desc showTextWithHtmlString:aObject.desc];
    [self.contentWebView loadHTMLString:aObject.desc baseURL:nil];

}

- (void)onGetMingYIListSeccess:(NSArray *)aArray{
    [self.mingyiArray setArray:aArray];
    [self.tableView reloadData];
}

- (void)onGetMingYIListError{
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return 75;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MingYICell *cell = [tableView dequeueReusableCellWithIdentifier:@"MingYICell"];
    if (!cell) {
        NSArray *cells = [[NSBundle mainBundle] loadNibNamed:@"MingYICell" owner:nil options:nil];
        cell = [cells firstObject];
    }
    
    MingYiObject *object = [self.mingyiArray objectAtIndex:indexPath.row];
    [cell showCellWithData:object];
    
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = [self.mingyiArray count];
    return count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    MingYiObject *object = [self.mingyiArray objectAtIndex:indexPath.row];
    
    MIngYiViewController *jkdeVC = [[MIngYiViewController alloc] initWithNibName:@"MIngYiViewController" bundle:nil];
    
    jkdeVC.cid = object.id;
    jkdeVC.yiyuanTitle = self.yiyuantitle;
    
    jkdeVC.hidesBottomBarWhenPushed = YES;
    

    [self.navigationController pushViewController:jkdeVC animated:YES];
}
@end
