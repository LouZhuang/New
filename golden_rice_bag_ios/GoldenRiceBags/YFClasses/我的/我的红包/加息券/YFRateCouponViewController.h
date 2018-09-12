//
//  YFRateCouponViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/24.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "TFMyRedPacketsTableViewCell.h"
#import "TFMyRedPacketsFailureViewController.h"


//@protocol YFEnvelopeDelegate <NSObject>
//
//-(void)availableID:(NSString *)availableId rateString:(NSString *)rate;
//
//@end


@interface YFRateCouponViewController : YFBaseViewController

//@property(nonatomic,strong)id<YFEnvelopeDelegate>RedDelegate;
/*
 从我要投资 页面进入判断可用
 */
@property(nonatomic,strong)NSString *moneyString;

/*
 1为从我要投资 页面进入 选择
 */
@property(nonatomic,assign)NSInteger selectType;
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,assign)BOOL isTheDropDown;
@end
