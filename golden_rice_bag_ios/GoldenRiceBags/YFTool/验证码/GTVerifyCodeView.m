//
//  GTVerifyCodeView.m
//  codeView
//
//  Created by Thinkive on 2017/11/19.
//  Copyright © 2017年 Thinkive. All rights reserved.
//

#import "GTVerifyCodeView.h"

#import "UIView+MBLayout.h"
#import "UIColor+Extend.h"
#import "UITextField+GTExtend.h"

@interface GTVerifyCodeView ()<UITextFieldDelegate,GTTextFieldDelegate>
/** */
@property (nonatomic, weak) YFCustomTextField *codeTextField;
@property (nonatomic, weak) UILabel *label1;
@property (nonatomic, weak) UILabel *label2;
@property (nonatomic, weak) UILabel *label3;
@property (nonatomic, weak) UILabel *label4;
/** */
@property (nonatomic, copy) OnFinishedEnterCode onFinishedEnterCode;
@end

@implementation GTVerifyCodeView

- (instancetype)initWithFrame:(CGRect)frame onFinishedEnterCode:(OnFinishedEnterCode)onFinishedEnterCode {
    if (self = [super initWithFrame:frame]) {
        CGFloat labWidth = YF_W(60);
        CGFloat labHeight = YF_H(60);
        CGFloat spacing = YF_W(24);
        CGFloat margin = (self.width-labWidth*4-spacing*3)/2.;
        
        if (onFinishedEnterCode) {
            _onFinishedEnterCode = [onFinishedEnterCode copy];
        }
        
        for (NSInteger i = 0; i<4; i++) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(margin+(labWidth+spacing)*i, 0, labWidth, labHeight)];
            label.tag = 100+i;
            label.font = YF_FONT(24);
            label.layer.cornerRadius = YF_W(6);
            label.layer.masksToBounds = YES;
            label.backgroundColor = [YFTool YFColorWithString:@"F5F5F5"];
            label.textAlignment = NSTextAlignmentCenter;
            [self addSubview:label];
            if (i == 0) {
                _label1 = label;
            }else if (i == 1) {
                _label2 = label;
            }else if (i == 2) {
                _label3 = label;
            }else {
                _label4 = label;
            }
        }
        YFCustomTextField *textField = [[YFCustomTextField alloc] initWithFrame:CGRectMake(margin, 0, labWidth, labHeight)];
        textField.delegate = self;
        textField.textAlignment = NSTextAlignmentCenter;
        textField.font = YF_FONT(24);
        textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        textField.keyboardType = UIKeyboardTypeNumberPad;
        [self addSubview:textField];
        _codeTextField = textField;
        
        [textField becomeFirstResponder];
    }
    return self;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (!self.label1.text.length) {
        self.label1.text = string;
        _codeTextField.left = _label2.left;
    }else if (!self.label2.text.length) {
        self.label2.text = string;
        _codeTextField.left = _label3.left;
    }else if (!self.label3.text.length) {
        self.label3.text = string;
        _codeTextField.left = _label4.left;
    }else if (!self.label4.text.length) {
        self.label4.text = string;
        _codeTextField.left = _label4.left;
        
        if (_onFinishedEnterCode) {
            NSString *code = [NSString stringWithFormat:@"%@%@%@%@",_label1.text,_label2.text,_label3.text,_label4.text];
            _onFinishedEnterCode(code);
        }
    }
    return NO;
}

- (void)textFieldDidDeleteBackward:(UITextField *)textField {
    if (self.label4.text.length) {
        self.label4.text = @"";
        self.codeTextField.left = self.label4.left;
    }else if (self.label3.text.length) {
        self.label3.text = @"";
        self.codeTextField.left = self.label3.left;
    }else if (self.label2.text.length) {
        self.label2.text = @"";
        self.codeTextField.left = self.label2.left;
    }else if (self.label1.text.length) {
        self.label1.text = @"";
        self.codeTextField.left = self.label1.left;
    }
}

- (void)resetDefaultStatus {
    self.label1.text = self.label2.text = self.label3.text = self.label4.text = @"";
    self.codeTextField.left = self.label1.left;
    [self codeBecomeFirstResponder];
}

- (void)codeBecomeFirstResponder {
    [self.codeTextField becomeFirstResponder];
}

@end
