//
//  YFForgotPasswordChangeViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "YFChangeLoginPasswordTableViewCell.h"
#import "YFLoginViewController.h"
@interface YFForgotPasswordChangeViewController : YFBaseViewController
/*
 手机号
 */
@property(nonatomic,strong)NSString *phoneString;
/*
 未实名认证的名字空
 */
@property(nonatomic,strong)NSString *nameString;

/*
 身份证号码
 */
@property(nonatomic,strong)NSString *idCardString;

@end
