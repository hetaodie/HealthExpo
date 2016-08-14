//
//  ContactsViewController.m
//  HealthExpo
//
//  Created by hzzhanyawei on 16/6/24.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "ContactsViewController.h"

#import "ContactPersonObject.h"
#import <AddressBook/AddressBook.h>
#import "UIView+Toast.h"
#import "PhoneCallModelSource.h"

@interface ContactsViewController ()<UITableViewDataSource,UITableViewDelegate, PhoneCallModelSourceDelegate>
@property (nonatomic, strong) ContactPersonObject *personObject;
@property (nonatomic, strong) NSMutableArray *personArray;
@property (nonatomic, strong) NSMutableArray *titleArray;  //索引数组
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) PhoneCallModelSource *modelSource;

@end

@implementation ContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.modelSource = [[PhoneCallModelSource alloc] init];
    self.modelSource.delegate = self;
    
    _personObject = [[ContactPersonObject alloc] init];
    _personArray = [[NSMutableArray alloc] init];
    _titleArray = [[NSMutableArray alloc] init];
    [self sepUpAddressBook];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


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
        [self.tableView reloadData];
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
    [self.modelSource onPhoneCallWithPhoneNum:phone];
}


#pragma mark -- PhoneCallModelSourceDelegate
- (void)onPhoneCallSuccess:(NSString *)tipString{
    [self.view makeToast:tipString duration:0.8 position:CSToastPositionCenter];
}

- (void)onPhoneCallFailed{
    [self.view makeToast:@"呼叫失败" duration:0.8 position:CSToastPositionCenter];
    
}
@end
