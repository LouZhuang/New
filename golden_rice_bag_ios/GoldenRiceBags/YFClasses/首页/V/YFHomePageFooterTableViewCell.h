//
//  YFHomePageFooterTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/19.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "YFInformationDisclosureViewController.h"
@interface YFHomePageFooterTableViewCell : YFBaseTableViewCell


#warning section2

/*
 累计成交额数值
 */
@property(nonatomic,strong)UILabel *turnoverNumberLabel;
/*
 累计成交额
 */
@property(nonatomic,strong)UILabel *turnoverLabel;
/*
 累计注册人数数值
 */
@property(nonatomic,strong)UILabel *registeredNumberLabel;
/*
 累计注册人数
 */
@property(nonatomic,strong)UILabel *registeredLabel;

/*
 底部
 */
@property(nonatomic,strong)UIView *threeView;
/*
 关于金米袋
 */
@property(nonatomic,strong)UIView *aboutView;

/*
 关于金米袋
 */
@property(nonatomic,strong)UILabel *aboutThreeLabel;

/*
 底部
 */
@property(nonatomic,strong)UILabel *downThreeLabel;

/*
 滚动
 */
@property(nonatomic,strong)UIScrollView *YFScrollerView;

/*
 滚动按钮
 */
@property(nonatomic,strong)UIButton *scrollerButton;


/*
 关于金米袋按钮
 */
@property(nonatomic,strong)UIButton *aboutButton;



/*
 底部按钮
 */
@property(nonatomic,strong)UIButton *downButton;

-(void)setterSetionTwo;


@end
