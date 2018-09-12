//
//  YFCustomTextField.m
//  codeView
//
//  Created by 风鼎-叶烽 on 2018/3/9.
//  Copyright © 2018年 Thinkive. All rights reserved.
//

#import "YFCustomTextField.h"

@implementation YFCustomTextField

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    if (menuController) {
        [UIMenuController sharedMenuController].menuVisible = NO;
    }
    return NO;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
