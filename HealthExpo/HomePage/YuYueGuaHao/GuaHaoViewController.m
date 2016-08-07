//
//  GuaHaoViewController.m
//  HealthExpo
//
//  Created by zhanyawei on 16/7/3.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "GuaHaoViewController.h"

@interface GuaHaoViewController ()
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *textViewTopContraint;

@end

@implementation GuaHaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self adjustNavigationBar];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.textViewTopContraint.constant = 0;
    [self.textView setNeedsLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
