//
//  YFCreditorsRightsTransferInTheViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "YFCreditorsRightsTransferInTheTableViewCell.h"
@interface YFCreditorsRightsTransferInTheViewController : YFBaseViewController
@property(nonatomic,assign)NSInteger page;

@property(nonatomic,assign)BOOL isTheDropDown;
@property(nonatomic,strong)NSMutableArray *dataArray;
@end
