//
//  SubmissionViewController.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/8/10.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "SubmissionViewController.h"
#import "SubmissionModelSource.h"

@interface SubmissionViewController ()<SubmissionModelSourceDelegate>

@property (nonatomic, strong)SubmissionModelSource *modelSource;

@property (nonatomic, strong) NSString *titleText;
@property (nonatomic, assign) BOOL isSubMission;//yes 为我要投稿，no 为广告合作。
@property (strong, nonatomic) IBOutlet UILabel *descLabel;

//@property (nonatomic, strong)

@end

@implementation SubmissionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self adjustNavigationBar];
    
    self.modelSource = [[SubmissionModelSource alloc] init];
    self.modelSource.delegate = self;
    if (self.isSubMission) {
        [self.modelSource getSubmissionData];
    } else {
        [self.modelSource getCooperateData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fillTitle:(NSString *)title andIsSubssion:(BOOL)isSub{
    self.titleText = title;
    self.isSubMission = isSub;
}

- (void)adjustNavigationBar{
    [self.navigationController setNavigationBarHidden:NO];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12, 21);
    [backBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    self.navigationItem.title = self.titleText;
}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- SubmissionModelSourceDelegate
- (void)getSubmissionDataSuccess:(NSDictionary *)data{
    self.descLabel.text = data[@"contenttext"];
}

- (void)getSubmissionDataFailed{
    
}

- (void)getCooperateDataSuccess:(NSDictionary *)data{
    self.descLabel.text = data[@"contenttext"];
}

- (void)getCooperateDataFailed{
    
}

@end
