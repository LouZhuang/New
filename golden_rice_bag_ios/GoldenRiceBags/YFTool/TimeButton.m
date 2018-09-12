//
//  TimeButton.m
//  Microfinance
//
//  Created by 风鼎科技-yefeng on 2017/4/26.
//  Copyright © 2017年 风鼎科技03. All rights reserved.
//

#import "TimeButton.h"


@implementation TimeButton
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setup];
    }
    return self;
}
- (void)setup {
    
    [self setTitle:@"60S" forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:12];

}

- (void)timeFailBeginFrom:(NSInteger)timeCount {
    
    self.count = timeCount;
    self.enabled = NO;
    // 加1个计时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
}

- (void)timerFired {
    if (self.count != 1) {
        self.count -= 1;
        self.enabled = NO;
        [self setTitle:[NSString stringWithFormat:@"%ldS", self.count] forState:UIControlStateNormal];
    } else {
        
        self.enabled = YES;
        [self setTitle:@"重新发送" forState:UIControlStateNormal];
        [self.timer invalidate];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
