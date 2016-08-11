//
//  MessageInfoView.m
//  HealthExpo
//
//  Created by Weixu on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "MessageInfoView.h"
#import "MessageInfoViewCell.h"
#import "UIColor+HEX.h"


@interface MessageInfoView()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *leaveMessageButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *contentArray;

@end


@implementation MessageInfoView

- (void)showViewWithArray:(NSArray *)aArray{
    [self.contentArray setArray: aArray];
    [self.tableView reloadData];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
    [self setupControlStatus];
    _contentArray = [[NSMutableArray alloc] init];
}

- (IBAction)btnMessage:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(onBtnMessagePress)]) {
        [self.delegate onBtnMessagePress];
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


- (void)setupControlStatus{
    self.titleLabel.textColor = [UIColor colorWithHexString:@"0x333333" alpha:1.0];
    [self.leaveMessageButton setTitleColor:[UIColor colorWithHexString:@"0x00b38a" alpha:1.0] forState:UIControlStateNormal];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    return [MessageInfoViewCell heighCellOfIndex:row];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageInfoViewCell *cell = (MessageInfoViewCell *)[tableView dequeueReusableCellWithIdentifier:@"MessageInfoViewCell"];
    if (!cell) {
        NSArray *views =[[NSBundle mainBundle] loadNibNamed:@"MessageInfoViewCell" owner:nil options:nil];
        cell = [views firstObject];
    }
    
    LiuYanObject *object = [self.contentArray objectAtIndex:indexPath.row];
    
    [cell showCellWithObject:object];
    
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = [self.contentArray count];
    return count;
}
@end
