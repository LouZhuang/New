//
//  TFMyRedPacketsViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/24.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "SectionChooseView.h"
#import "YFRateCouponViewController.h"
#import "YFARedEnvelopeViewController.h"
#import "YFMyRedPacketsModel.h"
@interface TFMyRedPacketsViewController : YFBaseViewController

/*
 0位加息券  1位红包
 */
@property(nonatomic,assign)NSInteger index;

/*
 1为从我要投资 页面进入 选择
 */
@property(nonatomic,assign)NSInteger selectType;
/*
 从我要投资 页面进入判断可用
 */
@property(nonatomic,strong)NSString *moneyString;

@end
