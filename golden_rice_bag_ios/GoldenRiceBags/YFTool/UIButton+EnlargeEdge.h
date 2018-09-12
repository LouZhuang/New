//
//  UIButton+EnlargeEdge.h
//  ZhongYiyao
//
//  Created by 烽哥 on 15/9/21.
//  Copyright (c) 2015年 烽哥 All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIButton (EnlargeEdge)

- (void)setEnlargeEdge:(CGFloat) size;
- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;

@end
