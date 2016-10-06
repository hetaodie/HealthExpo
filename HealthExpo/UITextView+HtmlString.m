//
//  UITextView+HtmlString.m
//  HealthExpo
//
//  Created by xu.wei on 16/10/6.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "UITextView+HtmlString.h"

@implementation UITextView (HtmlString)
- (void)showTextWithHtmlString:(NSString *)aHtml{
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[aHtml dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    self.attributedText = attributedString;

}
@end
