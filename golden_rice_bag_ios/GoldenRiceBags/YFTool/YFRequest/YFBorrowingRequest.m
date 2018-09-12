//
//  YFBorrowingRequest.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/28.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBorrowingRequest.h"

@implementation YFBorrowingRequest


/**
 
 根据借款月数获取年化利率
 "size":"接口月数"
 */
+(void)YFSizeString:(NSString *)size typeString:(NSString *)type success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    NSMutableDictionary *params = @{
                                    @"size":size,
                                    @"type":type
                                    }.mutableCopy;
    
    NSString *encryptStr = [[YFTool convertToJsonData:params] aci_encryptWithAES];
    
    
    return [YFManager TokenParams:encryptStr HttpUrlString:YF_GenerateRate success:^(id json) {
        
        success(json);
        
    } failure:^(NSError *error) {
        [YFProgressHUD dismiss];
        [YFTool CreatUIAlertView];
        
    }];
    
}


/**
 
 我要借款-还款方式
 {"size":"16","principal":"10000","repayType":"3"}     size借款月数  整数   principal借款金额 元保留小数点后两位  repayType还款方式  1等额本息2先息后本3一次性还本付息
 */
+(void)YFPageSizeString:(NSString *)size principalString:(NSString *)principal repayTypeString:(NSString *)repayType success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    NSMutableDictionary *params = @{
                                    @"size":size,
                                    @"principal":principal,
                                    @"repayType":repayType
                                    }.mutableCopy;
    
    NSString *encryptStr = [[YFTool convertToJsonData:params] aci_encryptWithAES];
    
    
    return [YFManager TokenParams:encryptStr HttpUrlString:YF_ShowHowsRepay success:^(id json) {
        
        success(json);
        
    } failure:^(NSError *error) {
        [YFProgressHUD dismiss];
        [YFTool CreatUIAlertView];
        
    }];
    
}


/**
 
 我要借款-借款信息提交
 {"organization":"natural","occupation":"采矿业","annualIncome":"2000-5000元","incurDebts":"房贷",
 "otherPlatform":"蚂蚁借呗","otherPlatformLoan":"1000","isOverdue":"0","loanAmount":"10000","loanDays":"10",
 "rateOfYear":"3.5","returnType":"1","usageOfLoan":"旅游","repaySource":"工资收入","assuranceOfMeasure":"有担保措施",
 "guaranteeOrganization":"山西挖煤集团","assuranceInfo":"每日挖煤","isFormalities":"1",
 "pics":[{"href":"www.baidu.com"},{"href":"www.geogle.com"},{"href":"www.sina.com"}]}
 请求参数
 organization 借款主体性质（natural自然人 corporation法人 other其他组织）;
 occupation 所属行业;
 annualIncome 月收入;
 incurDebts 负债情况;
 otherPlatform 借款平台名称;
 otherPlatformLoan 其他平台借款;
 isOverdue  是否逾期(0否1是);
 loanAmount借多少;
 loanDays借多久（月数）;
 rateOfYear年化利率（%）;
 returnType 还款方式（1等额本息，2先息后本，3一次性还本付息）;
 usageOfLoan借款用途;
 repaySource 还款来源;
 assuranceOfMeasure措施保障;
 guaranteeOrganization担保主体;
 assuranceInfo担保措施;
 isFormalities是否已履行完毕相关手续（0否  1是）;
 pics上传图片后的地址数组;
 */
+(void)YFSend:(NSDictionary *)dic srfString:(NSString *)srfStr success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    
    NSString *encryptStr = [[YFTool convertToJsonData:dic] aci_encryptWithAES];
    
    
    return [YFManager TokenSrfParams:encryptStr HttpUrlString:YF_SendLoanInfo srfString:srfStr success:^(id json) {
        
        success(json);
        
    } failure:^(NSError *error) {
        [YFProgressHUD dismiss];
        [YFTool CreatUIAlertView];
        
    }];
    
}



@end
