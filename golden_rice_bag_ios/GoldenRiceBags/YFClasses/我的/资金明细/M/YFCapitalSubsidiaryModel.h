//
//  YFCapitalSubsidiaryModel.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/30.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFCapitalSubsidiaryModel : NSObject
@property(nonatomic,strong)NSString *title;/**  标题  */
@property(nonatomic,strong)NSString *content;/**  内容  */
@property(nonatomic,strong)NSString *createTime;/**  时间  */
@property(nonatomic,strong)NSString *changeValue;/**  金额  */
@property(nonatomic,strong)NSString *type;/**  1提现2充值3投资成功4项目回款5撤销投资6自动还款7手动还款8借款成功9转让成功  */
@property(nonatomic,strong)NSString *tradeNo;/**  投资订单号  */
@property(nonatomic,strong)NSString *tradingFlow;/**  流水号 */
@property(nonatomic,strong)NSString *tradeAmount;/**  实际金额 */




@end
