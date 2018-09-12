//
//  YFMyInvestmentMoreHistorySettlementOfViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "SectionChooseView.h"
#import "YFMineTableView.h"
#import "YFBaseTableViewCell.h"
#import "YFTheInvestmentDetailsAreCalculatedTableViewCell.h"
#import "YFHistorySettlementOfView.h"

typedef NS_ENUM(NSUInteger, YFMyInvestmentMoreHistorySettlementOfViewControllerType) {
    
     YFMyInvestmentMoreHistorySettlementOfViewControllerTypeOther, //其他
    YFMyInvestmentMoreHistorySettlementOfViewControllerTypeZhuanRanged,//已转让
    YFMyInvestmentMoreHistorySettlementOfViewControllerTypeZhuanRanging//转让中 债转
   
    
};
@interface YFMyInvestmentMoreHistorySettlementOfViewController : YFBaseViewController

///tableView
@property (strong, nonatomic)YFMineTableView *tableView;
//头部
@property (strong, nonatomic)YFHistorySettlementOfView *headerView;
//分段控制器
@property (strong, nonatomic)SectionChooseView *segment;
//YES代表能滑动
@property (nonatomic, assign) BOOL canScroll;
//pageViewController
@property (strong, nonatomic)YFTheInvestmentDetailsAreCalculatedTableViewCell *contentCell;

@property(nonatomic,strong)YFHomePageModel *model;
@property (nonatomic, assign) YFMyInvestmentMoreHistorySettlementOfViewControllerType type;



@end
