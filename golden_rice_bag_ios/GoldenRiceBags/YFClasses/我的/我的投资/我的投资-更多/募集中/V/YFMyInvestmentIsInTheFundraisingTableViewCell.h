//
//  YFMyInvestmentIsInTheFundraisingTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "YFHomePageModel.h"
@interface YFMyInvestmentIsInTheFundraisingTableViewCell : YFBaseTableViewCell

/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 content
 */
@property(nonatomic,strong)UILabel *contentLabel;


/*
 rightimageView
 */
@property(nonatomic,strong)UIImageView *rightImageView;


/*
 投资详情
 */
-(void)setterIndexSection:(NSInteger)section IndexPath:(NSInteger)row stateString:(NSString *)state MyInvestmentModel:(YFHomePageModel *)model;


/*
 撤销投资
 */
-(void)setterUndoIndexPath:(NSInteger)row MyInvestmentModel:(YFHomePageModel *)model;

/*
 历史投资
 */
-(void)setterHistoryIndexPath:(NSInteger)row IndexSection:(NSInteger)section MyInvestmentModel:(YFHomePageModel *)model;

@end
