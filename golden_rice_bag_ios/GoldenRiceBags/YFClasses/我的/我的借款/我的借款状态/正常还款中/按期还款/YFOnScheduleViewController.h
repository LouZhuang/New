//
//  YFOnScheduleViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "YFOnScheduleTableViewCell.h"
#import "YFMineBorrowModel.h"

@interface YFOnScheduleViewController : YFBaseViewController
@property (nonatomic, copy) NSString *totalMoney;
@property (nonatomic, strong) NSArray *dataArr;
@end
