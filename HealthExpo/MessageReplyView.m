//
//  MessageReplyView.m
//  HealthExpo
//
//  Created by Weixu on 16/8/11.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "MessageReplyView.h"

@interface MessageReplyView()
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewBottomContraint;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@end

@implementation MessageReplyView


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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

- (IBAction)btnCannelPress:(id)sender {
    
    self.nameTextField.text = @"";
    self.phoneTextField.text = @"";
    self.textView.text = @"";
    
    [self setHidden:YES];
}

- (IBAction)btnSendPress:(id)sender {
    
    [self.nameTextField resignFirstResponder];
    [self.phoneTextField resignFirstResponder];
    [self.textView resignFirstResponder];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(onSendMessageBtnPressName:phone:content:)]) {
        [self.delegate onSendMessageBtnPressName:self.nameTextField.text phone:self.phoneTextField.text content:self.textView.text];
    }
    self.nameTextField.text = @"";
    self.phoneTextField.text = @"";
    self.textView.text = @"";
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.contentView.frame = self.bounds;
}

- (void)awakeFromNib{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChange:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
    
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidChange) name:UITextViewTextDidChangeNotification object:nil];
    
    self.backgroundColor = [UIColor clearColor];
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    self.nameTextField.layer.cornerRadius = 10.0f;
    self.nameTextField.layer.masksToBounds = YES;
    self.nameTextField.layer.borderWidth = 2;
    self.nameTextField.layer.borderColor = [UIColor colorWithRed:0 green:0.7 blue:0.54 alpha:1.0].CGColor;
    
    self.phoneTextField.layer.cornerRadius = 10.0f;
    self.phoneTextField.layer.masksToBounds = YES;
    self.phoneTextField.layer.borderWidth = 2;
    self.phoneTextField.layer.borderColor = [UIColor colorWithRed:0 green:0.7 blue:0.54 alpha:1.0].CGColor;
    
    self.textView.layer.cornerRadius = 10.0f;
    self.textView.layer.masksToBounds = YES;
    self.textView.layer.borderWidth = 2;
    self.textView.layer.borderColor = [UIColor colorWithRed:0 green:0.7 blue:0.54 alpha:1.0].CGColor;
}

- (void)textViewDidChange{
    CGFloat maxWidth = self.textView.frame.size.width;
    UIFont *aFont = self.textView.font;
    
    CGSize size = [self.textView.text boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:aFont} context:nil].size;
    
    self.textViewHeightConstraint.constant = size.height+16;
}

- (void)keyboardChange:(NSNotification *)notification{
    NSDictionary *info = [notification userInfo];
    
    // height
    NSValue *value = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardEndframe = [value CGRectValue];
    self.textViewBottomContraint.constant = keyboardEndframe.size.height + 5;
}


- (void)keyboardHide:(NSNotification *)notification{
    
}

- (void)setHidden:(BOOL)hidden{
    [super setHidden:hidden];
    if (hidden) {
        [self.textView resignFirstResponder];
    }
    else{
         [self.textView becomeFirstResponder];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
