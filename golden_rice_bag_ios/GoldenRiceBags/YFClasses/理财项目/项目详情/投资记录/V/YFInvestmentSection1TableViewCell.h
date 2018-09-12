//
//  YFInvestmentSection1TableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/21.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "YFHomePageRequest.h"
#import "YFCertificationModel.h"
@interface YFInvestmentSection1TableViewCell : YFBaseTableViewCell
/*
 标题
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

-(void)settermoneyCertificationModel:(YFCertificationModel *)model;
@end
