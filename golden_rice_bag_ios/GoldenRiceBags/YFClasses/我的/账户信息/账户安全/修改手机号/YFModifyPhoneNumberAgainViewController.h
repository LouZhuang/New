//
//  YFModifyPhoneNumberAgainViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "TimeButton.h"
#import "GTVerifyCodeView.h"
#import "UIView+MBLayout.h"
#import "YFModifyPhoneNumberDetailViewController.h"
#import "YFAccountSecurityViewController.h"

@interface YFModifyPhoneNumberAgainViewController : YFBaseViewController
/*
 手机号
 */
@property(nonatomic,strong)NSString *phoneString;


/**  发送验证码按钮  */
@property(nonatomic,strong)TimeButton *timeButton;
/*
 返回按钮
 */
@property(nonatomic,strong)UIButton *backButton;


/*
 输入验证码文字
 */
@property(nonatomic,strong)UILabel *VerificationLabel;

/*
 验证码已发送文字
 */
@property(nonatomic,strong)UILabel *VerificationedLabel;

/*
 请输入验证码文字
 */
@property(nonatomic,strong)UILabel *pleaseVerificationLabel;

/*
 验证码
 */
@property (nonatomic, weak)GTVerifyCodeView *YFCodeView;


@end
