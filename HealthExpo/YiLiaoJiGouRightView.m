//
//  JiBingBKRightView.m
//  HealthExpo
//
//  Created by Weixu on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "YiLiaoJiGouRightView.h"
#import "YiLiaoJiGouRightViewCell.h"


#define JiBingBKRightViewCellHeight 50

@interface YiLiaoJiGouRightView()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *contentArray;
@end


@implementation YiLiaoJiGouRightView

- (void)showContentWithArray:(NSArray *)aArray{
    [self.contentArray setArray:aArray];
    [self.tableView reloadData];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    _contentArray = [[NSMutableArray alloc] init];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.contentView.frame = self.bounds;
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


- (void)dealloc
{
    self.delegate = nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JiBingBKRightViewCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YiLiaoJiGouRightViewCell *cell = (YiLiaoJiGouRightViewCell *)[tableView dequeueReusableCellWithIdentifier:@"YiLiaoJiGouRightViewCell"];
    if (!cell) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"YiLiaoJiGouRightViewCell" owner:nil options:nil];
        cell = [views firstObject];
    }
    
    JiGouRightObject *object = [self.contentArray objectAtIndex:indexPath.row];
    [cell showCellWithData:object];
    return  cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = [self.contentArray count];
    return count;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    
    JiGouRightObject *object = [self.contentArray objectAtIndex:row];
    if (self.delegate && [self.delegate respondsToSelector:@selector(onYiLiaoJiGouRightView:SelectIndex:)]) {
        [self.delegate onYiLiaoJiGouRightView:object SelectIndex:row];
    }
}

@end
