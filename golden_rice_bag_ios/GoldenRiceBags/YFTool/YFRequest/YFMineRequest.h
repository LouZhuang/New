//
//  YFMineRequest.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/27.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YFTool.h"
#import "YFManager.h"
@interface YFMineRequest : NSObject

/**
 App|我的-首页-借款明细-逾期还款
 {"id",43}  借款单id
 */
+(void)YFAheadRepayUidStringYuqi:(NSString *)uid  andStr:(NSString *)srf success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**
 我的-首页
 pageNum 第几页  从1开始计算 借款记录status 意义  0申请中1募集中2还款中3审核拒绝4用户取消5募集失败6正常还款结束7提前还款结束8募集成功9逾期
 pageSize 每页的个数
 */
+(void)YFPageNumString:(NSString *)pageNum PageSizeString:(NSString *)pageSize success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;


/**
 
 我的-账户信息-关于
 */
+(void)YFAboutSuccess:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 我的-账户信息-版本信息获取
 platform 平台类别
 
 */
+(void)YFPlatformSuccess:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 我的-账户信息-授权管理
 platform 平台类别
 
 */
+(void)YFAuthSuccess:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 我的-账户信息-授权管理-授权（暂未接入存管）
 {"授权标识":"1"}     授权标识可为:tender自动投标    repayment自动还款   creditAssignment自动债券认购   compensatory自动代偿   withdraw自动提现   recharge自动充值
 
 */
+(void)YFSettingAuthString:(NSString *)settingAuth tittleString:(NSString *)tittle success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 我的-账户信息-授权管理-授权取消（暂未接入存管）
 {"授权标识":"0"}     授权标识可为:tender自动投标    repayment自动还款   creditAssignment自动债券认购   compensatory自动代偿   withdraw自动提现   recharge自动充值
 
 */
+(void)YFCancelAuthString:(NSString *)cancelAuth tittleString:(NSString *)tittle success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 我的-消息中心
 
 */
+(void)YFMessageSuccess:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 我的-消息中心-详情分页
 {"pageNum":"页码","pageSize":"分页大小","type":"消息类型"}   pageNum从1开    type  有1系统公告2个人消息3优选活动
 */
+(void)YFTypeString:(NSString *)type PageNumString:(NSString *)pageNum PageSizeString:(NSString *)pageSize success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**

 我的-账户信息-账户安全-验证登录密码
 {"password":"123456"}     id 为用户id     password为原密码
 */
+(void)YFPasswordString:(NSString *)password IdString:(NSString *)uid success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 
 我的-账户信息-账户安全-替换新密码
 {"password":"62626","newPassword":"3456"}     id用户id     password原密码   newPassword新密码
 */
+(void)YFPasswordString:(NSString *)password NewPasswordString:(NSString *)newPassword IdString:(NSString *)uid success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 
 我的-我的红包(加息券)
 {"pageNum":"1","pageSize":"10","type":"2","status":"1"}    id用户id  pageNum页码  pageSize分页大小   type  1为加息券2为红包   status 0未使用 1已失效
 */
+(void)YFPageNumString:(NSString *)pageNum PageSizeString:(NSString *)pageSize TypeString:(NSString *)type IdString:(NSString *)uid StatusString:(NSString *)status success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;


/**
 
 我的-我的投资-自动投标设置并开启
 {"isFull":"0","isUse":"1","isTransfer":"0","amountMin":"1000","amountMax":"2000","keepBal":"1","investmentMin":"3","investmentMax":"10","rateMin":"4","rateMax":"8"}
 isFull是否余额全投（默认0 否，1是） isUse是否使用红包（默认0否，1是） isTransfer是否购买债券转让标的（默认0否，1是）amountMin最小投标额度 amountMax最大投标额度
 keepBal 账户保留余额 investmentMin最低投资期限 investmentMax最高投资期限  rateMin年化收益率下限 rateMax年化收益率上限
 */
+(void)YFIsFullString:(NSInteger)isFull isUseString:(NSInteger)isUse amountMinString:(NSString *)amountMin amountMaxString:(NSString *)amountMax keepBalString:(NSString *)keepBal investmentMinString:(NSString *)investmentMin investmentMaxString:(NSString *)investmentMax rateMinString:(NSString *)rateMin rateMaxString:(NSString *)rateMax srfString:(NSString *)srfStr success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;


/**
 我的-我的投资-获取自动投标策略
 无需传参
 */
+(void)YFGetStrategySuccess:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**
 我的-我的投资-关闭 自动投标
 无需传参
 */
+(void)YFSetStrategyCloseSuccess:(void (^)(id json))success failure:(void (^)(NSError *error))failure;


/**
 
 我的-我的投资-设置自动投标策略
 {"isFull":"0","isUse":"1","isTransfer":"0","amountMin":"1000","amountMax":"2000","keepBal":"1","investmentMin":"3","investmentMax":"10","rateMin":"4","rateMax":"8"}
 isFull是否余额全投（默认0 否，1是） isUse是否使用红包（默认0否，1是） isTransfer是否购买债券转让标的（默认0否，1是）amountMin最小投标额度 amountMax最大投标额度
 keepBal 账户保留余额 investmentMin最低投资期限 investmentMax最高投资期限  rateMin年化收益率下限 rateMax年化收益率上限
 */
+(void)YFSetStrategyIsFullString:(NSInteger)isFull isUseString:(NSInteger)isUse  amountMinString:(NSString *)amountMin amountMaxString:(NSString *)amountMax keepBalString:(NSString *)keepBal investmentMinString:(NSString *)investmentMin investmentMaxString:(NSString *)investmentMax rateMinString:(NSString *)rateMin rateMaxString:(NSString *)rateMax srfString:(NSString *)srfStr success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 
 我的-首页-借款明细
 {"id":"2"}    id为借款id
 */
+(void)YFUidString:(NSString *)uid success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 
 我的-我的借款-取消借款
 {"id":"2"}    id为借款id
 */
+(void)YFloanCancelString:(NSString *)uid srfString:(NSString *)srfStr success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;


/**
 
 我的-首页-借款明细-提前还款数据获取
 {"id":"2"}    id为借款id
 */
+(void)YFGetAdvanceUidString:(NSString *)uid success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;


/**
 
 设置用户投资类型
 "investmentType":"稳健型"
 */
+(void)YFInvestmentTypeString:(NSString *)investmentType success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 我的-首页-我的投资-我的投资列表
 pageNum 第几页  从1开始计算
 pageSize 每页的个数
 */
+(void)YFInvestmentListPageNumString:(NSString *)pageNum PageSizeString:(NSString *)pageSize success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 我的-首页-我的投资-我的历史投资
 pageNum 第几页  从1开始计算
 pageSize 每页的个数
 */
+(void)YFInvestmentHistoryListPageNumString:(NSString *)pageNum PageSizeString:(NSString *)pageSize success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 
 我的-首页-我的投资-我的投资详情
 "id":"投资记录id"
 */
+(void)YFInvestmentDetailTypeString:(NSString *)investmentId success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**
 
 我的-首页-我的投资-撤销投标
 "id":"投资单id"
 */
+(void)YFInvestmentCancelString:(NSString *)CancelId srfString:(NSString *)srfStr success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**
 
 我的-首页-我的投资-撤销投资数据获取
 "id":"投资单id"
 */
+(void)YFInvestmentCancelDataTypeString:(NSString *)InvestmentCancelDataId success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**
 我的-资金明细
 pageNum 第几页  从1开始计算
 pageSize 每页的个数
 返回的类型status     1提现2充值3投资成功4项目回款5撤销投资6自动还款7手动还款8借款成功9转让成功
 */
+(void)YFAccountRecordListNumString:(NSString *)pageNum PageSizeString:(NSString *)pageSize success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 我的-充值
 我的-充值(根据充值金额计算手续费)
 */
+(void)YFRechargeDataString:(NSString *)amount success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**
 我的-充值
 
 */
+(void)YFRechargeString:(NSString *)amount String:(NSString *)type rechargeWayString:(NSString *)rechargeWay srfString:(NSString *)srf success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 我的-充值-充值记录
 */
+(void)YFRechargeListString:(NSString *)pageNum PageSizeString:(NSString *)pageSize success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 我的-提现(根据提现金额计算手续费)
 */
+(void)YFWithDrawDataString:(NSString *)amount success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 我的-提现-提现记录
 */
+(void)YFWithdrawListString:(NSString *)pageNum PageSizeString:(NSString *)pageSize success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;


/**
 我的-提现
 
 */
+(void)YFWithdrawString:(NSString *)amount typeString:(NSString *)type srfString:(NSString *)srfStr success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**
 我的-账户信息-账户安全-替换手机号
 
 */
+(void)YFResetPhoneString:(NSString *)username success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;


/**
 我的-首页-我的投资-债权转让列表数据获取
 */
+(void)YFinvestmentTransferListString:(NSString *)pageNum PageSizeString:(NSString *)pageSize typeString:(NSString *)type success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 我的-首页-我的投资-债权转让-转让数据获取
 */
+(void)YFInvestmentTransferDataIdString:(NSString *)idSting success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;


/**
 
 我的-首页-我的投资-债权转让-发布债转
 */
+(void)YFInvestmentTransferDeliveryString:(NSString *)InvestmentTransferDataId andSrf:(NSString *)srf success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**
 我的银行卡
 {"type":"0"}  0借款存管账户银行卡获取   1投资账户存管银行卡数据获取
 */
+(void)YFBankCardTypeString:(NSString *)type success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**
 添加或替换银行卡的网关地址获取
 {"cardno":"6228481234567891011","phone":"13735595306","type":0}   cardno新银行卡号 phone预留手机号  type账户类型 0借款账户 1投资账户
 */
+(void)YFBankCardTypeString:(NSString *)type cardnoString:(NSString *)cardno phoneString:(NSString *)phone success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**
 解绑银行卡的网关地址获取
 {"type":0}   type解绑的账户类型 0为借款存管账户银行卡  1为存管账户银行卡
 */
+(void)YFUnBindCardTypeString:(NSString *)type success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**
 验证身份证号
 "username":"13735595314",
 "idcard":"342956565"
 }
 */
+(void)YFValidIdCardcardnoString:(NSString *)cardno phoneString:(NSString *)phone success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**
 更新预留手机号的网关地址获取
 */
+(void)YFSwitchPrePhoneTypeString:(NSString *)type success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**
 修改存管交易密码
 */
+(void)YFModifyTradePasswordTypeString:(NSString *)type statusString:(NSString *)status success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 充值/提现 前验证两个存管账户是否都有在用银行卡
 */
+(void)YFValidBankCardSuccess:(void (^)(id json))success failure:(void (^)(NSError *error))failure;



/**
 App|我的-首页-借款明细-提前还款
 {"id",43}  借款单id
 */
+(void)YFAheadRepayUidString:(NSString *)uid  andStr:(NSString *)srf success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 颁发众签数字证书且签署金米袋用户授权委托书（并签署三方协议）
 无需传参
 */
+(void)YFDigitalSignAuthSuccess:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 我的-首页-我的投资-债权转让-取消转让
 */
+(void)YFinvestmentTransferCancelString:(NSString *)idSting srfString:(NSString *)srfStr success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;


@end
