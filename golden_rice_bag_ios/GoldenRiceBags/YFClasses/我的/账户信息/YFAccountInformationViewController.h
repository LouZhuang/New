//
//  YFAccountInformationViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/19.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "YFAccountInformationTableViewCell.h"
#import "YFAboutViewController.h"
#import "YFAccountSecurityViewController.h"
#import "YFMineBnakCardAllViewController.h"
#import "YFTiedCardPopView.h"
#import "YFCustomPopoverView.h"
#import "YFCreditRiskRatingViewController.h"

@interface YFAccountInformationViewController : YFBaseViewController

/*
 风险能力测评
 */
@property (nonatomic,strong)YFCustomPopoverView *CustomPopoverView;

@end
