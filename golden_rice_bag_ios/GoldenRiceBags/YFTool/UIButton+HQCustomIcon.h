//
//  UIButton+EnlargeEdge.h
//  ZhongYiyao
//
//  Created by 烽哥 on 15/9/21.
//  Copyright (c) 2015年 烽哥 All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIButton (HQCustomIcon)

- (void)setIconInLeft;
- (void)setIconInRight;
- (void)setIconInTop;
- (void)setIconInBottom;
- (void)setIconInLeftWithSpacing:(CGFloat)Spacing;
- (void)setIconInRightWithSpacing:(CGFloat)Spacing;
- (void)setIconInTopWithSpacing:(CGFloat)Spacing;
- (void)setIconInBottomWithSpacing:(CGFloat)Spacing;
@end
