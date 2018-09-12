//
//  YFOnScheduleTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFOnScheduleTableViewCell : YFBaseTableViewCell

/*
 时间
 */

@property(nonatomic,strong)UILabel *timeLabel;

/*
 小圆点
 */

@property(nonatomic,strong)UILabel *yuanLabel;

/*
 总计
 */

@property(nonatomic,strong)UILabel *totalLabel;


/*
 详细
 */

@property(nonatomic,strong)UILabel *detailLabel;

/*
 状态
 */

@property(nonatomic,strong)UILabel *stateLabel;

-(void)indexPath:(NSInteger)row andDic:(NSDictionary *)dic;

@end
