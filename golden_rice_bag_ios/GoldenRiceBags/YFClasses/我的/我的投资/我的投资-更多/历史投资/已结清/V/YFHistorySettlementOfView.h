//
//  YFHistorySettlementOfView.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFHeaderViewTableViewCell.h"
@interface YFHistorySettlementOfView : UIView<UITableViewDelegate,UITableViewDataSource>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

@property(nonatomic,strong)YFHomePageModel *model;
@property (nonatomic, assign) BOOL isZhuanRangED; //是债转不需要显示转让时间
@end
