//
//  YFBaseTableView.m
//  FDBigHealth
//
//  Created by 风鼎-叶烽 on 2018/2/2.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableView.h"

@implementation YFBaseTableView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.delaysContentTouches = NO;//延迟调用滚动方法
    self.canCancelContentTouches = YES;//控制控件是否接触取消touch的事件
    //    self.separatorStyle = UITableViewCellSeparatorStyleNone;//取消分割线
    self.backgroundColor = [UIColor clearColor];//透明背景
    
    UIView *wrapView = self.subviews.firstObject;
    
    if (wrapView && [NSStringFromClass(wrapView.class) hasSuffix:@"WrapperView"]) {
        for (UIGestureRecognizer *gesture in wrapView.gestureRecognizers) {
            if ([NSStringFromClass(gesture.class) containsString:@"DelayedTouchesBegan"]) {
                gesture.enabled = NO;
                break;
            }
        }
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    self.delaysContentTouches = NO;//延迟调用滚动方法
    self.canCancelContentTouches = YES;//控制控件是否接触取消touch的事件
    //    self.separatorStyle = UITableViewCellSeparatorStyleNone;//取消分割线
    self.backgroundColor = [UIColor clearColor];//透明背景
    
    UIView *wrapView = self.subviews.firstObject;
    
    if (wrapView && [NSStringFromClass(wrapView.class) hasSuffix:@"WrapperView"]) {
        for (UIGestureRecognizer *gesture in wrapView.gestureRecognizers) {
            if ([NSStringFromClass(gesture.class) containsString:@"DelayedTouchesBegan"]) {
                gesture.enabled = NO;
                break;
            }
        }
    }
    return self;
}



- (BOOL)touchesShouldCancelInContentView:(UIView *)view
{
    if ([view isKindOfClass:[UIControl class]]) {
        return YES;
    }
    return [super touchesShouldCancelInContentView:view];
}

-(CGPoint)contentOffset
{
    return [super contentOffset];
}

@end
