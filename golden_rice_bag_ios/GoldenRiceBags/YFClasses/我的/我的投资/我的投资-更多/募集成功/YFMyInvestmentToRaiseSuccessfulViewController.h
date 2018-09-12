//
//  YFMyInvestmentToRaiseSuccessfulViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "YFMyInvestmentIsInTheFundraisingTableViewCell.h"
#import "YFHomePageModel.h"
#import "YFNormalFinancialDetailsViewController.h"
@interface YFMyInvestmentToRaiseSuccessfulViewController : YFBaseViewController


@property(nonatomic,strong)YFHomePageModel *model;
@property (nonatomic, assign) BOOL isCerditor;//是否是已转入
@end
