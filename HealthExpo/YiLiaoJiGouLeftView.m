//
//  JiBingBKLeftView.m
//  HealthExpo
//
//  Created by Weixu on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "YiLiaoJiGouLeftView.h"
#import "YiLiaoJiGouLeftViewCell.h"
#import "DiQunObject.h"

#define JiBingBKLeftViewCellHeight 100

@interface YiLiaoJiGouLeftView ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *contentArray;


@end

@implementation YiLiaoJiGouLeftView

- (void)showContentWithArray:(NSArray *)aArray{
    [self.contentArray setArray:aArray];
    
    if ([aArray count] ==0) {
        [self.tableView reloadData];
    }
    else{
        
        [self.tableView reloadData];

        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableView selectRowAtIndexPath:indexPath animated:NO  scrollPosition:UITableViewScrollPositionTop];
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(onDidSelectLeftView:index:)]) {
            [self.delegate onDidSelectLeftView:[aArray objectAtIndex:0] index:0];
        }
    }

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


- (void)awakeFromNib{
    _contentArray = [[NSMutableArray alloc] init];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JiBingBKLeftViewCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YiLiaoJiGouLeftViewCell *cell = (YiLiaoJiGouLeftViewCell *)[tableView dequeueReusableCellWithIdentifier:@"YiLiaoJiGouLeftViewCell"];
    if (!cell) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"YiLiaoJiGouLeftViewCell" owner:nil options:nil];
        cell = [views firstObject];
    }
    DiQunObject *object = [self.contentArray objectAtIndex:indexPath.row];
    [cell showCellWithClassifyObject:object];
    return  cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = [self.contentArray count];
    return count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    
    ClassifyObject *object = [self.contentArray objectAtIndex:row];
    if (self.delegate && [self.delegate respondsToSelector:@selector(onDidSelectLeftView:index:)]) {
        [self.delegate onDidSelectLeftView:object index:row];
    }
}
@end
