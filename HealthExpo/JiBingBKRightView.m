//
//  JiBingBKRightView.m
//  HealthExpo
//
//  Created by Weixu on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "JiBingBKRightView.h"
#import "JiBingBKRightViewCell.h"


#define JiBingBKRightViewCellHeight 100

@interface JiBingBKRightView()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *contentArray;

@end


@implementation JiBingBKRightView

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
    JiBingBKRightViewCell *cell = (JiBingBKRightViewCell *)[tableView dequeueReusableCellWithIdentifier:@"JiBingBKRightViewCell"];
    if (!cell) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"JiBingBKRightViewCell" owner:nil options:nil];
        cell = [views firstObject];
    }
    
    ClassifyObject *object = [self.contentArray objectAtIndex:indexPath.row];
    [cell showCellWithClassifyObject:object];
    return  cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = [self.contentArray count];
    return count;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    if (self.delegate && [self.delegate respondsToSelector:@selector(onSelectIndex:)]) {
        [self.delegate onSelectIndex:row];
    }
}

@end
