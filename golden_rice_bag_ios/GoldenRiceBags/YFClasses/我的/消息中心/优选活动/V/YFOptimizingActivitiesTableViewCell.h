//
//  YFOptimizingActivitiesTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "YFMessageModel.h"
@interface YFOptimizingActivitiesTableViewCell : YFBaseTableViewCell

/*
 time
 */
@property(nonatomic,strong)UILabel *timeLabel;
/*
 image
 */
@property(nonatomic,strong)UIImageView *tittleImageView;

-(void)setterMessageModel:(YFMessageModel *)model;


@end
