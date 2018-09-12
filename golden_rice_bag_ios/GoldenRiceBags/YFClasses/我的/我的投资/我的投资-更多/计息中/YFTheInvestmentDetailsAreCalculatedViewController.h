//
//  YFTheInvestmentDetailsAreCalculatedViewController.h
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
#import "YFTheInvestmentDetailsAreCalculatedHeaderView.h"
#import "YFHomePageModel.h"
@interface YFTheInvestmentDetailsAreCalculatedViewController : YFBaseViewController


///tableView
@property (strong, nonatomic)YFMineTableView *tableView;
//头部
@property (strong, nonatomic)YFTheInvestmentDetailsAreCalculatedHeaderView *headerView;
//分段控制器
@property (strong, nonatomic)SectionChooseView *segment;
//YES代表能滑动
@property (nonatomic, assign) BOOL canScroll;
//pageViewController
@property (strong, nonatomic)YFTheInvestmentDetailsAreCalculatedTableViewCell *contentCell;

@property(nonatomic,strong)YFHomePageModel *model;
@end
