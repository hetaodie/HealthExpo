//
//  RegisterViewController.m
//  HealthExpo
//
//  Created by zhanyawei on 16/6/22.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "RegisterViewController.h"
#import "UIColor+HEX.h"
#import "UIButton+CountDown.h"
#import "RegisterModelSource.h"
#import "UserInfoManager.h"
#import "HENotificationKey.h"
#import "UIView+Toast.h"
#import "NSString+MD5.h"
#import "TiaoKuanViewController.h"

@interface RegisterViewController ()<RegisterModelSourceDelegate,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *registerPhoneNumBackgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *registerPhoneNumImage;
@property (weak, nonatomic) IBOutlet UITextField *registerPhoneNumTextField;
@property (weak, nonatomic) IBOutlet UIView *checkNumBackgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *checkNumImage;
@property (weak, nonatomic) IBOutlet UITextField *checkNumTextField;
@property (weak, nonatomic) IBOutlet UIView *registerPasswordBackgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *registerPasswordImage;
@property (weak, nonatomic) IBOutlet UITextField *registerPasswordTextField;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIButton *getCheckNumButton;

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *password;

@property (weak, nonatomic) IBOutlet UITextField *key1Field;
@property (nonatomic, strong) RegisterModelSource *modelSource;
@property (weak, nonatomic) IBOutlet UIButton *duihaoBtn;
@property (weak, nonatomic) IBOutlet UITextField *key2Field;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UITableView *tableview1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UITableView *tableView2;

@property (nonatomic, strong) NSMutableArray *mutableArray1;
@property (nonatomic, strong) NSMutableArray *mutableArray2;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshUI];
    [self adjustNavigationBar];
    
    self.modelSource = [[RegisterModelSource alloc] init];
    self.modelSource.delegate = self;
    self.registerPhoneNumTextField.delegate = self;
    self.registerPasswordTextField.delegate = self;
    self.key1Field.delegate = self;
    self.key2Field.delegate = self;
    
    self.tableview1.delegate = self;
    self.tableview1.dataSource = self;
    
    self.tableView2.delegate = self;
    self.tableView2.dataSource = self;
    
    self.mutableArray1 = [[NSMutableArray alloc] init];
    self.mutableArray2 = [[NSMutableArray alloc] init];
    
    NSArray *array1 = [NSArray arrayWithObjects:@"你的名字是什么",@"你的家庭在哪里",@"你的小学叫什么", nil];
    NSArray *array2 = [NSArray arrayWithObjects:@"你的手机号码",@"你最爱吃的食物",@"你最喜欢的运动", nil];
    
    [self.mutableArray1 setArray:array1];
    [self.mutableArray2 setArray:array2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc{
    
}


- (void)adjustNavigationBar{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12, 21);
    [backBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    self.navigationItem.title = @"注 册";
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.frame = CGRectMake(0, 0, 30, 30);
    [registerBtn setTitle:@"登录" forState:UIControlStateNormal];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    //    [registerBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(gotoRegister:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *registerItem = [[UIBarButtonItem alloc] initWithCustomView:registerBtn];
    self.navigationItem.rightBarButtonItem = registerItem;
}

- (void)doBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)gotoRegister:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onGetCheckNumButtonClicked:(id)sender {
    [self.getCheckNumButton startWithTime:10 title:@"获取验证码" countDownTile:@"" mainColor:[UIColor colorWithHex:0x00b38a alpha:1] countColor:[UIColor colorWithHex:0xdcdcdc alpha:1]];
}

- (IBAction)onRegisterButtonClicked:(id)sender {
    self.password = self.registerPasswordTextField.text;
    self.userName = self.registerPhoneNumTextField.text;
    
    NSString *key1 = [NSString stringWithFormat:@"%@:%@",self.button1.titleLabel.text,self.key1Field.text];
    NSString *key2 = [NSString stringWithFormat:@"%@:%@",self.button2.titleLabel.text,self.key2Field.text];
    
    [self.modelSource registerWithPhoneNum:self.userName andPwd:self.password andkey1:key1 andkey2:key2];
   
}

- (void)refreshUI{
    self.registerPhoneNumBackgroundView.layer.borderWidth = 1;
    self.registerPhoneNumBackgroundView.layer.borderColor = [[UIColor colorWithHex:0x00b38a alpha:1] CGColor];
    self.registerPhoneNumBackgroundView.layer.cornerRadius = 5.0;
    
    self.checkNumBackgroundView.layer.borderWidth = 1;
    self.checkNumBackgroundView.layer.borderColor = [[UIColor colorWithHex:0x00b38a alpha:1] CGColor];
    self.checkNumBackgroundView.layer.cornerRadius = 5.0;
    
    self.registerPasswordBackgroundView.layer.borderWidth = 1;
    self.registerPasswordBackgroundView.layer.borderColor = [[UIColor colorWithHex:0x00b38a alpha:1] CGColor];
    self.registerPasswordBackgroundView.layer.cornerRadius = 5.0;
    
    self.registerButton.layer.cornerRadius = 5.0;
    self.getCheckNumButton.layer.cornerRadius = 5.0;
}

#pragma mark -- RegisterModelSourceDelegate
- (void)onRegisterSuccess:(NSDictionary *)dict{
    [self.modelSource registerICallWithPhoneNum:self.userName andPwd:self.password];
}

- (void)onRegisterFailed{
    [self registerFailedToast];
}

- (void)onRegisterICallSuccess:(NSDictionary *)data{

    NSInteger errorCode = [data[@"err_code"] integerValue];
    if(errorCode == 0){
        id tempKey = data[@"uid"];
        NSString *key = @"-1";
        if ([tempKey isKindOfClass:[NSNumber class]]) {
            key = [tempKey stringValue];
        } else {
            key = tempKey;
        }
        
        [self.modelSource upDataPhoneToJianKangeBoLan:self.userName uid:data[@"uid"] andPwd:[NSString get_pwd:self.password]];
        
        [[UserInfoManager shareManager] registerSuccessWithUserName:self.userName andPassword:self.password andUID:key];
        [[NSNotificationCenter defaultCenter] postNotificationName:HELogin_Success_Notification object:nil];
    } else if(errorCode == 2){
        id tempKey = data[@"uid"];
        NSString *key = @"-1";
        if ([tempKey isKindOfClass:[NSNumber class]]) {
            key = [tempKey stringValue];
        } else {
            key = tempKey;
        }
        [self.view makeToast:@"您在黄盖电话注册过，所以电话功能需要同步后才能使用，请稍后重新登录" duration:1.0 position:CSToastPositionCenter];
        [[UserInfoManager shareManager] registerSuccessWithUserName:self.userName andPassword:self.password andUID:key];
        [[NSNotificationCenter defaultCenter] postNotificationName:HELogin_Success_Notification object:nil];
    } else if(errorCode == 2){
        id tempKey = data[@"uid"];
        NSString *key = @"-1";
        if ([tempKey isKindOfClass:[NSNumber class]]) {
            key = [tempKey stringValue];
        } else {
            key = tempKey;
        }
        [self.view makeToast:@"您在黄盖电话注册过，所以电话功能需要同步后才能使用，请稍后重新登录" duration:1.0 position:CSToastPositionCenter];
        [[UserInfoManager shareManager] registerSuccessWithUserName:self.userName andPassword:self.password andUID:key];
        [[NSNotificationCenter defaultCenter] postNotificationName:HELogin_Success_Notification object:nil];
    }  else {
        [self registerFailedToast];
    }
}

- (void)onRegisterICallFailed{
    [self registerFailedToast];
}

- (void)registerFailedToast{
    [self.view makeToast:@"注册失败" duration:0.8 position:CSToastPositionCenter];
}

- (IBAction)lookForTiaokuanBtn:(id)sender {
    TiaoKuanViewController *registerVC = [[TiaoKuanViewController alloc] initWithNibName:@"TiaoKuanViewController" bundle:nil];
    [self.navigationController pushViewController:registerVC animated:YES];
}

- (IBAction)duihaoBtn:(id)sender {
    if (self.duihaoBtn.isSelected) {
        [self.duihaoBtn setSelected:NO];        
    }
    else{
        [self.duihaoBtn setSelected:YES];
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)button1Press:(id)sender {
    self.tableview1.hidden = NO;
    self.tableView2.hidden = YES;
    [self.tableview1 reloadData];
}

- (IBAction)button2Press:(id)sender {
    self.tableview1.hidden = YES;
    self.tableView2.hidden = NO;
    [self.tableView2 reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 21.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSArray *dataArray;
    if (tableView == self.tableview1) {
        dataArray = self.mutableArray1;
    }
    else{
        dataArray = self.mutableArray2;
    }
    cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView ==self.tableview1) {
        return [self.mutableArray1 count];
    }
    else{
        return [self.mutableArray2 count];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.tableview1) {
        [self.button1 setTitle:[self.mutableArray1 objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    }
    else{
       [self.button2 setTitle:[self.mutableArray2 objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    }
    [tableView setHidden:YES];
}
@end
