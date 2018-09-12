//
//  YFLoginManager.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/26.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFLoginManager.h"

@implementation YFLoginManager



+(void)showLogViewVC
{
    /*
     登录页面
     */
        [YFTool setObject:@"0" key:YFLOGIN];
    YFPhoneNumberInputViewController *vc = [YFPhoneNumberInputViewController new];
    YFBaseNavigationController *nav = [[YFBaseNavigationController alloc]initWithRootViewController:vc];
    
    [[YFTool getCurrentVC] presentViewController:nav animated:YES completion:nil];
    
}
@end
