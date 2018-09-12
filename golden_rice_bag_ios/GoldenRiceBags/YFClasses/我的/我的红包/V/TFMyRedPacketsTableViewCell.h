//
//  TFMyRedPacketsTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/24.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "YFMyRedPacketsModel.h"
@interface TFMyRedPacketsTableViewCell : YFBaseTableViewCell

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
 加息期限
 */
@property(nonatomic,strong)UILabel *periodLabel;
/*
 起投金额
 */
@property(nonatomic,strong)UILabel *instructionsLabel;

/*
 加息上线
 */
@property(nonatomic,strong)UILabel *upLabel;
/*
 右边view
 */
@property(nonatomic,strong)UIView *rightDownView;

/*
 
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;
/*
 
 时间
 */
@property(nonatomic,strong)UILabel *timeOneLabel;

/*
 时间
 */
@property(nonatomic,strong)UILabel *timeLabel;

/*
 名字
 */
@property(nonatomic,strong)UILabel *nameLabel;

-(void)setterMyRedPacketsModel:(YFMyRedPacketsModel *)model;

@end
