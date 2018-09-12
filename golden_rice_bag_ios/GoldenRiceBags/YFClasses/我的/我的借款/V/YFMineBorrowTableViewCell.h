//
//  YFMineBorrowTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "YFMineBorrowModel.h"
@interface YFMineBorrowTableViewCell : YFBaseTableViewCell

/*
 底部
 */
@property(nonatomic,strong)UIImageView *downImageView;

/*
 借款流水号
 */
@property(nonatomic,strong)UILabel *serialNumberLabel;

/*
 状态
 */
@property(nonatomic,strong)UILabel *statusLabel;
/*
 时间
 */
@property(nonatomic,strong)UILabel *timeLabel;
/*
 借款金额
 */
@property(nonatomic,strong)UILabel *borrowingAmountLabel;
/*
 借款金额
 */
@property(nonatomic,strong)UILabel *borrowingAmountNumberLabel;
/*
 应收利息
 */
@property(nonatomic,strong)UILabel *interestReceivableLabel;
/*
  应收利息
 */
@property(nonatomic,strong)UILabel *interestReceivableNumberLabel;
/*
 借款期限
 */
@property(nonatomic,strong)UILabel *toBorrowLabel;
/*
 借款期限
 */
@property(nonatomic,strong)UILabel *toBorrowNumberLabel;
/*
 没有数据
 */
@property(nonatomic,strong)UIImageView *noMessageImageView;

/*
 没有数据
 */
@property(nonatomic,strong)UIImageView *noMessageLogoImageView;
/*
 没有数据
 */
@property(nonatomic,strong)UILabel *noMessageLabel;

-(void)setterMineBorrowModel:(YFMineBorrowModel *)model totalCountString:(NSString *)totalCount;


@end
