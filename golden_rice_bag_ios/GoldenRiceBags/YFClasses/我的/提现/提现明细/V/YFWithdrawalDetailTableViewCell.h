//
//  YFWithdrawalDetailTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "YFTopUpDetailModel.h"
@interface YFWithdrawalDetailTableViewCell : YFBaseTableViewCell

/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;
/*
 content
 */
@property(nonatomic,strong)UILabel *contentLabel;

-(void)setterIndex:(NSInteger)row TopUpDetailModel:(YFTopUpDetailModel *)model;

@end
