//
//  YFHomePageRequest.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/29.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YFTool.h"
#import "YFManager.h"
@interface YFHomePageRequest : NSObject
/**
 
 首页
 
 */
+(void)HomePageIndexSuccess:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 
 首页-项目详情
 
 */
+(void)YFHomePageProjectDetail:(NSString *)ProjectId success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**
 
 
 购买项目份额时获取用户账号余额，和生效的优惠券和红包，项目剩余可买和已售百分数
 
 */
+(void)YFHomegetData:(NSString *)ProjectId success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 
 
 根据购买项目份额 计算手续费
 
 */
+(void)YFHomecalculate:(NSString *)ProjectId amountString:(NSString *)amount couponIdString:(NSString *)couponId couponlistIdString:(NSString *)couponlist success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 
 
 购买份额
 
 */
+(void)YFHomeInvestmentProjectId:(NSString *)ProjectId amountString:(NSString *)amount couponIdString:(NSString *)couponId couponlistIdString:(NSString *)couponlist srfString:(NSString *)srfStr success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 
 开通存管网关地址获取
 {"realName":"张三","idCardNo":"342901199408193339","bankcardNo":"6228481234567891011","mobile":"13112341234","userRole":"INVESTOR"}
 realName：用户姓名  idCardNo：用户身份证号   bankcardNo:用户银行卡号  mobile:银行卡预留手机号   userRole:存管账户角色  投资者INVESTOR借款人BORROWERS
 
 */
+(void)YFHomeRealNameString:(NSString *)realName idCardNoString:(NSString *)idCardNo bankcardNoString:(NSString *)bankcardNo mobileString:(NSString *)mobile userRoleString:(NSString *)userRole success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/*
 产品列表
 */
+(void)YFHomePageProjectListDetail:(NSString *)ProjectId success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
@end
