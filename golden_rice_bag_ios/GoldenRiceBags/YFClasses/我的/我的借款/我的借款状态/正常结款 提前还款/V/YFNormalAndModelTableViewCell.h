//
//  YFNormalAndModelTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFNormalAndModelTableViewCell : YFBaseTableViewCell


/*
 section0
 */

/*
 当前借款总金额(元)lable
 */
@property(nonatomic,strong)UILabel *totalLabel;

/*
 当前借款总金额(元)lable
 */
@property(nonatomic,strong)UILabel *totalNumberLabel;



/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 圆点
 */
@property(nonatomic,strong)UIImageView *tittleImageView;

/*
 查看button
 */
@property(nonatomic,strong)UIButton *toViewButton;

/*
 tittle
 */
@property(nonatomic,strong)UILabel *contentLabel;

-(void)setterIndexRow:(NSInteger)row numberString:(NSString *)number;

-(void)setterIndexRow:(NSInteger)row modelArray:(NSArray *)array;

-(void)setterIndexRow:(NSInteger)row sectioTwomodelArray:(NSArray *)array;
@end
