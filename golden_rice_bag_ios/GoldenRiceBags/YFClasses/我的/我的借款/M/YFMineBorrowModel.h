//
//  YFMineBorrowModel.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/29.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFMineBorrowModel : NSObject
@property(nonatomic,assign)NSInteger status;//0申请中1募集中2还款中3审核拒绝4用户取消5募集失败6正常还款结束7提前还款结束8募集成功9逾期
@property (nonatomic, strong) NSString *total; //每期还款金额
@property(nonatomic,strong)NSString *createTime;//创建时间
@property(nonatomic,strong)NSString *loanAmount;//借款金额
@property(nonatomic,strong)NSString *loanDays;//借款周期
@property(nonatomic,strong)NSString *loanNo;//借款流水号
@property(nonatomic,strong)NSString *rateOfYear;//年化利率
@property(nonatomic,strong)NSString *returnType;//还款方式
@property(nonatomic,strong)NSString *reserve3;//关闭时间
@property(nonatomic,strong)NSString *id;//id
@end
