//
//  YFManager.h
//  FDBigHealth
//
//  Created by 风鼎-叶烽 on 2018/3/6.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YFTool.h"
#import <AliyunOSSiOS/OSSService.h>
#import <AliyunOSSiOS/OSSCompat.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>
#import <CommonCrypto/CommonHMAC.h>
@interface YFManager : NSObject


/**  不用token  */
+(void)Params:(id)params HttpUrlString:(NSString *)url success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**  用tokenPost  */
+(void)TokenParams:(id)params HttpUrlString:(NSString *)url success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**  图片上传  */
+(void)OSS:(UIImage *)img success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**  SRF  */
+(void)SRFParams:(id)params HttpUrlString:(NSString *)url srfString:(NSString *)srf success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
/**  用token SRFPost  */
+(void)TokenSrfParams:(id)params HttpUrlString:(NSString *)url srfString:(NSString *)srf success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
@end
