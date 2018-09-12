//
//  YFNormalRepaymentTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFNormalRepaymentTableViewCell : YFBaseTableViewCell

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
 section1
 */

/*
 total
 */
@property(nonatomic,strong)UILabel *totalRightLabel;

/*
 section2
 */


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

/*
 正常还款中
 */
-(void)setterIndexRow:(NSInteger)row numberString:(NSString *)number;

-(void)setterIndexRow:(NSInteger)row totalString:(NSString *)total;

-(void)setterIndexRow:(NSInteger)row modelArray:(NSArray *)array;

/*
 逾期中
 */
-(void)setterTimeOutIndexRow:(NSInteger)row numberString:(NSString *)number;

-(void)setterTimeOutIndexRow:(NSInteger)row totalString:(NSString *)total;

-(void)setterTimeOutIndexRow:(NSInteger)row modelArray:(NSArray *)array;

@end
