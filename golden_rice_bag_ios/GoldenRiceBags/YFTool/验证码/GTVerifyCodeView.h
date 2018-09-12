//
//  GTVerifyCodeView.h
//  codeView
//
//  Created by Thinkive on 2017/11/19.
//  Copyright © 2017年 Thinkive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFCustomTextField.h"
#import "YFTool.h"

@protocol YFCustomTextFieldDelegate <NSObject>

@optional

-(void)WithPasswordString:(NSString *)Password;

@end


typedef void(^OnFinishedEnterCode)(NSString *code);

@interface GTVerifyCodeView : UIView

- (instancetype)initWithFrame:(CGRect)frame onFinishedEnterCode:(OnFinishedEnterCode)onFinishedEnterCode;
@property(nonatomic,strong)id<YFCustomTextFieldDelegate>YFSendDelegate;
- (void)resetDefaultStatus;

- (void)codeBecomeFirstResponder;

@end
