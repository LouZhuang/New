//
//  YFHomePageModel.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/29.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFHomePageModel : NSObject
@property (nonatomic, strong) NSString *transferContract; /** 投资合同 */
@property(nonatomic,strong)NSString *href;/**  优选图片  */
@property(nonatomic,strong)NSString *title;/**  轮播标题  */

@property(nonatomic,strong)NSString *projectName;/**  产品名称 */
@property(nonatomic,strong)NSString *projectId;/**  产品Id */

@property(nonatomic,strong)NSString *rateOfYear;/**  年回报率  */
@property(nonatomic,strong)NSString *investmentMin;/**  起投金额 */
@property(nonatomic,strong)NSString *projectSize;/**  项目规模  */

@property(nonatomic,strong)NSString *residue;/**  项目剩余  */
@property(nonatomic,strong)NSString *isNew;/**  '是否新人专享（0否1是）  */
@property(nonatomic,strong)NSString *limitDays;/**  投资期限  */
@property(nonatomic,strong)NSString *type;/**  项目类型  */
@property(nonatomic,strong)NSString *repayType;/**  还款方式  */
@property(nonatomic,strong)NSString *rateStart;/**  起息时间  */
@property(nonatomic,strong)NSString *transfer;/**  转让人  */
@property(nonatomic,strong)NSString *createTime;/**  创建时间  */
@property(nonatomic,strong)NSString *status;/**    `status`  '状态（募集中0，募集成功1，计息中2，已结清3，已关闭4）  0募集中1募集成功2计息中3已结清4转让中5已关闭6已转让*/
@property(nonatomic,strong)NSString *id;/** id  */
@property(nonatomic,strong)NSString *holdDays;/** 持有天数  */
@property (nonatomic, strong) NSString *residueInvestment;/** 投资期剩余时间*/
@property (nonatomic, strong) NSString *residueCoupon; /** 加息劵剩余时间*/


@property(nonatomic,strong)NSString *modifyTime;//关闭时间
@property(nonatomic,strong)NSString *amount;//投资份额
@property(nonatomic,strong)NSString *loanDays;//预期收益
@property(nonatomic,strong)NSString *projectRaiseEnd;//到期时间
@property(nonatomic,strong)NSString *investmentNo;//订单号
@property(nonatomic,strong)NSString *cashCoupon;//红包
@property(nonatomic,strong)NSString *reserve1;//关闭原因
@property(nonatomic,strong)NSString *poundage;//
@property(nonatomic,strong)NSString *projectRate;//预期收益率
@property(nonatomic,strong)NSString *reserve2;//时间
@property(nonatomic,strong)NSString *returnAmt;//已经回款

@property(nonatomic,strong)NSString *poundageRate;//时间

@property(nonatomic,strong)NSString *successIncome;//时间
@property (nonatomic, strong) NSString *already;  //已筹金额
@property (nonatomic, strong) NSString *percent;  //百分比


@property (nonatomic, strong) NSString *raiseEnd;//债转结束时间
@property (nonatomic, strong) NSString *reserve3; //转让自动结束时间
@property (nonatomic, strong) NSString *repayDate;//
@property (nonatomic, strong) NSString *rateStartType;//起息时间
@property (nonatomic, strong) NSString *lendingTime;//转让时间
@property (nonatomic, strong) NSString *raiseStart;
@property (nonatomic, strong) NSString *projectShare; /**项目份额*/
@property (nonatomic, strong) NSString *share;      /**购买的项目份额*/
@property (nonatomic, strong) NSString *originId;/**债转原项目*/

@property (nonatomic, strong) NSString *projectEnd;/**  截标时间  */
@end
