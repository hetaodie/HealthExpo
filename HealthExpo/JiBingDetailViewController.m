//
//  JiBingDetailViewController.m
//  HealthExpo
//
//  Created by Weixu on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "JiBingDetailViewController.h"

@interface JiBingDetailViewController ()
@property (weak, nonatomic) IBOutlet UIView *searchView;

@end

@implementation JiBingDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
     self.searchView.layer.cornerRadius = 15;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)houtuiButtonPress:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
