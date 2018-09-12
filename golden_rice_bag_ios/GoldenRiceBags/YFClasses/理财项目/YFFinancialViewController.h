//
//  YFFinancialViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/9.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "YFHomePageTableViewCell.h"
#import "YFLifeSupermarketsView.h"
#import "YFFinancialDetailsViewController.h"
#import "YFNormalFinancialDetailsViewController.h"
@interface YFFinancialViewController : YFBaseViewController


/*
 头部view
 */
@property(nonatomic,strong)UIView *headerView;

/*
 左
 */
@property(nonatomic,strong)UIButton *leftButton;

/*
 中
 */
@property(nonatomic,strong)UIButton *middleButton;

/*
 右
 */
@property(nonatomic,strong)UIButton *rightButton;

/*
 footerview
 */
@property(nonatomic,strong)UIView *footerview;


@property (nonatomic,strong)UIImageView *tittleImageView;

@property (nonatomic,strong)YFRefresh *refresh;

/*
 理财产品
 */
@property(nonatomic,strong)NSMutableArray *YFHotArray;

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

/*
 提醒
 */
@property (nonatomic,strong)UILabel *footerLabel;


@property(nonatomic,assign)NSInteger page;

@property(nonatomic,assign)BOOL isTheDropDown;
@end
