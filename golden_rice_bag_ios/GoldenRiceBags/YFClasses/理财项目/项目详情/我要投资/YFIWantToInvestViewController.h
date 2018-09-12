//
//  YFIWantToInvestViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/21.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "YFProgressView.h"
#import "YFIWantToInvestTableViewCell.h"
#import "YFTopUpViewController.h"
#import "YFHomePageModel.h"
#import "TFMyRedPacketsViewController.h"
#import "YFCustomOpenTheDepositoryView.h"
#import "YFCustomPopoverView.h"
#import "YFCreditRiskRatingViewController.h"
@interface YFIWantToInvestViewController : YFBaseViewController
/*
 风险能力测评
 */
@property (nonatomic,strong)YFCustomPopoverView *CustomPopoverView;

/*
 账户可用余额
 */
@property(nonatomic,strong)UILabel *totalLabel;

/*
  账户可用余额
 */
@property(nonatomic,strong)UILabel *totalNumberLabel;


/*
 说明lable
 */
@property(nonatomic,strong)UILabel *instructionsLabel;

/*
 剩余
 */
@property(nonatomic,strong)UILabel *remainingLabel;

/*
 YFProgressView
 */
@property(nonatomic,strong)YFProgressView *ProgressView;
/*
 已筹
 */
@property(nonatomic,strong)UILabel *whyLabel;

/*
 充值按钮
 */
@property(nonatomic,strong)UIButton *topUpButton;
@property (strong, nonatomic)YFHomePageModel *listModel;

/*
 开通弹窗
 */

@property (nonatomic,strong)YFCustomOpenTheDepositoryView *CustomOpenTheDepositoryView;


/*
 成功弹窗
 */
@property (nonatomic,strong)YFCustomSuccessView *CustomSuccessView;
@end
