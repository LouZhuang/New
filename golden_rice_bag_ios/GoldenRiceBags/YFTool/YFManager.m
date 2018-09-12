//
//  YFManager.m
//  FDBigHealth
//
//  Created by 风鼎-叶烽 on 2018/3/6.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFManager.h"

@implementation YFManager

/**  不用tokenPost  */
+(void)Params:(id)params HttpUrlString:(NSString *)url success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    
    NSLog(@"**********************参数和url**************************************");
    NSLog(@"**********************参数和url**************************************");
    NSLog(@"**********************参数和url**************************************");
    NSLog(@"**********************参数和url**************************************");
    
    NSLog(@"\n params === %@   \n  url ==== %@ \n",[params aci_decryptWithAES],url);
    
    NSLog(@"\n**********************参数和url**************************************");
    NSLog(@"**********************参数和url**************************************");
    NSLog(@"**********************参数和url**************************************");
    NSLog(@"**********************参数和url**************************************");

    // 1.创建请求管理者
    AFHTTPSessionManager *YFManager = [AFHTTPSessionManager manager];
    YFManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    YFManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    YFManager.requestSerializer.timeoutInterval = 10;
//     [YFManager.requestSerializer setValue:params forHTTPHeaderField:@"RequestBody"];
    // 2.发送请求
    [YFManager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            
            NSString * str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
            
            NSMutableString * safeBase64Str = [[NSMutableString alloc]initWithString:str];
            safeBase64Str = (NSMutableString * )[safeBase64Str stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
            safeBase64Str = (NSMutableString * )[safeBase64Str stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
            
            NSInteger mod4 = safeBase64Str.length % 4;
            if(mod4 > 0)
                [safeBase64Str appendString:[@"====" substringToIndex:(4-mod4)]];
            
            NSDictionary *dict = [YFTool dictionaryWithJsonString:[safeBase64Str aci_decryptWithAES]];
            NSLog(@"\n dict == %@ \n",dict);
            
            
            [YFProgressHUD dismiss];
            success(dict);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
             NSLog(@" error == %@",error);
            
          
            NSData *data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
            if (data != nil) {
                NSDictionary *errorDict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                
                NSLog(@"Login error == %@",errorDict);
                
                [YFProgressHUD showInfoWithStatus:[errorDict objectForKey:@"error_description"]];
            }
          
           
      
        }
    }];
}



/**  用tokenPost  */
+(void)TokenParams:(id)params HttpUrlString:(NSString *)url success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    
    NSLog(@"**********************参数和url**************************************");
    NSLog(@"**********************参数和url**************************************");
    NSLog(@"**********************参数和url**************************************");
    NSLog(@"**********************参数和url**************************************");
   
    NSLog(@"\n params === %@    \n  url ==== %@  \n\n",[params aci_decryptWithAES],url);
   
    NSLog(@"**********************参数和url**************************************");
    NSLog(@"**********************参数和url**************************************");
    NSLog(@"**********************参数和url**************************************");
    NSLog(@"**********************参数和url**************************************");
    // 1.创建请求管理者
    AFHTTPSessionManager *YFManager = [AFHTTPSessionManager manager];
    YFManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    YFManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    YFManager.requestSerializer.timeoutInterval = 10;
    [YFManager.requestSerializer setValue:[NSString stringWithFormat:@"Bearer  %@",[YFTool userDefaultsId:YFAccess_Token]] forHTTPHeaderField:@"Authorization"];
    // 2.发送请求
    [YFManager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            NSString * str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSMutableString * safeBase64Str = [[NSMutableString alloc]initWithString:str];
            safeBase64Str = (NSMutableString * )[safeBase64Str stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
            safeBase64Str = (NSMutableString * )[safeBase64Str stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
            NSInteger mod4 = safeBase64Str.length % 4;
            if(mod4 > 0)
                [safeBase64Str appendString:[@"====" substringToIndex:(4-mod4)]];
            NSDictionary *dict = [YFTool dictionaryWithJsonString:[safeBase64Str aci_decryptWithAES]];
            [YFProgressHUD dismiss];
            
            NSLog(@"\n dict == %@ \n",dict);
            success(dict);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            
            failure(error);
            
            [YFProgressHUD dismiss];
            NSLog(@"错误原因 == %@",error);
            
            
            
        }
    }];
}


/**  图片上传  */
+(void)OSS:(UIImage *)img success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    
    
    NSData *imageData;
    //判断图片是不是png格式的文件
    if (UIImagePNGRepresentation(img)) {
        //返回为png图像。
        UIImage *imagenew = [YFTool imageWithImageSimple:img scaledToSize:CGSizeMake(200, 200)];
        imageData = UIImagePNGRepresentation(imagenew);
    }else {
        //返回为JPEG图像。
        UIImage *imagenew = [YFTool imageWithImageSimple:img scaledToSize:CGSizeMake(200, 200)];
        imageData = UIImageJPEGRepresentation(imagenew, 0.1);
    }
    
    
    NSString *endpoint =@"http://oss-cn-shanghai.aliyuncs.com";
    // 明文设置secret的方式建议只在测试时使用，更多鉴权模式参考后面链接给出的官网完整文档的`访问控制`章节
    id<OSSCredentialProvider> credential = [[OSSPlainTextAKSKPairCredentialProvider alloc] initWithPlainTextAccessKey:AccessKey
                                                                                                            secretKey:SecretKey];
    OSSClient * client = [[OSSClient alloc] initWithEndpoint:endpoint credentialProvider:credential];
    OSSPutObjectRequest * put = [OSSPutObjectRequest new];
    // required fields
    
    put.bucketName = BUCKETNAME;
    NSString *objectKeys = [NSString stringWithFormat:@"%@.jpg",[YFTool getTimeNow]];
    
    put.objectKey = objectKeys;
    
    put.uploadingData = imageData;
    put.uploadProgress = ^(int64_t bytesSent, int64_t totalByteSent, int64_t totalBytesExpectedToSend) {
        NSLog(@"%lld, %lld, %lld", bytesSent, totalByteSent, totalBytesExpectedToSend);
    };
    OSSTask * putTask = [client putObject:put];
    
    [putTask continueWithBlock:^id(OSSTask *task) {
        task = [client presignPublicURLWithBucketName:BUCKETNAME
                                        withObjectKey:objectKeys];
        NSLog(@"objectKey: %@", put.objectKey);
        
        if (!task.error) {
            NSLog(@"222 == %@",[NSString stringWithFormat:@"%@%@",OSSHTTPS,put.objectKey]);
            
            success([NSString stringWithFormat:@"%@%@",OSSHTTPS,put.objectKey]);
            
            
        } else {
        
            
            failure(task.error);
            [SVProgressHUD dismiss];
            
        }
        return nil;
    }];
    
}

/**  SRF  */
+(void)SRFParams:(id)params HttpUrlString:(NSString *)url srfString:(NSString *)srf success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    NSLog(@"**********************参数和url**************************************");
    NSLog(@"**********************参数和url**************************************");
    NSLog(@"**********************参数和url**************************************");
    NSLog(@"**********************参数和url**************************************");
    
    NSLog(@"\n params === %@   \n url ==== %@     \n srf ===== %@  \n",[params aci_decryptWithAES],url,srf);
   
    NSLog(@"**********************参数和url**************************************");
    NSLog(@"**********************参数和url**************************************");
    NSLog(@"**********************参数和url**************************************");
    NSLog(@"**********************参数和url**************************************");
    // 1.创建请求管理者
    AFHTTPSessionManager *YFManager = [AFHTTPSessionManager manager];
    YFManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    YFManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    YFManager.requestSerializer.timeoutInterval = 10;
    [YFManager.requestSerializer setValue:srf forHTTPHeaderField:@"srf"];
    // 2.发送请求
    [YFManager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            
            NSString * str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
            
            NSMutableString * safeBase64Str = [[NSMutableString alloc]initWithString:str];
            safeBase64Str = (NSMutableString * )[safeBase64Str stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
            safeBase64Str = (NSMutableString * )[safeBase64Str stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
            
            NSInteger mod4 = safeBase64Str.length % 4;
            if(mod4 > 0)
                [safeBase64Str appendString:[@"====" substringToIndex:(4-mod4)]];
            
            NSDictionary *dict = [YFTool dictionaryWithJsonString:[safeBase64Str aci_decryptWithAES]];
            
            [YFProgressHUD dismiss];
            NSLog(@"\n dict == %@ \n",dict);
            success(dict);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
            NSLog(@" error == %@",error);
            
            NSData *data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
            NSDictionary *errorDict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            NSLog(@"Login error == %@",errorDict);
            
            [YFProgressHUD showInfoWithStatus:[errorDict objectForKey:@"error_description"]];
            
            
        }
    }];
}


/**  用token SRFPost  */
+(void)TokenSrfParams:(id)params HttpUrlString:(NSString *)url srfString:(NSString *)srf success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    
    NSLog(@"**********************参数和url**************************************");
    NSLog(@"**********************参数和url**************************************");
    NSLog(@"**********************参数和url**************************************");
    NSLog(@"**********************参数和url**************************************");
    
    NSLog(@"\n params === %@    \n  url ==== %@    \n srf ===== %@ \n",[params aci_decryptWithAES],url,srf);
    
    NSLog(@"**********************参数和url**************************************");
    NSLog(@"**********************参数和url**************************************");
    NSLog(@"**********************参数和url**************************************");
    NSLog(@"**********************参数和url**************************************");
    // 1.创建请求管理者
    AFHTTPSessionManager *YFManager = [AFHTTPSessionManager manager];
    YFManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    YFManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    YFManager.requestSerializer.timeoutInterval = 10;
    [YFManager.requestSerializer setValue:[NSString stringWithFormat:@"Bearer  %@",[YFTool userDefaultsId:YFAccess_Token]] forHTTPHeaderField:@"Authorization"];
    [YFManager.requestSerializer setValue:srf forHTTPHeaderField:@"srf"];
    // 2.发送请求
    [YFManager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            NSString * str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSMutableString * safeBase64Str = [[NSMutableString alloc]initWithString:str];
            safeBase64Str = (NSMutableString * )[safeBase64Str stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
            safeBase64Str = (NSMutableString * )[safeBase64Str stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
            NSInteger mod4 = safeBase64Str.length % 4;
            if(mod4 > 0)
                [safeBase64Str appendString:[@"====" substringToIndex:(4-mod4)]];
            NSDictionary *dict = [YFTool dictionaryWithJsonString:[safeBase64Str aci_decryptWithAES]];
            [YFProgressHUD dismiss];
            NSLog(@"\n dict == %@ \n",dict);
            success(dict);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            
            failure(error);
            
            [YFProgressHUD dismiss];
            NSLog(@"错误原因 == %@",error);
            
            
            
        }
    }];
}




@end
