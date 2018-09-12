//
//  YFLoginRequest.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/26.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFLoginRequest.h"

@implementation YFLoginRequest

/**
 srf获取
 */
+(void)YFSrfSuccess:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    NSString *encryptStr = [@"" aci_encryptWithAES];
    
    return [YFManager Params:encryptStr HttpUrlString:YF_SRF  success:^(id json) {
        
        success(json);
        
    } failure:^(NSError *error) {
        [YFProgressHUD dismiss];
        [YFTool CreatUIAlertView];
        
    }];
    
}

/**
 账户存在验证
  phone 手机号
 */
+(void)YFPhoneString:(NSString *)phone success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    NSMutableDictionary *params = @{
                                    @"username":phone
                                    }.mutableCopy;
    
    NSString *encryptStr = [[YFTool convertToJsonData:params] aci_encryptWithAES];

    return [YFManager Params:encryptStr HttpUrlString:YF_Phone success:^(id json) {
        
        success(json);
        
    } failure:^(NSError *error) {
        [YFProgressHUD dismiss];
        NSLog(@"错误原因 == %@",error);
        [YFTool CreatUIAlertView];
    }];
    
}

/**
 验证码发送接口
 phone 手机号
 keyCode 标识符 signUp注册   signIn登录   common通用
 timeStamp 时间戳一定为1521260162000形式
 
 */
+(void)YFPhoneString:(NSString *)phone keyCodeString:(NSString *)keyCode timeStampString:(NSString *)timeStamp srfString:(NSString *)srf success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    NSMutableDictionary *params = @{
                                    @"phone":phone,
                                    @"keyCode":keyCode,
                                    @"timeStamp":timeStamp
                                    }.mutableCopy;
    
   
    
    NSString *encryptStr = [[YFTool convertToJsonData:params] aci_encryptWithAES];
    
    return [YFManager SRFParams:encryptStr HttpUrlString:YF_SMS srfString:srf success:^(id json) {
        
//          NSLog(@"短信== %@",json);
        success(json);
        
    } failure:^(NSError *error) {
        [YFProgressHUD dismiss];
        NSLog(@"错误原因 == %@",error);
        [YFTool CreatUIAlertView];
    }];
}

/**
 验证码验证接口
 phone 手机号
 keyCode 标识符 signUp注册   signIn登录   common通用
smsCode 验证码
 
 */
+(void)YFPhoneString:(NSString *)phone keyCodeString:(NSString *)keyCode smsCodeString:(NSString *)smsCode success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    NSMutableDictionary *params = @{
                                    @"phone":phone,
                                    @"keyCode":keyCode,
                                    @"smsCode":smsCode
                                    }.mutableCopy;
    
  
    
    NSString *encryptStr = [[YFTool convertToJsonData:params] aci_encryptWithAES];
    return [YFManager Params:encryptStr HttpUrlString:YF_Validation success:^(id json) {
        
        success(json);
        
    } failure:^(NSError *error) {
        [YFProgressHUD dismiss];
        NSLog(@"错误原因 == %@",error);
        [YFTool CreatUIAlertView];
    }];
}


/**
 app用户注册
username 手机号
password 密码
invitedCode 邀请手机号
 
 */
+(void)YFUsernameString:(NSString *)username passwordString:(NSString *)password invitedCodeString:(NSString *)invitedCode srfString:srfStr success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    NSMutableDictionary *params = @{
                                    @"username":username,
                                    @"password":password,
                                    @"invitedCode":invitedCode
                                    }.mutableCopy;
    
    NSString *encryptStr = [[YFTool convertToJsonData:params] aci_encryptWithAES];
    
    return [YFManager SRFParams:encryptStr HttpUrlString:YF_SignUp srfString:srfStr success:^(id json) {
        
        success(json);
        
    } failure:^(NSError *error) {
        [YFProgressHUD dismiss];
        NSLog(@"错误原因 == %@",error);
        [YFTool CreatUIAlertView];
    }];
}


/**
登录
 username 手机号
 password 密码

 
 */
+(void)YFUsernameString:(NSString *)username passwordString:(NSString *)password success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    NSMutableDictionary *params = @{
                                    @"username":username,
                                    @"password":password
                                    }.mutableCopy;
    
    NSString *encryptStr = [[YFTool convertToJsonData:params] aci_encryptWithAES];
    
    return [YFManager Params:encryptStr HttpUrlString:YF_SignIn success:^(id json) {
        
        success(json);
        
    } failure:^(NSError *error) {
//        [YFTool CreatUIAlertView];
    }];
}


/**
验证手机号是否实名过
 
 
 */
+(void)YFValidCertificationUsernameString:(NSString *)username success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    NSMutableDictionary *params = @{
                                    @"username":username
                                    }.mutableCopy;
    
    
    NSString *encryptStr = [[YFTool convertToJsonData:params] aci_encryptWithAES];
    
    return [YFManager Params:encryptStr HttpUrlString:YF_ValidCertification success:^(id json) {
        
        success(json);
        
    } failure:^(NSError *error) {
        //        [YFTool CreatUIAlertView];
    }];
}

/**
未登录重新设置新密码
 {"username":"13735595314","idcard":"342956565","newPassword":"644545dsds"}    如果说用户未实名，idcard字段可以不传
 
 */
+(void)YFForgetPasswordUsernameString:(NSString *)username realNameString:(NSString *)realName idcardString:(NSString *)idcard newPasswordString:(NSString *)newPassword success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    NSMutableDictionary *params = @{
                                    @"username":username,
                                    @"newPassword":newPassword
                                    }.mutableCopy;
    
    if (realName.length!=0) {
        [params setObject:idcard forKey:@"idcard"];
    }
    
    
    NSString *encryptStr = [[YFTool convertToJsonData:params] aci_encryptWithAES];
    
    return [YFManager Params:encryptStr HttpUrlString:YF_ForgetPasswordn success:^(id json) {
        
        success(json);
        
    } failure:^(NSError *error) {
        //        [YFTool CreatUIAlertView];
    }];
}

/**
用户登录设备信息注册
 */
+(void)YFRegisterSuccess:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    NSMutableDictionary *params = @{
                                    @"platform":@"IOS",
                                    @"deviceToken":[YFTool userDefaultsId:@"YFDeviceToken"]
                                    }.mutableCopy;
    
    NSString *encryptStr = [[YFTool convertToJsonData:params] aci_encryptWithAES];
    
    return [YFManager Params:encryptStr HttpUrlString:YF_Register success:^(id json) {
        
        success(json);
        
    } failure:^(NSError *error) {
        //        [YFTool CreatUIAlertView];
    }];
    
}



@end
