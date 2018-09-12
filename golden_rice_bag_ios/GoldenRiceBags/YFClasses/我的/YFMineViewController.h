//
//  YFMineViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/9.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "SectionChooseView.h"
#import "YFMineTableViewCell.h"
#import "YFMineTableView.h"
#import "YFBaseTableViewCell.h"
#import "YFAccountInformationViewController.h"
#import "YFMessageCenterViewController.h"

#import "YFTopUpViewController.h"
#import "YFWithdrawalViewController.h"
#import "TFMyRedPacketsViewController.h"
#import "YFCapitalSubsidiaryViewController.h"
#import "YFTiedCardPopView.h"
#import "YFLoginManager.h"
#import "YFMineBnakCardAllViewController.h"
#import "YFMyInvitationViewController.h"

#import "YFCustomOpenTheDepositoryView.h"
#import "YFCustomSuccessView.h"
#import "YFOpenASavingsAccountViewController.h"
@interface YFMineViewController : YFBaseViewController

///tableView
@property (strong, nonatomic)YFMineTableView *tableView;
//下拉头部放大控件
@property (strong, nonatomic)UIView* stretchableTableHeaderView;

//分段控制器
@property (strong, nonatomic)SectionChooseView *segment;
//YES代表能滑动
@property (nonatomic, assign) BOOL canScroll;
//pageViewController
@property (strong, nonatomic)YFMineTableViewCell *contentCell;
//导航栏的背景view
@property (strong, nonatomic) UIImageView *barImageView;


/*
 头部View
 */
@property(nonatomic,strong)UIView *headView;

/*
 主题色头部View
 */
@property(nonatomic,strong)UIView *headDownView;

/*
 头像
 */
@property(nonatomic,strong)UIImageView *headImageView;

/*
 名字
 */
@property(nonatomic,strong)UILabel *nickNameLabel;

/*
 消息按钮
 */
@property(nonatomic,strong)UIButton *messageButton;

/*
 设置按钮
 */
@property(nonatomic,strong)UIButton *settingButton;

/*
 资产View
 */
@property(nonatomic,strong)UIView *assetsView;


/*
 资产lable
 */
@property(nonatomic,strong)UILabel *assetsLabel;

/*
 资产lable
 */
@property(nonatomic,strong)UILabel *assetsNumberLabel;


/*
 待还金额(元)lable
 */
@property(nonatomic,strong)UILabel *stayStillLabel;

/*
 待还金额(元)lable
 */
@property(nonatomic,strong)UILabel *stayStillNumberLabel;


/*
 已投金额(元)lable
 */
@property(nonatomic,strong)UILabel *hasBeenCastLabel;

/*
 已投金额(元)lable
 */
@property(nonatomic,strong)UILabel *hasBeenCastNumberLabel;

/*
 累计净汇报(元)lable
 */
@property(nonatomic,strong)UILabel *cumulativeLabel;

/*
 累计净汇报(元)lable
 */
@property(nonatomic,strong)UILabel *cumulativeNumberLabel;

/*
 可用余额lable
 */
@property(nonatomic,strong)UILabel *availableBalanceLabel;

/*
可用余额lable
 */
@property(nonatomic,strong)UILabel *availableBalanceLabelNumberLabel;

/*
 当前冻结金额lable
 */
@property(nonatomic,strong)UILabel *amountFrozenLabel;

/*
 当前冻结金额lable
 */
@property(nonatomic,strong)UILabel *amountFrozenNumberLabel;

/*
 我的红包
 */
@property(nonatomic,strong)UIButton *myRedPacketsButton;

/*
 邀请好友
 */
@property(nonatomic,strong)UIButton *inviteFriendsButton;


/*
 充值按钮
 */
@property(nonatomic,strong)UIButton *topUpButton;

/*
 提现按钮
 */
@property(nonatomic,strong)UIButton *withdrawalButton;


/*
 开通弹窗
 */

@property (nonatomic,strong)YFCustomOpenTheDepositoryView *CustomOpenTheDepositoryView;


/*
 成功弹窗
 */
@property (nonatomic,strong)YFCustomSuccessView *CustomSuccessView;
/*
 投资账户金额
 */
@property(nonatomic,strong)NSString *TZNumberString;

/*
 借款账户金额
 */
@property(nonatomic,strong)NSString *JKNumberString;


@end
