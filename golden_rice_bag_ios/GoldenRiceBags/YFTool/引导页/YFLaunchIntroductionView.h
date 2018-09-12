//
//  YFLaunchIntroductionView.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/24.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFTool.h"
@interface YFLaunchIntroductionView : UIView
/**
 *  选中page的指示器颜色，默认白色
 */
@property (nonatomic, strong) UIColor *currentColor;
/**
 *  其他状态下的指示器的颜色，默认
 */
@property (nonatomic, strong) UIColor *nomalColor;

/**
 *  带按钮的引导页
 *
 *  @param imageNames      背景图片数组
 *  @param buttonImageName 按钮的图片
 *  @param frame           按钮的frame
 *
 *  @return LaunchIntroductionView对象
 */
+(instancetype)sharedWithImages:(NSArray *) imageNames buttonImage:(NSString *) buttonImageName buttonFrame:(CGRect ) frame;



@end
