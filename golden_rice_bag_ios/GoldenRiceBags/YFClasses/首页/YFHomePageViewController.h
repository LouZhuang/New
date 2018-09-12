//
//  YFHomePageViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/9.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
/*
 首页轮播
 */
#import "YFBannerView.h"

#import "YFBaseNavigationController.h"

#import "YFPhoneNumberInputViewController.h"
#import "YFOpenASavingsAccountViewController.h"

#import "YFFinancialDetailsViewController.h"
#import "YFNormalFinancialDetailsViewController.h"

#import "YFHomePageTableViewCell.h"
#import "YFHomePageHeaderTableViewCell.h"
#import "YFHomePageFooterTableViewCell.h"

@interface YFHomePageViewController : YFBaseViewController<UITableViewDelegate,UITableViewDataSource,YFCustomOpenTheDepositoryDelegate,YFOpenAnAccountDelegate>

/*
 轮播图
 */
@property (nonatomic,strong)YFBannerView *YFScrollView;


/*
 轮播数组
 */
@property(nonatomic,strong)NSMutableArray *YFBannerArray;

/*
 轮播标题数组
 */
@property(nonatomic,strong)NSMutableArray *YFTittleArray;

/*
 热门产品
 */
@property(nonatomic,strong)NSMutableArray *YFHotArray;

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

/*
 标题和标题down
 */
@property (nonatomic,strong)UIView *homeDownView;

@property (nonatomic,strong)UIImageView *tittleImageView;

/*
 开通弹窗
 */

@property (nonatomic,strong)YFCustomOpenTheDepositoryView *CustomOpenTheDepositoryView;


/*
 成功弹窗
 */
@property (nonatomic,strong)YFCustomSuccessView *CustomSuccessView;

@end
