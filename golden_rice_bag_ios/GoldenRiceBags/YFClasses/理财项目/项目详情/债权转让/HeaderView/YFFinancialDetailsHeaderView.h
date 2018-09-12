//
//  YFFinancialDetailsHeaderView.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/21.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFProgressView.h"
#import "YFNormalFinancialDetailsViewController.h"
#import "YFHomePageModel.h"
@interface YFFinancialDetailsHeaderView : UIView

/*
 期待年回报率
 */
@property(nonatomic,strong)UILabel *totalLabel;

/*
 期待年回报率
 */
@property(nonatomic,strong)UILabel *totalNumberLabel;

/*
 转让价格
 */
@property(nonatomic,strong)UILabel *moneyLabel;

/*
  转让价格
 */
@property(nonatomic,strong)UILabel *moneyNumberLabel;

/*
 说明lable
 */
@property(nonatomic,strong)UILabel *instructionsLabel;

/*
 YFProgressView
 */
@property(nonatomic,strong)YFProgressView *ProgressView;

/*
 当前进度
 */
@property(nonatomic,strong)UILabel *whyLabel;



/*
 项目规模(元)
 */
@property(nonatomic,strong)UILabel *stayStillLabel;

/*
 项目规模(元)
 */
@property(nonatomic,strong)UILabel *stayStillNumberLabel;


/*
 投资期限(月)
 */
@property(nonatomic,strong)UILabel *hasBeenCastLabel;

/*
 投资期限(月)
 */
@property(nonatomic,strong)UILabel *hasBeenCastNumberLabel;

/*
 最低出借金额(元)
 */
@property(nonatomic,strong)UILabel *cumulativeLabel;

/*
 最低出借金额(元)
 */
@property(nonatomic,strong)UILabel *cumulativeNumberLabel;

/*
 转让人
 */
@property(nonatomic,strong)UILabel *peopleLabel;
/*
发起时间
 */
@property(nonatomic,strong)UILabel *faqiLabel;
/*
 项目类型
 */
@property(nonatomic,strong)UILabel *typeLabel;
/*
还款方式
 */
@property(nonatomic,strong)UILabel *wayLabel;
/*
起息时间
 */
@property(nonatomic,strong)UILabel *timeLabel;
/*
 最短持有期
 */
@property(nonatomic,strong)UILabel *shortestLabel;
/*
 4个标题
 */
@property(nonatomic,strong)UILabel *fourLabel;
/*
 圆点
 */
@property(nonatomic,strong)UIImageView *yuanimageView;

/*
 查看原借款标
 */
@property(nonatomic,strong)UIButton *checkButton;


/*
 右箭头
 */
@property(nonatomic,strong)UIImageView *rightImageView;
-(void)setterHomePageModel:(YFHomePageModel *)model;
@end
