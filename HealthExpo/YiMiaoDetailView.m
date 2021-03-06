//
//  YiMiaoDetailView.m
//  HealthExpo
//
//  Created by Weixu on 16/7/6.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "YiMiaoDetailView.h"

@interface YiMiaoDetailView() <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *yimiaoNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yumangLabel;
@property (weak, nonatomic) IBOutlet UIWebView *tishiWebView;

@property (weak, nonatomic) IBOutlet UILabel *duixiangLabel;

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;


@end

@implementation YiMiaoDetailView


- (void)awakeFromNib{
    [super awakeFromNib];
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

- (void)showViewWithData:(YiMiaoDetailObject *)aObject{
    self.yimiaoNameLabel.text = aObject.title;
    self.numberLabel.text =[self numberFromString:aObject.strCount];
    
    self.yumangLabel.text = aObject.yumangJIbing;
    [self.tishiWebView loadHTMLString:aObject.tishi baseURL:nil];
    
    self.duixiangLabel.text = aObject.duixiang;
}


- (NSString *)numberFromString:(NSString *)aString{
    NSArray *array = [aString componentsSeparatedByString:@"/"];
    [array objectAtIndex:0];
    NSString *string;
    
    if ([array count] >=2) {
        string = [NSString stringWithFormat:@"第%@次/共%@次",[array objectAtIndex:0],[array objectAtIndex:1]];
    }
    else{
     string = @"";
    }
//    NSString *string = [NSString stringWithFormat:@"第%@次/共%@次",[array objectAtIndex:0],[array objectAtIndex:1]];
    return string;
}


- (void)webViewDidFinishLoad:(UIWebView *)webView{
    // NSString *jsString = [[NSString alloc] initWithFormat:@"document.body.style.fontSize=%f;document.body.style.color=%@",12.0f,[UIColor redColor]];
    NSString *jsString = @"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '60%'";
    
    [webView stringByEvaluatingJavaScriptFromString:jsString];
}

@end
