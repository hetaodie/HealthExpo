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

@interface YiYuanViewController ()<YiYuanDetailModulDelegate,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *dengjiLabel;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *menzhen;
@property (weak, nonatomic) IBOutlet UILabel *dizhiLabel;
@property (weak, nonatomic) IBOutlet UIButton *dianhuaButton;
@property (weak, nonatomic) IBOutlet UITextView *desc;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) YiYuanDetailModul *modul;

@property (strong, nonatomic) NSMutableArray *miyiArray;

@end

@implementation YiYuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _modul = [[YiYuanDetailModul alloc] init];
    self.modul.delegate = self;
    
    [self.modul getYiYuanDetailWithID:self.cid];
    [self.modul getMingYIListWithID:self.cid];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onGetYiYuanDetailError{

}

- (void)onGetYiYuanDetailSeccess:(YiyuanDetailObject *)aObject{
    self.titleLabel.text = aObject.title;
    self.dengjiLabel.text = aObject.dengji;
    self.type.text = aObject.type;
    self.menzhen.text = aObject.menzhen;
    self.dizhiLabel.text = aObject.dizhi;
    [self.dianhuaButton setTitle:aObject.dianhua forState:UIControlStateNormal];
    
    self.desc.text = aObject.desc;

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return 75;
}

@end
