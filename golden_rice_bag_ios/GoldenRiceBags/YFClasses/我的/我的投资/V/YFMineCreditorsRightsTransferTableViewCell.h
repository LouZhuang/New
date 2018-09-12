//
//  YFMineCreditorsRightsTransferTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "YFProgressView.h"
#import "YFCreditorsRightsTransferViewController.h"
#import "YFHomePageModel.h"
@interface YFMineCreditorsRightsTransferTableViewCell : YFBaseTableViewCell



/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 tittleImageView
 */
@property(nonatomic,strong)UIImageView *tittleImageView;

/*
 button
 */
@property(nonatomic,strong)UIButton *moreButton;
/*
 底部
 */
@property(nonatomic,strong)UIImageView *downImageView;


/*
 债权转让 标号
 */
@property(nonatomic,strong)UILabel *NumberLabel;

/*
 时间
 */
@property(nonatomic,strong)UILabel *timeLabel;

/*
 期待年回报率百分比
 */
@property(nonatomic,strong)UILabel *percentageLabel;

/*
 剩余天数
 */
@property(nonatomic,strong)UILabel *theCastLabel;

/*
 进度
 */
@property(nonatomic,strong)UILabel *progressLabel;

/*
 剩余可投
 */
@property(nonatomic,strong)UILabel *remainingLabel;

/*
 项目规模
 */
@property(nonatomic,strong)UILabel *projectSizeLabel;

/*
 YFProgressView
 */
@property(nonatomic,strong)YFProgressView *ProgressView;


/*
 没有数据
 */
@property(nonatomic,strong)UIImageView *noMessageImageView;

/*
 没有数据
 */
@property(nonatomic,strong)UIImageView *noMessageLogoImageView;
/*
 没有数据
 */
@property(nonatomic,strong)UILabel *noMessageLabel;

-(void)setterHomePageModel:(YFHomePageModel *)model totalCountString:(NSString *)totalCount;


@end
