//
//  YFSetLoginPasswordViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/13.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "YFEnterPasswordAgainViewController.h"
@interface YFSetLoginPasswordViewController : YFBaseViewController
/*
 手机号
 */
@property(nonatomic,strong)NSString *phoneString;

/*
 邀请人手机号
 */
@property(nonatomic,strong)NSString *inviterPhoneString;
@end
