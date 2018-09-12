//
//  YFLoginRequest.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/26.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YFTool.h"
#import "YFManager.h"
@interface YFLoginRequest : NSObject

/**
 srf获取
 */
+(void)YFSrfSuccess:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**  账户存在验证  */
+(void)YFPhoneString:(NSString *)phone success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**  验证码发送接口  */
+(void)YFPhoneString:(NSString *)phone keyCodeString:(NSString *)keyCode timeStampString:(NSString *)timeStamp srfString:(NSString *)srf success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/*
 验证码验证接口
 */
+(void)YFPhoneString:(NSString *)phone keyCodeString:(NSString *)keyCode smsCodeString:(NSString *)smsCode success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

///**  用户注册  */
+(void)YFUsernameString:(NSString *)username passwordString:(NSString *)password invitedCodeString:(NSString *)invitedCode srfString:srfStr success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**
 登录
 */
+(void)YFUsernameString:(NSString *)username passwordString:(NSString *)password success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**
 验证手机号是否实名过
 
 
 */
+(void)YFValidCertificationUsernameString:(NSString *)username success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**
 未登录重新设置新密码
 {"username":"13735595314","idcard":"342956565","newPassword":"644545dsds"}    如果说用户未实名，idcard字段可以不传
 
 */
+(void)YFForgetPasswordUsernameString:(NSString *)username realNameString:(NSString *)realName idcardString:(NSString *)idcard newPasswordString:(NSString *)newPassword success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**
 用户登录设备信息注册
 */

/**
 用户登录设备信息注册
 */
+(void)YFRegisterSuccess:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
@end
