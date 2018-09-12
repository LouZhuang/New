//
//  YFProgressView.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFTool.h"
@interface YFProgressView : UIView

/*
 进度条
 */
@property(nonatomic,strong)UIView *progressView;

-(void)setterFloat:(CGFloat)YFFloat;

@end
