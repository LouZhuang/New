//
//  YFBorrowingCertificationViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "YFBorrowingHeaderTableViewCell.h"
#import "YFSelectImageView.h"
#import "YFBorrowingCompleteViewController.h"
#import "YFCustomOpenTheDepositoryView.h"
#import "YFCustomSuccessView.h"
#import "YFOpenASavingsAccountViewController.h"


@interface YFBorrowingCertificationViewController : YFBaseViewController<YFSelectImageDelegate>
/*
 上一个页面的数据
 */
@property(nonatomic,strong)NSMutableDictionary *dataDic;
/*
 开通弹窗
 */

@property (nonatomic,strong)YFCustomOpenTheDepositoryView *CustomOpenTheDepositoryView;


/*
 成功弹窗
 */
@property (nonatomic,strong)YFCustomSuccessView *CustomSuccessView;
@end
