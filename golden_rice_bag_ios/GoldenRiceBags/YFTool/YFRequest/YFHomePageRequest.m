//
//  YFHomePageRequest.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/29.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFHomePageRequest.h"

@implementation YFHomePageRequest

/**
 
 首页
 
 */
+(void)HomePageIndexSuccess:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    NSDictionary *params = @{ @"pageSize":@(10),
                            @"pageNum":@(1)};
    NSString *encryptStr = [[YFTool convertToJsonData:params] aci_encryptWithAES];

    
    return [YFManager TokenParams:encryptStr HttpUrlString:YF_HomePageIndex success:^(id json) {
        
        success(json);
        
    } failure:^(NSError *error) {
        [YFProgressHUD dismiss];
        [YFTool CreatUIAlertView];
        
    }];
    
}

/**
 
 首页-项目详情
 
 */
+(void)YFHomePageProjectDetail:(NSString *)ProjectId success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    NSMutableDictionary *params = @{
                                    @"id":ProjectId
                                    }.mutableCopy;
   
    NSString *encryptStr = [[YFTool convertToJsonData:params] aci_encryptWithAES];
    return [YFManager TokenParams:encryptStr HttpUrlString:YF_ProjectDetail success:^(id json) {
        
        success(json);
        
    } failure:^(NSError *error) {
        [YFProgressHUD dismiss];
        [YFTool CreatUIAlertView];
        
    }];
    
}
/**
 
 产品列表详情 
 
 */
+(void)YFHomePageProjectListDetail:(NSString *)ProjectId success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

{
    NSMutableDictionary *params = @{
                                    @"id":ProjectId
                                    }.mutableCopy;
    
    NSString *encryptStr = [[YFTool convertToJsonData:params] aci_encryptWithAES];
    return [YFManager TokenParams:encryptStr HttpUrlString:YF_ProjectDetail success:^(id json) {
        
        success(json);
        
    } failure:^(NSError *error) {
        [YFProgressHUD dismiss];
        [YFTool CreatUIAlertView];
        
    }];
    
}

/**
 
 
 购买项目份额时获取用户账号余额，和生效的优惠券和红包，项目剩余可买和已售百分数
 
 */
+(void)YFHomegetData:(NSString *)ProjectId success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    NSMutableDictionary *params = @{
                                    @"id":ProjectId
                                    }.mutableCopy;
    
    NSString *encryptStr = [[YFTool convertToJsonData:params] aci_encryptWithAES];
    
    return [YFManager TokenParams:encryptStr HttpUrlString:YF_GetData success:^(id json) {
        
        success(json);
        
    } failure:^(NSError *error) {
        [YFProgressHUD dismiss];
        [YFTool CreatUIAlertView];
        
    }];
    
}

/**
 
 
 根据购买项目份额 计算手续费
 
 */
+(void)YFHomecalculate:(NSString *)ProjectId amountString:(NSString *)amount couponIdString:(NSString *)couponId couponlistIdString:(NSString *)couponlist success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    
    NSMutableDictionary *params = @{
                                    @"id":ProjectId,
                                     @"amount":amount
                                    }.mutableCopy;
  
    if (![couponId isEqualToString:@"kong"] && [couponlist isEqualToString:@"kong"]) {
        [params setObject:couponId forKey:@"couponId"];
  
    }
    if ([couponId isEqualToString:@"kong"] && ![couponlist isEqualToString:@"kong"]) {
        [params setObject:couponlist forKey:@"couponId"];
    }
    if (![couponId isEqualToString:@"kong"] && ![couponlist isEqualToString:@"kong"]) {
        [params setObject:[NSString stringWithFormat:@"%@-%@",couponId,couponlist] forKey:@"couponId"];
    }
    

    
    NSString *encryptStr = [[YFTool convertToJsonData:params] aci_encryptWithAES];
    
    return [YFManager TokenParams:encryptStr HttpUrlString:YF_Calculate success:^(id json) {
        
        success(json);
        
    } failure:^(NSError *error) {
        [YFProgressHUD dismiss];
        [YFTool CreatUIAlertView];
        
    }];
    
}


/**
 
 
 购买份额
 
 */
+(void)YFHomeInvestmentProjectId:(NSString *)ProjectId amountString:(NSString *)amount couponIdString:(NSString *)couponId couponlistIdString:(NSString *)couponlist srfString:(NSString *)srfStr success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    
    NSMutableDictionary *params = @{
                                    @"id":ProjectId,
                                    @"amount":amount
                                    }.mutableCopy;
    
    if (![couponId isEqualToString:@"kong"] && [couponlist isEqualToString:@"kong"]) {
        [params setObject:couponId forKey:@"couponId"];
        
    }
    if ([couponId isEqualToString:@"kong"] && ![couponlist isEqualToString:@"kong"]) {
        [params setObject:couponlist forKey:@"couponId"];
    }
    if (![couponId isEqualToString:@"kong"] && ![couponlist isEqualToString:@"kong"]) {
        [params setObject:[NSString stringWithFormat:@"%@-%@",couponId,couponlist] forKey:@"couponId"];
    }
    
    
    
    NSString *encryptStr = [[YFTool convertToJsonData:params] aci_encryptWithAES];
    
    return [YFManager TokenSrfParams:encryptStr HttpUrlString:YF_Investment srfString:srfStr success:^(id json) {
        
        success(json);
        
    } failure:^(NSError *error) {
        [YFProgressHUD dismiss];
        [YFTool CreatUIAlertView];
        
    }];
    
}




/**
 
 开通存管网关地址获取
 {"realName":"张三","idCardNo":"342901199408193339","bankcardNo":"6228481234567891011","mobile":"13112341234","userRole":"INVESTOR"}
 realName：用户姓名  idCardNo：用户身份证号   bankcardNo:用户银行卡号  mobile:银行卡预留手机号   userRole:存管账户角色  投资者INVESTOR借款人BORROWERS
 
 */
+(void)YFHomeRealNameString:(NSString *)realName idCardNoString:(NSString *)idCardNo bankcardNoString:(NSString *)bankcardNo mobileString:(NSString *)mobile userRoleString:(NSString *)userRole success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    NSMutableDictionary *params = @{
                                    @"realName":realName,
                                    @"idCardNo":idCardNo,
                                    @"bankCardNo":bankcardNo,
                                    @"mobile":mobile,
                                    @"userRole":userRole
                                    }.mutableCopy;
    
    NSLog(@"111 == %@",params);
    
    NSString *encryptStr = [[YFTool convertToJsonData:params] aci_encryptWithAES];
    
    return [YFManager TokenParams:encryptStr HttpUrlString:YF_Regurl success:^(id json) {
        
        success(json);
        
    } failure:^(NSError *error) {
        
        [YFProgressHUD dismiss];
        [YFTool CreatUIAlertView];
        
    }];
    
}




@end
