//
//  YFFinancialTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/19.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "YFProgressView.h"
@interface YFFinancialTableViewCell : YFBaseTableViewCell

/*
 底部
 */
@property(nonatomic,strong)UIView *cellDoenView;


/*
 产品号
 */
@property(nonatomic,strong)UILabel *productLabel;

/*
 期待年回报率
 */
@property(nonatomic,strong)UILabel *annualReturnLabel;

/*
 期待年回报率百分比
 */
@property(nonatomic,strong)UILabel *percentageLabel;

/*
 锁定期
 */
@property(nonatomic,strong)UILabel *regularLabel;

/*
 多少起投
 */
@property(nonatomic,strong)UILabel *theCastLabel;

/*
 进度
 */
@property(nonatomic,strong)UILabel *progressLabel;

/*
 剩余可投
 */
@property(nonatomic,strong)UILabel *remainingLabel;

/*
 项目规模
 */
@property(nonatomic,strong)UILabel *projectSizeLabel;

/*
 立即投资
 */
@property(nonatomic,strong)UIButton *investmentButton;

/*
 YFProgressView
 */
@property(nonatomic,strong)YFProgressView *ProgressView;

/*
 stustes
 */
@property(nonatomic,strong)UILabel *stutesLabel;

-(void)setterRow:(NSInteger)row stutesString:(NSInteger)stutes;



@end
