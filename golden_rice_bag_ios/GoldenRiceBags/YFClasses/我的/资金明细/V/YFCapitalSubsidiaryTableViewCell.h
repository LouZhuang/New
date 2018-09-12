//
//  YFCapitalSubsidiaryTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/24.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "YFCapitalSubsidiaryModel.h"
@interface YFCapitalSubsidiaryTableViewCell : YFBaseTableViewCell


/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;



/*
 time
 */
@property(nonatomic,strong)UILabel *timeLabel;

/*
 content
 */
@property(nonatomic,strong)UILabel *contentLabel;

/*
 rightimageView
 */
@property(nonatomic,strong)UIImageView *rightImageView;

-(void)setterCapitalSubsidiaryModel:(YFCapitalSubsidiaryModel *)model;
@end
