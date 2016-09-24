//
//  PhoneViewController.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/6/24.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "PhoneViewController.h"
#import "CustomTabBarController.h"
#import "DiscoverViewController.h"
#import "PhoneModelSource.h"
#import "UIView+Toast.h"
#import "UIButton+WebCache.h"
#import "CallViewController.h"

#import "ContactPersonObject.h"
#import <AddressBook/AddressBook.h>
#import "RechargeViewController.h"

#import <MessageUI/MessageUI.h>

@interface PhoneViewController ()<PhoneModelSourceDelegate, UITableViewDataSource,UITableViewDelegate, MFMessageComposeViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UITextField *phoneNumText;

@property (nonatomic, strong) NSString *phoneNum;
@property (strong, nonatomic) IBOutlet UIView *topView;
@property (strong, nonatomic) IBOutlet UIScrollView *topBannerScrollView;
@property (strong, nonatomic) IBOutlet UIView *topbannerContaintView;
@property (nonatomic, strong) NSTimer *bannerTimer;
@property (strong, nonatomic) IBOutlet UIButton *banner0;
@property (strong, nonatomic) IBOutlet UIButton *banner1;
@property (strong, nonatomic) IBOutlet UIButton *banner2;
@property (strong, nonatomic) IBOutlet UIButton *banner3;
@property (strong, nonatomic) IBOutlet UIButton *banner4;
@property (strong, nonatomic) IBOutlet UIButton *banner5;
@property (strong, nonatomic) IBOutlet UIButton *banner6;
@property (strong, nonatomic) IBOutlet UIButton *banner7;

@property (weak, nonatomic) IBOutlet UIView *directView;
@property (weak, nonatomic) IBOutlet UIView *callBottomView;
@property (weak, nonatomic) IBOutlet UIView *phoneNumFilterView;
@property (weak, nonatomic) IBOutlet UITableView *filterTableView;
@property (nonatomic, strong) PhoneModelSource *modelSource;

@property (nonatomic, strong) NSDictionary *bannersDict;


@property (nonatomic, strong) ContactPersonObject *personObject;
@property (atomic, strong) NSMutableArray *personArray;
@property (nonatomic, strong) NSMutableArray *titleArray;  //索引数组

@end

@implementation PhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.phoneNumLabel.layer.cornerRadius = 15;
//    self.phoneNumLabel.clipsToBounds = YES;
    
    self.modelSource = [[PhoneModelSource alloc] init];
    self.modelSource.delegate = self;
    [self.modelSource getADBanners];
    [self hiddenPhoneFilterView];

    for (NSInteger i = 0; i < 7; i ++) {
        NSString *buttonName = [NSString stringWithFormat:@"banner%zd",i];
        UIButton *button = [self valueForKey:buttonName];
        
        button.imageView.contentMode = UIViewContentModeScaleToFill;
    }
    
    UIView* dummyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    dummyView.backgroundColor = [UIColor clearColor];
    self.phoneNumText.inputView = dummyView;//不显示键盘，显示光标。
    
    
    _personObject = [[ContactPersonObject alloc] init];
    _personArray = [[NSMutableArray alloc] init];
    _titleArray = [[NSMutableArray alloc] init];
    [self sepUpAddressBook];
    
    self.filterTableView.delegate = self;
    self.filterTableView.dataSource = self;

    [self bannerCycleSetting];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -- button action
- (IBAction)tongXunLuClicked:(id)sender {
    [[CustomTabBarController getInstance] clickAtIndex:2];
    self.tabBarController.tabBar.hidden = NO;
    [self hiddenPhoneFilterView];
}

- (IBAction)deleteClicked:(id)sender {
    [self deleteAphoneNum];
}

- (IBAction)onDiscoverClicked:(id)sender {
    DiscoverViewController *dVC = [[DiscoverViewController alloc] initWithNibName:@"DiscoverViewController" bundle:nil];
    dVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:dVC animated:YES];
}

- (IBAction)onChargeClicked:(id)sender {
    RechargeViewController *rVC = [[RechargeViewController alloc] initWithNibName:@"RechargeViewController" bundle:nil];
    rVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:rVC animated:YES];
}

- (IBAction)onShareClicked:(id)sender {
    MFMessageComposeViewController *msgController = [[MFMessageComposeViewController alloc] init];
    if([MFMessageComposeViewController canSendText])
    {
        msgController.body = @"我正在使用黄盖电话,方便又便宜!免费送6元试用,真的很不错,你也装上吧,咱们就可以免费通话了.下载地址: http://biz.hgvoip.com/download/";
        msgController.recipients = [NSArray array];
        msgController.messageComposeDelegate = self;
        [self presentViewController:msgController animated:YES completion:nil];
    }

}

- (IBAction)onContactsClicked:(id)sender {
    [[CustomTabBarController getInstance] clickAtIndex:2];
    self.tabBarController.tabBar.hidden = NO;
    [self hiddenPhoneFilterView];
}

- (IBAction)homePageButtonClicked:(id)sender {
    [[CustomTabBarController getInstance] clickAtIndex:0];
    self.tabBarController.tabBar.hidden = NO;
    [self hiddenPhoneFilterView];
}

- (IBAction)phoneCallButtonClicked:(id)sender {
    if (self.phoneNum.length >= 2 && self.phoneNum.length <= 11) {
        CallViewController *vc = [[CallViewController alloc] initWithNibName:@"CallViewController" bundle:nil];
        vc.phoneNum = self.phoneNum;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (IBAction)backToPhonePage:(id)sender {
    self.phoneNum = @"";
    [self updatePhoneNum:@""];
}
#pragma mark -- phone Num action
- (IBAction)onPhoneNumClicked:(UIButton *)sender {
    [self updatePhoneNum:sender.titleLabel.text];
}

#pragma mark -- private Func
- (void)updatePhoneNum:(NSString *)aNum{
    if (!_phoneNum) {
        self.phoneNum = [NSString string];
    }
    if (_phoneNum.length <= 11) {
        self.phoneNum = [_phoneNum stringByAppendingString:aNum];
        self.phoneNumText.text = _phoneNum;
    }
    [self checkShowPhoneFilterView];
}
- (void)deleteAphoneNum{
    if(_phoneNum.length > 0){
        self.phoneNum = [_phoneNum substringToIndex:(_phoneNum.length-1)];
        self.phoneNumText.text = _phoneNum;
    }
    [self checkShowPhoneFilterView];
}

- (void)checkShowPhoneFilterView{
    if (_phoneNum.length > 0) {
        [self showPhoneFilterView];
    } else {
        [self hiddenPhoneFilterView];
    }
}

- (void)showPhoneFilterView{
    self.topView.hidden = YES;
    self.directView.hidden = YES;
    self.callBottomView.hidden = NO;
    self.phoneNumFilterView.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    [self filterContactsDataSource];
    [self.filterTableView reloadData];
}

- (void)hiddenPhoneFilterView{
    self.topView.hidden = NO;
    self.directView.hidden = NO;
    self.callBottomView.hidden = YES;
    self.phoneNumFilterView.hidden = YES;
    self.tabBarController.tabBar.hidden = NO;
}

- (void)filterContactsDataSource{
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        if (self.phoneNum && self.phoneNum.length > 0) {
//            if (self.personArray && self.personArray.count > 0) {
//                NSInteger i = 0;
//                for (id persons in self.personArray) {
//                    if ([persons  isKindOfClass:[NSArray class]]) {
//                        NSLog(@"**********************-------------%zd", i);
//                        NSArray *tmpPersons = (NSArray *)persons;
//                        NSMutableArray *editablePeasons = [NSMutableArray array];
//                        if (tmpPersons && tmpPersons.count > 0) {
//                            [editablePeasons addObjectsFromArray:tmpPersons];
//                            for (ContactPersonObject *person in tmpPersons) {
//                                if (![person.phone containsString:self.phoneNum]) {
//                                    [editablePeasons removeObject:person];
//                                }
//                            }
//                            [self.personArray removeObject:tmpPersons];
//                            if (editablePeasons.count > 0) {
//                                [self.personArray addObjectsFromArray:editablePeasons];
//                            }
//                        }
//
//                    } else if ([persons isKindOfClass:[ContactPersonObject class]]){
//                        NSLog(@"**********************++++++++++++++%zd", i);
//                        ContactPersonObject *temPerson = (ContactPersonObject *)persons;
//                        if (![temPerson.phone containsString:self.phoneNum]) {
//                            [self.personArray removeObject:persons];
//                        }
//                    }
//                    i++;
//                    
//                }
//            }
//        }
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.filterTableView reloadData];
//        });
//    });
    
}

#pragma mark - msgDlegate
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    switch (result) {
        case MessageComposeResultCancelled:
            NSLog(@"Cancelled");
            break;
        case MessageComposeResultFailed:
            
            
            break;
        case MessageComposeResultSent:
            
            break;
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - banner ScrollView handler
- (IBAction)onBannerClicked:(UIButton *)sender {
    NSArray *allUrls = [self.bannersDict allValues];
    
    if (sender.tag < allUrls.count) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:allUrls[sender.tag]]];
    }    
}


- (void)bannerCycleSetting{
    self.bannerTimer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(cycleShowBanner) userInfo:nil repeats:YES];
}

- (void)cycleShowBanner{
    CGFloat offsetX = self.topBannerScrollView.contentOffset.x + self.topBannerScrollView.frame.size.width;
    if (offsetX >= self.topBannerScrollView.contentSize.width) {
        offsetX = 0.0;
         [self.topBannerScrollView setContentOffset:CGPointMake(offsetX, 0.0) animated: NO];
    } else {
        [self.topBannerScrollView setContentOffset:CGPointMake(offsetX, 0.0) animated:YES];
    }    
}

#pragma mark -- PhoneModelSourceDelegate
- (void)getADBannersSuccess:(NSDictionary *)dict{
    self.bannersDict = dict;
    NSArray *allPics = [dict allKeys];
    UIImage *placeHolderImage = [UIImage imageNamed:@"banner"];
    for (NSInteger i = 0; i < allPics.count; i ++) {
        NSString *buttonName = [NSString stringWithFormat:@"banner%zd",i];
        UIButton *button = [self valueForKey:buttonName];
        [button sd_setBackgroundImageWithURL:allPics[i] forState:UIControlStateNormal placeholderImage:placeHolderImage];
    }
    
}

- (void)getADBannersFailed{
    
}

#pragma mark -- PhoneCallModelSourceDelegate
- (void)onPhoneCallSuccess:(NSString *)tipString{
    [self.view makeToast:tipString duration:0.8 position:CSToastPositionCenter];
}

- (void)onPhoneCallFailed{
    [self.view makeToast:@"呼叫失败" duration:0.8 position:CSToastPositionCenter];

}


#pragma mark - 筛选通讯录界面展示
- (void)adjustNavigationBar{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12, 21);
    //    [backBtn setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    //    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    self.navigationItem.title = @"通讯录";
}


- (void)sepUpAddressBook{
    // 实例化通讯录对象
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
    ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
        if (granted) {
            NSLog(@"授权成功！");
            
            CFErrorRef *error1 = NULL;
            ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error1);
            [self copyAddressBook:addressBook];
        } else {
            [self.view makeToast:@"通讯录授权失败，无法显示此页面" duration:0.8 position:CSToastPositionCenter];
        }
    });
    CFRelease(addressBook);
}

- (void)copyAddressBook:(ABAddressBookRef)addressBook
{
    
    // 获取所有联系人记录
    CFArrayRef array = ABAddressBookCopyArrayOfAllPeople(addressBook);
    NSInteger count = CFArrayGetCount(array);
    
    NSMutableArray *persons = [NSMutableArray array];
    
    for (NSInteger i = 0; i < count; ++i) {
        
        ContactPersonObject *object = [[ContactPersonObject alloc] init];
        // 取出一条记录
        ABRecordRef person = CFArrayGetValueAtIndex(array, i);
        
        // 取出个人记录中的详细信息
        CFStringRef firstName = ABRecordCopyValue(person, kABPersonFirstNameProperty);
        // 姓
        CFStringRef lastName = ABRecordCopyValue(person, kABPersonLastNameProperty);
        
        // 取电话号码
        ABMultiValueRef phones = ABRecordCopyValue(person, kABPersonPhoneProperty);
        // 取记录数量
        NSInteger phoneCount = ABMultiValueGetCount(phones);
        
        if (firstName == nil && lastName == nil) {
            object.lastName = @"无名";
        }
        else if (firstName == nil){
            object.lastName = (__bridge NSString *)lastName;
        }
        else if (lastName == nil){
            object.lastName = (__bridge NSString *)firstName;
        }
        else {
            object.lastName = [NSString stringWithFormat:@"%@ %@",lastName,firstName];
        }
        
        if (phoneCount > 0) {
            NSString *phoneNumber = (__bridge NSString *)ABMultiValueCopyValueAtIndex(phones, 0);
            object.phone = phoneNumber;
        }
        [persons addObject:object];
        
    }
    
    [self dealDataWithArray:persons];
}

- (void)dealDataWithArray:(NSArray *)array
{
    
    NSMutableArray * tmpArray = [[NSMutableArray alloc]init];
    for (NSInteger i =0; i <27; i++) {
        //给临时数组创建27个数组作为元素，用来存放A-Z和#开头的联系人
        NSMutableArray * array = [[NSMutableArray alloc]init];
        [tmpArray addObject:array];
    }
    
    for (ContactPersonObject * model in array) {
        //AddressMode是联系人的数据模型
        //转化为首拼音并取首字母
        NSString * nickName = [self returnFirstWordWithString:model.lastName];
        int firstWord = [nickName characterAtIndex:0];
        
        //把字典放到对应的数组中去
        
        if (firstWord >= 65 && firstWord <= 90) {
            //如果首字母是A-Z，直接放到对应数组
            NSMutableArray * array = tmpArray[firstWord - 65];
            [array addObject:model];
            
        }
        else
        {
            //如果不是，就放到最后一个代表#的数组
            NSMutableArray * array =[tmpArray lastObject];
            [array addObject:model];
        }
    }
    
    //此时数据已按首字母排序并分组
    //遍历数组，删掉空数组
    for (NSMutableArray * mutArr in tmpArray) {
        //如果数组不为空就添加到数据源当中
        if (mutArr.count != 0) {
            [self.personArray addObject:mutArr];
            ContactPersonObject * model = mutArr[0];
            NSString * nickName = [self returnFirstWordWithString:model.lastName];
            int firstWord = [nickName characterAtIndex:0];
            //取出其中的首字母放入到标题数组，暂时不考虑非A-Z的情况
            if (firstWord >= 65 && firstWord <= 90) {
                [self.titleArray addObject:nickName];
            }
        }
    }
    
    //便利结束后，两个数组数目不相等说明有除大写字母外的其他首字母
    if (!(self.titleArray.count == self.personArray.count)) {
        [self.titleArray addObject:@"#"];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        //刷新tableView
        [self.filterTableView reloadData];
    });
    
}

- (NSString *)returnFirstWordWithString:(NSString *)str
{
    NSMutableString * mutStr = [NSMutableString stringWithString:str];
    
    //将mutStr中的汉字转化为带音标的拼音（如果是汉字就转换，如果不是则保持原样）
    CFStringTransform((__bridge CFMutableStringRef)mutStr, NULL, kCFStringTransformMandarinLatin, NO);
    //将带有音标的拼音转换成不带音标的拼音（这一步是从上一步的基础上来的，所以这两句话一句也不能少）
    CFStringTransform((__bridge CFMutableStringRef)mutStr, NULL, kCFStringTransformStripCombiningMarks, NO);
    if (mutStr.length >0) {
        //全部转换为大写    取出首字母并返回
        NSString * res = [[mutStr uppercaseString] substringToIndex:1];
        return res;
    }
    else{
        return @"";
    }
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.personArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.personArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"contactCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.imageView.image = [UIImage imageNamed:@"default_head"];
    
    ContactPersonObject *object= [self.personArray objectAtIndex:indexPath.section][indexPath.row];
    cell.textLabel.text = object.lastName;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.titleArray objectAtIndex:section];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.titleArray;
}

//索引列点击事件
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return index;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    ContactPersonObject *object= [self.personArray objectAtIndex:indexPath.section][indexPath.row];
    NSString *phone = object.phone;
    
    CallViewController *vc = [[CallViewController alloc] initWithNibName:@"CallViewController" bundle:nil];
    vc.phoneNum = phone;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
