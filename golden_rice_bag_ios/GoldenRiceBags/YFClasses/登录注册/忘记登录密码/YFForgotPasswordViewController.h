//
//  YFForgotPasswordViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "YFForgotPasswordTableViewCell.h"
#import "YFForgotPasswordChangeViewController.h"
@interface YFForgotPasswordViewController : YFBaseViewController

/*
 实名认证的名字
 */
@property(nonatomic,strong)NSString *nameString;
/*
 手机号
 */
@property(nonatomic,strong)NSString *phoneString;
@end
