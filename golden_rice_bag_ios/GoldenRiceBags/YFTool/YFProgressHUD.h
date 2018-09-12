//
//  YFProgressHUD.h
//  FDBigHealth
//
//  Created by 风鼎-叶烽 on 2018/2/6.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVProgressHUD.h"
@interface YFProgressHUD : NSObject

+(void)showInfoWithStatus:(NSString *)YFSTR;
+(void)showWithStatus:(NSString *)YFSTR;
+(void)showSuccessWithStatus:(NSString *)YFSTR;
+(void)dismiss;

@end
