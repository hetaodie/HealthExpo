//
//  JiBingInfoView.m
//  HealthExpo
//
//  Created by Weixu on 16/7/5.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "JiBingInfoView.h"
#import "UIColor+HEX.h"
#import "UITextView+HtmlString.h"

@interface JiBingInfoView() <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

@property (weak, nonatomic) IBOutlet UIWebView *contentWebView;

@property (weak, nonatomic) IBOutlet UILabel *lookMoreLabel;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *titleBottomView;
@property (weak, nonatomic) IBOutlet UIView *lookMoreTopView;

@end


@implementation JiBingInfoView

- (void)showViewWithObject:(JiBingDetailObject *)aObject{
    self.titleLabel.text = aObject.title;
    //[self.contentTextView showTextWithHtmlString:aObject.contenttext];
    [self.contentWebView loadHTMLString:aObject.contenttext baseURL:nil];}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setupControlStatus];
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

- (IBAction)moreInfoButtonPress:(id)sender {
}

- (void)setupControlStatus{
    self.titleLabel.textColor = [UIColor colorWithHexString:@"0x333333" alpha:1.0];
    self.contentTextView.textColor = [UIColor colorWithHexString:@"0x333333" alpha:1.0];
    
    self.lookMoreLabel.textColor = [UIColor colorWithHexString:@"0x888888" alpha:1.0];
    self.titleBottomView.backgroundColor = [UIColor colorWithHexString:@"0xdcdcdc" alpha:1.0];
    self.lookMoreTopView.backgroundColor = [UIColor colorWithHexString:@"0xdcdcdc" alpha:1.0];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView{
    // NSString *jsString = [[NSString alloc] initWithFormat:@"document.body.style.fontSize=%f;document.body.style.color=%@",12.0f,[UIColor redColor]];
    NSString *jsString = @"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '60%'";
    
    [webView stringByEvaluatingJavaScriptFromString:jsString];
}

@end
