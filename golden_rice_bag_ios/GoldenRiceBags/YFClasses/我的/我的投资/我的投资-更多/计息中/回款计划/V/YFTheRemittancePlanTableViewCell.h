//
//  YFTheRemittancePlanTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFTheRemittancePlanTableViewCell : YFBaseTableViewCell

/*
 time
 */
@property(nonatomic,strong)UILabel *timeLabel;
/*
 份额
 */
@property(nonatomic,strong)UILabel *tittleLabel;
/*
 金额
 */
@property(nonatomic,strong)UILabel *contentLabel;
/*
 状态
 */
@property(nonatomic,strong)UILabel *stateLabel;


-(void)setterTimeString:(NSString *)time tittleString:(NSString *)tittle contentString:(NSString *)content stateString:(NSString *)state;
@end
