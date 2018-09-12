//
//  YFReimbursementMeansTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "YFReimbursementMeansModel.h"
@interface YFReimbursementMeansTableViewCell : YFBaseTableViewCell


/*
 时间
 */

@property(nonatomic,strong)UILabel *timeLabel;

/*
 小圆点
 */

@property(nonatomic,strong)UILabel *yuanLabel;

/*
 总计
 */

@property(nonatomic,strong)UILabel *totalLabel;


/*
 详细
 */

@property(nonatomic,strong)UILabel *detailLabel;


-(void)setterReimbursementMeansModel:(YFReimbursementMeansModel *)model;

@end
