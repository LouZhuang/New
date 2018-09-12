//
//  YFMineBorrowTableViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFMineTableViewController.h"
#import "YFMineBorrowTableViewCell.h"
/*
 申请中
 */
#import "YFInTheApplicationViewController.h"
/*
 审核未通过
 */
#import "YFAuditFailedViewController.h"
/*
 逾期中
 */
#import "YFInTheLateViewController.h"

/*
 募集中
 */
#import "YFToRaiseTheViewController.h"
/*
 关闭
 */
#import "YFCloseViewController.h"
/*
 募集失败
 */
#import "YFRaiseFailureViewController.h"
/*
 募集成功
 */
#import "YFToRaiseSuccessfulViewController.h"
/*
 正常还款中
 */
#import "YFNormalRepaymentViewController.h"
/*
 提前还款
 */
/*
 正常结款
 */
#import "YFNormalAndModelViewController.h"
@interface YFMineBorrowTableViewController : YFMineTableViewController


/*
 头部视图
 */
@property(nonatomic,strong)UIView *headerView;

@property(nonatomic,assign)NSInteger page;

/*
 当前借款总金额(元)lable
 */
@property(nonatomic,strong)UILabel *totalLabel;

/*
 当前借款总金额(元)lable
 */
@property(nonatomic,strong)UILabel *totalNumberLabel;


/*
 待还金额(元)lable
 */
@property(nonatomic,strong)UILabel *amountLabel;

/*
 待还金额(元)lable
 */
@property(nonatomic,strong)UILabel *amountNumberLabel;

/*
 近30天应还金额(元)lable
 */
@property(nonatomic,strong)UILabel *daysamountLabel;

/*
 近30天应还金额(元)lable
 */
@property(nonatomic,strong)UILabel *daysamountNumberLabel;

/*
 逾期金额(元)lable
 */
@property(nonatomic,strong)UILabel *WithinLabel;

/*
 逾期金额(元)lable
 */
@property(nonatomic,strong)UILabel *WithinNumberLabel;




@end
