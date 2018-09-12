//
//  YFBorrowingInformationViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "YFBorrowingHeaderTableViewCell.h"
#import "YFBorrowingSelectTableViewCell.h"
#import "YFBorrowingDetailViewController.h"
#import "JHPickView.h"
@interface YFBorrowingInformationViewController : YFBaseViewController

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

/*
 选择器
 */
@property(nonatomic,strong)JHPickView *picker;
/*
 下一步
 */
@property(nonatomic,strong)UIButton *YFButton;

@end
