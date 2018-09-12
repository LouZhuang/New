//
//  TimeButton.h
//  Microfinance
//
//  Created by 风鼎科技-yefeng on 2017/4/26.
//  Copyright © 2017年 风鼎科技03. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeButton : UIButton
- (void)timeFailBeginFrom:(NSInteger)timeCount;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger count;
@end
