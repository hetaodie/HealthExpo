//
//  SearchView.m
//  HealthExpo
//
//  Created by Weixu on 16/8/15.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "SearchView.h"
#import "SearchModul.h"


@interface SearchView() <UITableViewDataSource,UITableViewDelegate,SearchModulDelegate>
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UITextField *searchTextLabel;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) SearchModul *modul;
@property (strong, nonatomic) NSMutableArray *searchArray;
@end


@implementation SearchView

- (void)showSearchView{
    self.alpha = 0.0f;
    self.hidden = NO;
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.alpha = 1.0;
                     } completion:^(BOOL finished) {
                     }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.contentView.frame = self.bounds;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    _modul = [[SearchModul alloc] init];
    self.modul.delegate = self;
    
    _searchArray = [[NSMutableArray alloc] init];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSString *className = NSStringFromClass([self class]);
        self.contentView = [[[NSBundle mainBundle] loadNibNamed:className owner:self options:nil] firstObject];
        [self addSubview:self.contentView];
        return self;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = [self.searchArray count];
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    SearchObject *object = [self.searchArray objectAtIndex:indexPath.row];
    cell.textLabel.text = object.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    SearchObject *object = [self.searchArray objectAtIndex:indexPath.row];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(onSelectSearchData:)]) {
        [self.delegate onSelectSearchData:object];
    }
}

- (IBAction)canclButton:(id)sender {
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.alpha = 0.0;
                     } completion:^(BOOL finished) {
                         self.hidden = YES;
                         self.alpha = 1.0;
                     }];
    self.searchTextLabel.text = @"";
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(onCancelSearch)]) {
        [self.delegate onCancelSearch];
    }
}

- (IBAction)searchBtnPress:(id)sender {
    NSString *text = self.searchTextLabel.text;
    if ([text length] >0) {
        [self.modul seachText:text];
    }
    
}

- (void)onSearchSuccess:(NSArray *)aArray{
    [self.searchArray setArray:aArray];
    [self.tableView reloadData];
}
@end
