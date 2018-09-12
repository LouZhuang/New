//
//  YFSRFManager.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/6/25.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFSRFManager : NSObject
+(void)YFSrfSuccess:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
@end
