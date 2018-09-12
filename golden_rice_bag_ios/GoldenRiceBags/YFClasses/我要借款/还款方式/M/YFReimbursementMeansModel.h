//
//  YFReimbursementMeansModel.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/28.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFReimbursementMeansModel : NSObject
@property(nonatomic,strong)NSString *interest;/**  利息  */
@property(nonatomic,strong)NSString *poundage;/**  手续费  */
@property(nonatomic,strong)NSString *principal;/**  本金  */
@property(nonatomic,strong)NSString *repayDay;/**  时间  */
@property(nonatomic,strong)NSString *totalAmt;/**  每月总还款  */
@end
