//
//  NSString+NSDateForStr.h
//  GoldenRiceBags
//
//  Created by wiseMacBookPro on 2018/7/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSDateForStr)
/**
 时间转时间戳
 */
- (NSString *)getTimestampFromTime;
/**
 时间戳转时间
 */
- (NSString *)getTimeFromTimestamp;
@end
