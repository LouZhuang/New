//
//  YFInvestmentSection0TableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/21.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "YFHomePageRequest.h"
@interface YFInvestmentSection0TableViewCell : YFBaseTableViewCell

/*
 标题
 */
@property(nonatomic,strong)UILabel *tittleLabel;
/*
 content
 */
@property(nonatomic,strong)UILabel *contentLabel;

-(void)setterIndexPath:(NSInteger)row moneyString:(NSString *)money peopleString:(NSString *)people timeString:(NSString *)time;

@end
