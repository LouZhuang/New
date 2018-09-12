//
//  YFCreditRiskRatingTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/15.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFCreditRiskRatingTableViewCell : YFBaseTableViewCell

/*
 答案内容
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 选择
 */
@property(nonatomic,strong)UIButton *selectButton;



-(void)setterSelectRow:(NSInteger)selectRow indexPath:(NSInteger)indexPathRow contentArray:(NSArray *)content;

@end
