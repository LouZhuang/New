//
//  YFNormalFinancialDetailsViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/21.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "YFNormalFinancialView.h"
#import "SectionChooseView.h"
#import "YFFinancialDetailsTableViewCell.h"
#import "YFMineTableView.h"
#import "YFBaseTableViewCell.h"
#import "YFIWantToInvestViewController.h"
#import "YFCustomOpenTheDepositoryView.h"
#import "YFOpenASavingsAccountViewController.h"
#import "YFCustomSuccessView.h"
#import "YFHomePageModel.h"
@interface YFNormalFinancialDetailsViewController : YFBaseViewController

typedef NS_ENUM(NSUInteger, YFNormalFinancialDetailsViewControllerType) {
    
    YFNormalFinancialDetailsViewControllerTypeMyList,  //我的列表进入
    YFNormalFinancialDetailsViewControllerTypeYuanDetail,  //产品详情进原项目
    YFNormalFinancialDetailsViewControllerTypeList  //产品列表进入

};
///tableView
@property (strong, nonatomic)YFMineTableView *tableView;
//头部
@property (strong, nonatomic)YFNormalFinancialView *headerView;
//分段控制器
@property (strong, nonatomic)SectionChooseView *segment;
//YES代表能滑动
@property (nonatomic, assign) BOOL canScroll;
//pageViewController
@property (strong, nonatomic)YFFinancialDetailsTableViewCell *contentCell;

//YES代表进行中  NO表示已售罄
@property (nonatomic, assign)BOOL type;

//1代表已关闭  2表示已结清
@property (nonatomic, assign)NSInteger historyType;

@property (strong, nonatomic)YFHomePageModel *listModel;

@property (nonatomic, assign) YFNormalFinancialDetailsViewControllerType typeId;

@end
