//
//  YFHomePageModel.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/29.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFHomePageModel.h"

@implementation YFHomePageModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    if (value == nil ||[value isKindOfClass:[NSNull class]]) {
        value = @"";
    }
    
}
@end
