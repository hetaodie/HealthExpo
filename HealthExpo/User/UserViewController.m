//
//  UserViewController.m
//  HealthExpo
//
//  Created by zhanyawei on 16/6/26.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "UserViewController.h"
#import "UserInfoCommonTableViewCell.h"
#import "UserInfoImageTableViewCell.h"
#import "UserInfoManager.h"
#import "UserSettingViewController.h"
#import "HENotificationKey.h"
#import "CollectionViewController.h"
#import "CallDetailViewController.h"
#import "UserEditViewController.h"
#import "UserInfoManager.h"

@interface UserViewController ()<UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *topUserCover;
@property (weak, nonatomic) IBOutlet UILabel *topUserName;
@property (weak, nonatomic) IBOutlet UILabel *topUserPhoneNum;
@property (weak, nonatomic) IBOutlet UILabel *storeNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneFareLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) UserInfo *userInfo;

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSuccess:) name:HELogin_Success_Notification object:nil];
    
    [self adjustNavigationBar];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self refreshUserInformation];
}

- (IBAction)onCollectionClicked:(id)sender {
    CollectionViewController *cVC = [[CollectionViewController alloc] initWithNibName:@"CollectionViewController" bundle:nil];
    cVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:cVC animated:YES];
}

- (IBAction)onCallDetailClicked:(id)sender {
    CallDetailViewController *cdVC = [[CallDetailViewController alloc] initWithNibName:@"CallDetailViewController" bundle:nil];
    cdVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:cdVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate && UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UserInfoImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserInfoImageTableViewCell"];
        if (!cell) {
            cell = [UserInfoImageTableViewCell cellFromNib];
        }
        [cell fillCellWithTitle:@"头像" andImage:self.userInfo.cover];
        return cell;
    } else {
        UserInfoCommonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserInfoCommonTableViewCell"];
        if (!cell) {
            cell = [UserInfoCommonTableViewCell cellFromNib];
        }
        if (indexPath.row == 1) {
            [cell fillCellWithTitle:@"名字" andDescription:self.userInfo.userName];
        } else if (indexPath.row == 2){
            [cell fillCellWithTitle:@"电话" andDescription:self.userInfo.phone];
        } else if (indexPath.row == 3){
            [cell fillCellWithTitle:@"性别" andDescription:self.userInfo.gender];
        } else if (indexPath.row == 4){
            [cell fillCellWithTitle:@"生日" andDescription:self.userInfo.birthday];
        } else if (indexPath.row == 5){
            [cell fillCellWithTitle:@"邮箱" andDescription:self.userInfo.email];
        } else if (indexPath.row == 6){
            [cell fillCellWithTitle:@"地址" andDescription:self.userInfo.address];
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        [self onOpenAlbum];
    }
    
    NSString *editText = nil;
    EditType editType = HEEditName;
    if (indexPath.row == 1) {
        editText = @"名字";
        editType = HEEditName;
    } else if (indexPath.row == 2){
        editText = @"电话";
        editType = HEEditPhone;
    } else if (indexPath.row == 4){
        editText = @"生日";
        editType = HEEditBirthday;
    } else if (indexPath.row == 5){
        editText = @"邮箱";
        editType = HEEditEmail;
    } else if (indexPath.row == 6){
        editText = @"地址";
        editType = HEEditAddress;
    }
    if (editText) {
        UserEditViewController *ueVC = [[UserEditViewController alloc] initWithNibName:@"UserEditViewController" bundle:nil];
        ueVC.hidesBottomBarWhenPushed = YES;
        ueVC.editType = editType;
        ueVC.editTitle = editText;
        [self.navigationController pushViewController:ueVC animated:YES];
    }
}

#pragma mark - private Func

- (void)adjustNavigationBar{
    self.navigationItem.title = @"我 的";
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.frame = CGRectMake(0, 0, 30, 30);
    [registerBtn setTitle:@"设置" forState:UIControlStateNormal];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    //    [registerBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(doSetting:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *registerItem = [[UIBarButtonItem alloc] initWithCustomView:registerBtn];
    self.navigationItem.rightBarButtonItem = registerItem;
}

- (void)doSetting:(id)sender{
    UserSettingViewController *usVC = [[UserSettingViewController alloc] initWithNibName:@"UserSettingViewController" bundle:nil];
    [self.navigationController pushViewController:usVC animated:YES];
}

- (void)refreshTopView{
    self.topUserCover.image = _userInfo.cover;
    self.topUserName.text = _userInfo.userName;
    self.topUserPhoneNum.text = _userInfo.phone;
}

- (void)loginSuccess:(NSNotification *)notification{
    [self refreshUserInformation];
}

- (void)refreshUserInformation{
    self.userInfo = [[UserInfoManager shareManager] userInfoFromUserDefaults];
    [self refreshTopView];
    
    [self.tableView reloadData];
}

#pragma mark - coverImage
- (void)onOpenAlbum{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"选择图片源" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self pickFromCamera];
    }];
    UIAlertAction *albumAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self pickFromAlbum];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [controller addAction:cameraAction];
    [controller addAction:albumAction];
    [controller addAction:cancelAction];
    
    [self presentViewController:controller animated:YES completion:^{
        
    }];
}
#pragma mark -- camera && album
- (void)pickFromAlbum{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
        pickerController.delegate = self;
        pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        pickerController.allowsEditing = NO;
        
        //model show
        [pickerController setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        [self presentViewController:pickerController animated:YES completion:nil];
    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"通知" message:@"无法获取相册" delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil];
        [alertView show];
    }
}
- (void)pickFromCamera{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
        pickerController.delegate = self;
        pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        pickerController.allowsEditing = NO;
        
        //model show
        [pickerController setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        [self presentViewController:pickerController animated:YES completion:nil];
    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"通知" message:@"无法获取相机" delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil];
        [alertView show];
    }
}

#pragma mark -- ActionSheet Delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 10000) {
        if (buttonIndex == [actionSheet firstOtherButtonIndex]) {
            [self pickFromAlbum];
        }
        else if(buttonIndex == [actionSheet firstOtherButtonIndex] +1){
            [self pickFromCamera];
        }
        else{
            NULL;
        }
    }
}

#pragma mark -- UIImagePickerController Delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *originImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.userInfo.cover = originImage;
    [[UserInfoManager shareManager] saveEditedUserInfo:self.userInfo];
    
    [self refreshUserInformation];
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}


@end
