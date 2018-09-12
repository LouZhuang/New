//
//  TFMyRedPacketsListFailureTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/24.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "YFMyRedPacketsModel.h"
@interface TFMyRedPacketsListFailureTableViewCell : YFBaseTableViewCell
/*
 左边view
 */
@property(nonatomic,strong)UIView *leftDownView;

/*
 数值
 */
@property(nonatomic,strong)UILabel *numericalLabel;

/*
 使用范围
 */
@property(nonatomic,strong)UILabel *usingRangeLabel;

/*
 虚线
 */
@property(nonatomic,strong)UIImageView *DottedImageView;
/*
 有效期
 */
@property(nonatomic,strong)UILabel *periodLabel;
/*
 说明
 */
@property(nonatomic,strong)UILabel *instructionsLabel;


/*
 右边view
 */
@property(nonatomic,strong)UIView *rightDownView;
/*
 名字
 */
@property(nonatomic,strong)UILabel *nameLabel;
/*
 时间
 */
@property(nonatomic,strong)UILabel *timeLabel;

-(void)setterMyRedPacketsModel:(YFMyRedPacketsModel *)model;
@end
