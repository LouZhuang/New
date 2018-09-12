//
//  YFProgressHUD.m
//  FDBigHealth
//
//  Created by 风鼎-叶烽 on 2018/2/6.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFProgressHUD.h"

@implementation YFProgressHUD

+(void)showInfoWithStatus:(NSString *)YFSTR
{
    [SVProgressHUD showInfoWithStatus:YFSTR];
    [SVProgressHUD dismissWithDelay:1.5f];
}
+(void)showWithStatus:(NSString *)YFSTR
{
    [SVProgressHUD showWithStatus:YFSTR];
}
+(void)showSuccessWithStatus:(NSString *)YFSTR
{
    NSLog(@"YFSTR == %@",YFSTR);
    [SVProgressHUD showSuccessWithStatus:YFSTR];
    [SVProgressHUD dismissWithDelay:1.5f];
}

+(void)dismiss
{
    [SVProgressHUD dismiss];
}


@end
