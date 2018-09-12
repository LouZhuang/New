//
//  YFMyRedPacketsModel.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/28.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFMyRedPacketsModel : NSObject
@property(nonatomic,strong)NSString *investmentStandard;/**  起投金额  */
@property(nonatomic,strong)NSString *couponLimit;/**  加息上线  */
@property(nonatomic,strong)NSString *couponDays;/**  加息期限  */
@property(nonatomic,strong)NSString *title;/**  加息券（红包）名称 */
@property(nonatomic,strong)NSString *content;/**  加息券（红包）说明' */
@property(nonatomic,strong)NSString *end;/**  结束时间  */
@property(nonatomic,strong)NSString *start;/**  开始时间  */
@property(nonatomic,strong)NSString *rate;/**  加息券数值  */
@property(nonatomic,strong)NSString *amount;/**  红包券数值  */
@property(nonatomic,strong)NSString *rechargeStandard;/**  满减使用最低标准  */
@property(nonatomic,strong)NSString *id;/**  红包id  */

@end
