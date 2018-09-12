//
//  YFInTheApplicationTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFInTheApplicationTableViewCell : YFBaseTableViewCell



/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 圆点
 */
@property(nonatomic,strong)UIImageView *tittleImageView;

/*
 tittle
 */
@property(nonatomic,strong)UILabel *contentLabel;

/*
查看button
 */
@property(nonatomic,strong)UIButton *toViewButton;


-(void)setterIndexRow:(NSInteger)row modelArray:(NSArray *)array;

@end
