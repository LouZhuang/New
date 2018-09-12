//
//  YFFinancialDetailsTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/21.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "YFProjectTableViewController.h"
#import "YFInvestmentTableViewController.h"
#import "YFCertificationTableViewController.h"
#import "YFMineTableViewController.h"
@interface YFFinancialDetailsTableViewCell : YFBaseTableViewCell


//cell注册
+ (void)regisCellForTableView:(UITableView *)tableView;
+ (YFFinancialDetailsTableViewCell *)dequeueCellForTableView:(UITableView *)tableView;
//子控制器是否可以滑动  YES可以滑动
@property (nonatomic, assign) BOOL canScroll;
//外部segment点击更改selectIndex,切换页面
@property (assign, nonatomic) NSInteger selectIndex;

//创建pageViewController
- (void)customPageView:(id)data;


@end
