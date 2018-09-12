//
//  YFCreditorsRightsTransferCanTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "YFHomePageModel.h"
@interface YFCreditorsRightsTransferCanTableViewCell : YFBaseTableViewCell

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



-(void)setterIndex:(NSInteger)row IndexSection:(NSInteger)secrtion CreditorsRightsTransferModel:(YFHomePageModel *)model;


/*
 我要转让
 */
-(void)setterWantToTransferIndex:(NSInteger)row IndexSection:(NSInteger)secrtion CreditorsRightsTransferModel:(YFHomePageModel *)model;


@end
