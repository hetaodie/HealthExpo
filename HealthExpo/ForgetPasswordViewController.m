//
//  ForgetPasswordViewController.m
//  HealthExpo
//
//  Created by weixu on 2017/2/12.
//  Copyright © 2017年 AllWantsLab. All rights reserved.
//

#import "ForgetPasswordViewController.h"
#import "ForgetPassWordSource.h"

@interface ForgetPasswordViewController () <ForgetPassWordSourceDelegate,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *keyField;
@property (weak, nonatomic) IBOutlet UITextField *key2Field;
@property (strong, nonatomic) ForgetPassWordSource *source;

@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;

@property (weak, nonatomic) IBOutlet UITableView *tableView1;
@property (weak, nonatomic) IBOutlet UITableView *tableView2;
@property (nonatomic, strong) NSMutableArray *mutableArray1;
@property (nonatomic, strong) NSMutableArray *mutableArray2;

@end

@implementation ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.source = [[ForgetPassWordSource alloc] init];
    self.source.delegate = self;
    self.nameField.delegate = self;
    self.keyField.delegate = self;
    self.key2Field.delegate = self;
    
    self.mutableArray1 = [[NSMutableArray alloc] init];
    self.mutableArray2 = [[NSMutableArray alloc] init];
    
    NSArray *array1 = [NSArray arrayWithObjects:@"你的名字是什么",@"你的家庭在哪里",@"你的小学叫什么", nil];
    NSArray *array2 = [NSArray arrayWithObjects:@"你的手机号码",@"你最爱吃的食物",@"你最喜欢的运动", nil];
    
    [self.mutableArray1 setArray:array1];
    [self.mutableArray2 setArray:array2];
    
    self.tableView1.delegate = self;
    self.tableView1.dataSource = self;
    
    self.tableView2.delegate = self;
    self.tableView2.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)findPassWordBtnPress:(id)sender {
    
    NSString *key1 = [NSString stringWithFormat:@"%@:%@",self.button1.titleLabel.text,self.keyField.text];
    NSString *key2 = [NSString stringWithFormat:@"%@:%@",self.button2.titleLabel.text,self.key2Field.text];
    
    [self.source forgetPasswordWithPhoneNum:self.nameField.text andkey1:key1 andkey2:key2];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)onForgetPassword:(NSString *)password{
    NSString *passwordstr = [NSString stringWithFormat:@"您的密码为：%@",password];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"找回的密码" message:passwordstr delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)onForgetPassworderrer{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"找回的密码" message:@"你输入的key值不正确" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
    [alertView show];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 21.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSArray *dataArray;
    if (tableView == self.tableView1) {
        dataArray = self.mutableArray1;
    }
    else{
        dataArray = self.mutableArray2;
    }
    cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView ==self.tableView1) {
        return [self.mutableArray1 count];
    }
    else{
        return [self.mutableArray2 count];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.tableView1) {
        [self.button1 setTitle:[self.mutableArray1 objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    }
    else{
        [self.button2 setTitle:[self.mutableArray2 objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    }
    [tableView setHidden:YES];
}

- (IBAction)button1Press:(id)sender {
    self.tableView1.hidden = NO;
    self.tableView2.hidden = YES;
    [self.tableView1 reloadData];
}

- (IBAction)button2Press:(id)sender {
    self.tableView1.hidden = YES;
    self.tableView2.hidden = NO;
    [self.tableView2 reloadData];
}
@end
