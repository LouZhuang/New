//
//  YFMyInvestmentTableViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFMineTableViewController.h"
#import "YFTool.h"
#import "YFMineInvestmentTableViewCell.h"
#import "YFAutomaticBidTableViewCell.h"
#import "YFMineCreditorsRightsTransferTableViewCell.h"

@interface YFMyInvestmentTableViewController : YFMineTableViewController


/*
 头部视图
 */
@property(nonatomic,strong)UIView *headerView;
/*
 已投金额 待回收本金 累计收益
 */
@property(nonatomic,strong)UILabel *threeLabel;

/*
 已投金额
 */
@property(nonatomic,strong)UILabel *investmentAmountLabel;
/*
 待回收本金
 */
@property(nonatomic,strong)UILabel *deferredPrincipalLabel;
/*
 累计收益
 */
@property(nonatomic,strong)UILabel *accumulatedEarningsLabel;

/*
 三条虚线
 */
@property(nonatomic,strong)UIImageView *threeview;


@end
