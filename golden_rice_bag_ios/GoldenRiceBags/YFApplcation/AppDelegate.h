//
//  AppDelegate.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/9.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFBaseTabBarController.h"
#import "YFLoginManager.h"
#import <UMCommon/UMCommon.h>           // 公共组件是所有友盟产品的基础组件，必选
#import <UMPush/UMessage.h>             // Push组件
#import <UserNotifications/UserNotifications.h>  // Push组件必须的系统库
#import <UMAnalytics/MobClick.h>
#import <UMShare/UMShare.h> //友盟分享
#import "YFLaunchIntroductionView.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

