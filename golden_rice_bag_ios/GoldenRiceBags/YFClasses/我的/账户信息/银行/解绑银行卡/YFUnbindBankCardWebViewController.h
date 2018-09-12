//
//  YFUnbindBankCardWebViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/10.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "YFMineBnakCardAllViewController.h"
#import "YFAccountSecurityViewController.h"
#import "YFTopUpViewController.h"
#import "YFWithdrawalDetailViewController.h"
@interface YFUnbindBankCardWebViewController : YFBaseViewController
/*
 网址
 */
@property(nonatomic,strong)NSString *urlString;

/*
 6为修改交易密码 9为充值输入密码 10为提现
 */
@property(nonatomic,assign)NSInteger changePassWordType;
@end
