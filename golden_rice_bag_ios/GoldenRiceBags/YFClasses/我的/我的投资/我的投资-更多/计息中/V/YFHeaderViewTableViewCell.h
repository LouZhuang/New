//
//  YFHeaderViewTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "YFHomePageModel.h"
@interface YFHeaderViewTableViewCell : YFBaseTableViewCell


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
 查看button
 */
@property(nonatomic,strong)UIButton *toViewButton;


/**
 已转让   或者是投资列表

 @param section <#section description#>
 @param row <#row description#>
 @param model <#model description#>
 */
-(void)setterIndexSectioned:(NSInteger)section IndexPath:(NSInteger)row  HomePageModel:(YFHomePageModel *)model;

/**
 已转让

 @param section <#section description#>
 @param row <#row description#>
 @param model <#model description#>
 */
-(void)setterIndexSection:(NSInteger)section IndexPath:(NSInteger)row  HomePageModel:(YFHomePageModel *)model;

/*
 历史投资 已结清
 */

-(void)setterHistoryIndexSection:(NSInteger)section IndexPath:(NSInteger)row HomePageModel:(YFHomePageModel *)model;


@end
