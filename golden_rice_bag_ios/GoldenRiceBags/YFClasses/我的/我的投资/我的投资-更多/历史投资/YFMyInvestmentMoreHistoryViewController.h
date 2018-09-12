//
//  YFMyInvestmentMoreHistoryViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "YFMyInvestmentMoreTableViewCell.h"
/*
 已关闭
 */
#import "YFMyInvestmentMoreHistoryClosedViewController.h"

/*
 已结清
 */
#import "YFMyInvestmentMoreHistorySettlementOfViewController.h"
@interface YFMyInvestmentMoreHistoryViewController : YFBaseViewController
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,assign)BOOL isTheDropDown;
@end
