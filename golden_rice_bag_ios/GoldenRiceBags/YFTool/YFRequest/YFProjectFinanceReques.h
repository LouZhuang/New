//
//  YFProjectFinanceReques.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/31.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YFTool.h"
#import "YFManager.h"
@interface YFProjectFinanceReques : NSObject

/**
 
 项目理财
 {"pageNum":"1","pageSize":"10","sort":"rateOfYear","sortType":"ASC","repayTypeStr":"一次性还本付息","projectType":"原项目"}
 
 sort和sortType是组合 有sort就必须有sortType 不传为全部   sort对应排序字段：回报率rateOfYear  期限limitDays  sortType对应排序方式：正序ASC  倒序DESC
 repayTypeStr 还款方式：等额本息、先息后本、一次性还本付息 不传为全部
 projectType  项目类型：原项目、债转项目   不传为全部
 
 
 */
+(void)YFProjectPageNum:(NSString *)pageNum pageSizeString:(NSString *)pageSize  sortString:(NSString *)sort sortTypeString:(NSString *)sortType repayTypeStrString:(NSString *)repayTypeStr projectTypeString:(NSString *)projectType success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

@end
