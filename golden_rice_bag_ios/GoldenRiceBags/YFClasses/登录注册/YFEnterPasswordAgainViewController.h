//
//  YFEnterPasswordAgainViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/13.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"

@interface YFEnterPasswordAgainViewController : YFBaseViewController

/*
 第一次输入的密码
 */
@property(nonatomic,strong)NSString *passwordString;

/*
 手机号
 */
@property(nonatomic,strong)NSString *phoneString;

/*
 邀请人手机号
 */
@property(nonatomic,strong)NSString *inviterPhoneString;

@end
