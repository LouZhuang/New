//
//  YFTopUpDetailModel.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/2.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFTopUpDetailModel : NSObject
@property(nonatomic,strong)NSString *amount;/**  充值数量  */
@property(nonatomic,strong)NSString *createTime;/**  时间  */
@property(nonatomic,strong)NSString *status;/**  状态0待确认支付结果，1支付成功，2支付失败  */
@property(nonatomic,strong)NSString *rechargeNo;/**  订单号  */
@property(nonatomic,strong)NSString *commission;/**  手续费  */
@property(nonatomic,strong)NSString *withdrawNo;/**  订单号  */
@property (nonatomic, strong) NSString *bank; /** 银行卡信息*/
@end
