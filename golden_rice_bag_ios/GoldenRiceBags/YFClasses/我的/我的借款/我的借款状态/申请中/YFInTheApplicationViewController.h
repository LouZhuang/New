//
//  YFInTheApplicationViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "YFInTheApplicationTableViewCell.h"
#import "YFMineBorrowModel.h"
@interface YFInTheApplicationViewController : YFBaseViewController
/*
 头部视图
 */
@property(nonatomic,strong)UIView *headerView;


/*
 当前借款总金额(元)lable
 */
@property(nonatomic,strong)UILabel *totalLabel;

/*
 当前借款总金额(元)lable
 */
@property(nonatomic,strong)UILabel *totalNumberLabel;

/*
 说明lable
 */
@property(nonatomic,strong)UILabel *instructionsLabel;

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

@property(nonatomic,strong)YFMineBorrowModel *mineBorrowModel;

@end
