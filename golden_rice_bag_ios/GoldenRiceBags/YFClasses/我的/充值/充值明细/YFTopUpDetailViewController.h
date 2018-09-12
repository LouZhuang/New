//
//  YFTopUpDetailViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "YFTopUpDetailTableViewCell.h"
#import "YFTopUpDetailModel.h"
#import "YFTopUpViewController.h"
@interface YFTopUpDetailViewController : YFBaseViewController

/*
 1为充值成功进入明细
 */
@property(nonatomic,assign)NSInteger successType;
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,assign)BOOL isTheDropDown;
@end
