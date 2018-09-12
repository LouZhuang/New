//
//  YFMineMessageTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "YFMessageModel.h"
@interface YFMineMessageTableViewCell : YFBaseTableViewCell

/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 content
 */
@property(nonatomic,strong)UILabel *contentLabel;

/*
 time
 */
@property(nonatomic,strong)UILabel *timeLabel;

/*
 查看详情
 */
@property(nonatomic,strong)UIButton *checkDetailsButton;

-(void)setterMessageModel:(YFMessageModel *)model;
@end
