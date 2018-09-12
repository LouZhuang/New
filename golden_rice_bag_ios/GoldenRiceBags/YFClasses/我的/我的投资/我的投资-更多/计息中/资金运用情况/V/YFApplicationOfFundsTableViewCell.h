//
//  YFApplicationOfFundsTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFApplicationOfFundsTableViewCell : YFBaseTableViewCell


/*
 小圆点
 */

@property(nonatomic,strong)UILabel *yuanLabel;

/*
 标题
 */

@property(nonatomic,strong)UILabel *tittleLabel;


/*
 详细
 */

@property(nonatomic,strong)UILabel *contentLabel;

//-(void)indexPath:(NSInteger)row ;
- (void)setDataDic:(NSString *)str andIndex:(NSInteger )index;

@end
