//
//  YFOpenASavingsAccountViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/14.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "YFOpenASavingsAccountTableViewCell.h"
#import "YFOpenASavingsWebViewController.h"



/*
 第三方存管协议
 */
#import "YFAgreementViewController.h"

/*
 开户成功代理
 */
@protocol YFOpenAnAccountDelegate <NSObject>
@optional

-(void)OpenAnAccount;

@end

@interface YFOpenASavingsAccountViewController : YFBaseViewController
@property(nonatomic,strong)id<YFOpenAnAccountDelegate>OpenAnAccountDelegate;
@end
