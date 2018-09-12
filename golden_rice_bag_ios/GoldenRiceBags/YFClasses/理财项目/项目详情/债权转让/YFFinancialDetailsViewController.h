//
//  YFFinancialDetailsViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/21.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "SectionChooseView.h"
#import "YFFinancialDetailsListTableViewCell.h"
#import "YFMineTableView.h"
#import "YFBaseTableViewCell.h"
#import "YFFinancialDetailsHeaderView.h"
#import "YFCustomPopoverView.h"
#import "YFCreditRiskRatingViewController.h"
#import "YFCustomOpenTheDepositoryView.h"
#import "YFOpenASavingsAccountViewController.h"
#import "YFCustomSuccessView.h"
#import "GZActionSheet.h"
#import "YFHomePageModel.h"
@interface YFFinancialDetailsViewController : YFBaseViewController


///tableView
@property (strong, nonatomic)YFMineTableView *tableView;
//头部
@property (strong, nonatomic)YFFinancialDetailsHeaderView *headerView;
//分段控制器
@property (strong, nonatomic)SectionChooseView *segment;
//YES代表能滑动
@property (nonatomic, assign) BOOL canScroll;
//pageViewController
@property (strong, nonatomic)YFFinancialDetailsListTableViewCell *contentCell;

@property (nonatomic,strong)YFCustomPopoverView *CustomPopoverView;


@property (strong, nonatomic)YFHomePageModel *listModel;
@property (nonatomic, copy) NSString *projectId;
@end
