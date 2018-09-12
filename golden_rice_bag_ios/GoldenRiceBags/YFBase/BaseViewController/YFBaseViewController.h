//
//  YFBaseViewController.h
//  FDBigHealth
//
//  Created by 风鼎-叶烽 on 2018/2/1.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFHomePageRequest.h"
#import "YFTool.h"
#import "YFLoginRequest.h"
#import "YFMineRequest.h"
#import "YFBorrowingRequest.h"
#import "YFProjectFinanceReques.h"
#import "YFRefresh.h"
@interface YFBaseViewController : UIViewController


/**
 *  NavBar
 */
@property (nonatomic, strong) UINavigationBar *navBar;

/**
 *  修改状态栏颜色
 */
@property (nonatomic, assign) UIStatusBarStyle StatusBarStyle;

/**
 *  是否显示返回按钮,默认情况是YES
 */
@property (nonatomic, assign) BOOL isShowLiftBack;

/**
 是否隐藏导航栏
 */
@property (nonatomic, assign) BOOL isHidenNaviBar;

/**
 导航栏字体颜色
 */
@property (nonatomic, strong) UIColor *naviStrColor;

/**
 *  导航栏背景色
 */
@property (nonatomic, strong) UIColor *naviBackGroundColor;

/**
 导航栏添加文本按钮
 
 @param titles 文本数组
 @param isLeft 是否是左边 非左即右
 @param target 目标
 @param action 点击方法
 @param tags tags数组 回调区分用
 */
- (void)addNavigationItemWithTitles:(NSArray *)titles isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags color:(UIColor *)titleColor;

/**
 导航栏添加图标按钮
 
 @param imageNames 图标数组
 @param isLeft 是否是左边 非左即右
 @param target 目标
 @param action 点击方法
 @param tags tags数组 回调区分用
 */
- (void)addNavigationItemWithImageNames:(NSArray *)imageNames isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags;

/**
 *  默认返回按钮的点击事件，默认是返回，子类可重写
 */
- (void)backBtnClicked;







@end
