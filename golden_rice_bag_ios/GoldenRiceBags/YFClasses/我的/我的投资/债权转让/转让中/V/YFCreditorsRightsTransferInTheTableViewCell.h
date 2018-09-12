//
//  YFCreditorsRightsTransferInTheTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "YFProgressView.h"
#import "YFHomePageModel.h"
@interface YFCreditorsRightsTransferInTheTableViewCell : YFBaseTableViewCell

/*
 小圆点
 */

@property(nonatomic,strong)UILabel *yuanLabel;


/*
 标题
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
 button
 */
@property(nonatomic,strong)UIButton *canButton;

/*
 YFProgressView
 */
@property(nonatomic,strong)YFProgressView *ProgressView;


/**
 转让中
 */
-(void)setterIndex:(NSInteger)row IndexSection:(NSInteger)secrtion andStr:(YFHomePageModel *)model;


/**
 已转让
 */
-(void)setterTheTransferredIndex:(NSInteger)row IndexSection:(NSInteger)secrtion andStr:(YFHomePageModel *)model;

/**
 已转入
 */
-(void)setterHasBeenTransferredToIndex:(NSInteger)row IndexSection:(NSInteger)secrtion andStr:(YFHomePageModel *)model;

@end
