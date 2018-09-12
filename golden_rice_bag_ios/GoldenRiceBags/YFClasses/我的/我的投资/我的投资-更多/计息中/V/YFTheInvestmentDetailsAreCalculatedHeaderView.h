//
//  YFTheInvestmentDetailsAreCalculatedHeaderView.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFHeaderViewTableViewCell.h"
#import "YFHomePageModel.h"
@interface YFTheInvestmentDetailsAreCalculatedHeaderView : UIView<UITableViewDelegate,UITableViewDataSource>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;


-(void)setterHomePageModel:(YFHomePageModel *)model;
 
@property(nonatomic,strong)YFHomePageModel *model;
 
@end
