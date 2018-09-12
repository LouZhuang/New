//
//  YFProjectTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/21.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "YFHomePageRequest.h"
@interface YFProjectTableViewCell : YFBaseTableViewCell

/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 subtitle
 */
@property(nonatomic,strong)UILabel *subtitleLabel;
/*
 content
 */
@property(nonatomic,strong)UILabel *contentLabel;
/*
 content
 */
@property(nonatomic,strong)UILabel *viceContentLabel;

/*
 right
 */
@property(nonatomic,strong)UIImageView *rightImageView;

-(void)setterIndexSection:(NSInteger)section indexRow:(NSInteger)row loanInfoEntityDic:(NSDictionary *)loanInfoDic projectEntityDic:(NSDictionary *)projectDic loanerString:(NSString *)loaner loanerIdCardString:(NSString *)loanerIdCard andNr:(NSString *)nrProject;


@end

