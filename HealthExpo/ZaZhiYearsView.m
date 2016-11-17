//
//  ZaZhiYearsView.m
//  HealthExpo
//
//  Created by weixu on 16/11/17.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "ZaZhiYearsView.h"


@interface ZaZhiYearsView()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *contentArray;

@end


@implementation ZaZhiYearsView
- (void)layoutSubviews{
    [super layoutSubviews];
    self.contentView.frame = self.bounds;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.contentArray = [[NSMutableArray alloc] init];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        NSString *className = NSStringFromClass([self class]);
        self.contentView = [[[NSBundle mainBundle] loadNibNamed:className owner:self options:nil] firstObject];
        [self addSubview:self.contentView];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = [self.contentArray count];
    return count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSDictionary *yearDic = [self.contentArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = yearDic[@"title"];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *yearDic = [self.contentArray objectAtIndex:indexPath.row];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(onOneElementSelectWithDic:andIndex:)]) {
        [self.delegate onOneElementSelectWithDic:yearDic andIndex:indexPath.row];
    }
    self.hidden = YES;
}

- (void)showViewWithArray:(NSArray *)aArray{
    [self.contentArray setArray:aArray];
    [self.tableView reloadData];
}


- (void)setSelectedWithIndex:(NSInteger)aIndex{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:aIndex inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}
@end
