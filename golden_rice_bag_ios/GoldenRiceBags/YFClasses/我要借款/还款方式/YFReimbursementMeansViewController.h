//
//  YFReimbursementMeansViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "YFEqualViewController.h"
#import "YFFirstViewController.h"
#import "YFAOneTimeViewController.h"
#import "SectionChooseView.h"


@protocol PaymentTypeDelegate <NSObject>

-(void)Type:(NSInteger)type;//0等额本息1先息后本2一次性还本付息

@end


@interface YFReimbursementMeansViewController : YFBaseViewController

@property(nonatomic,strong)id<PaymentTypeDelegate>TypeDelegate;

/*
 size借款月数  整数
 */
@property(nonatomic,strong)NSString *sizeString;

/*
 principal借款金额
 */
@property(nonatomic,strong)NSString *principalString;
@end
