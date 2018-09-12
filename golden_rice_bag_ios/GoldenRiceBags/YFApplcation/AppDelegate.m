//
//  AppDelegate.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/9.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<UITabBarControllerDelegate,UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(LoginYes) name:@"LoginYes" object:nil];
    //初始化window
    [self initWindow];
    
    /**  设置键盘  */
    [self settingIQKeyBoard];
    
    /**  友盟初始化  */
    [self settingUMPush:launchOptions];
    
    //首次登陆引导页
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
        //第一次启动
        YFLaunchIntroductionView *launch = [YFLaunchIntroductionView sharedWithImages:@[@"Image151",@"Image152",@"Image153"] buttonImage:@"dianjijinruImage" buttonFrame:CGRectMake((WIDTH - YF_W(171))/2, HEIGHT-YF_H(85), YF_W(171), YF_H(53))];
        launch.currentColor = ZHUTICOLOR;
        launch.nomalColor = [UIColor whiteColor];
        
        NSUserDefaults  *userdefaults = [NSUserDefaults standardUserDefaults];
        [userdefaults setObject:@"1" forKey:@"deviceToken"];
        
    }
    
    
    return YES;
}

//获取DeviceToken成功
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    
    NSString *strUrl = [[NSString stringWithFormat:@"%@",deviceToken] stringByReplacingOccurrencesOfString:@" " withString:@""];
    strUrl= [strUrl stringByReplacingOccurrencesOfString:@"<" withString:@""];
    strUrl = [strUrl stringByReplacingOccurrencesOfString:@">" withString:@""];
    NSLog(@"DeviceToken: %@",strUrl);
    [YFTool setObject:strUrl key:@"YFDeviceToken"];
   
  
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return nil;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


/*
 初始化Windows
 */
-(void)initWindow
{
    
    if ([[YFTool userDefaultsString:YFLOGIN] isEqualToString:@"(null)"]) {

        [YFTool setObject:@"0" key:YFLOGIN];
    }

    /**  未登录  */
    if ([[YFTool userDefaultsString:YFLOGIN] integerValue] ==0) {


            self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            self.window.backgroundColor = [UIColor whiteColor];
             YFPhoneNumberInputViewController *YFPhoneNumberInputVC=[[YFPhoneNumberInputViewController alloc]init];
            //a.初始化一个tabBar控制器
            YFBaseNavigationController *homeNavc = [[YFBaseNavigationController alloc] initWithRootViewController:YFPhoneNumberInputVC];

            //设置控制器为Window的根控制器
            self.window.rootViewController=homeNavc;
            [self.window makeKeyAndVisible];
            /**  启动图停留时间  */
            //    [NSThread sleepForTimeInterval:3.0];


    }
    else{
    
        /*
         登录成功
         */
        [self LoginYes];
       
        
    }

    
}

-(void)LoginYes
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    //a.初始化一个tabBar控制器
    YFBaseTabBarController *YFTabBar=[[YFBaseTabBarController alloc]init];
    YFTabBar.delegate = self;
    //设置控制器为Window的根控制器
    self.window.rootViewController=YFTabBar;
    [self.window makeKeyAndVisible];
    /**  启动图停留时间  */
    //    [NSThread sleepForTimeInterval:3.0];
    
}


-(void)settingIQKeyBoard
{
    IQKeyboardManager *keyboadManager = [IQKeyboardManager sharedManager];
    keyboadManager.shouldResignOnTouchOutside = YES;
    keyboadManager.shouldToolbarUsesTextFieldTintColor = YES;
    keyboadManager.enableAutoToolbar = YES;//使用工具栏
    keyboadManager.shouldPlayInputClicks = YES;//按钮声音为空
    keyboadManager.toolbarDoneBarButtonItemText = @"确定";
    [keyboadManager reloadInputViews];
    
}



-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    
    if ([[YFTool userDefaultsString:YFLOGIN] isEqualToString:@"(null)"]) {
        
        [YFTool setObject:@"0" key:YFLOGIN];
    }
    
    /**  未登录  */
    if ([[YFTool userDefaultsString:YFLOGIN] integerValue] ==0) {
        
        if ([[YFTool userDefaultsString:@"title"] isEqualToString:@"我的"]) {
            
            [YFProgressHUD showInfoWithStatus:@"暂未登录,请登录"];
            [YFLoginManager showLogViewVC];
            
            return NO;
        }
        else{
            
            return YES;
            
        }
        
        
    }
    else{
        return YES;
        
        
    }
}

-(void)settingUMPush:(NSDictionary *)launchOptions
{
    /*
     分享
     */
    /* 打开调试日志 */
    [[UMSocialManager defaultManager] openLog:YES];
    
    /* 设置友盟appkey */
    [[UMSocialManager defaultManager] setUmSocialAppkey:@"5652cf0767e58e7ad100068a"];
   
    /* 设置微信的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wx3b9ab53c8648616d" appSecret:@"029c1414f6a83e09163c0679762f1e20" redirectURL:@"http://mobile.umeng.com/social"];
    
    /*
     * 移除相应平台的分享，如微信收藏
     */
  [[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
    
    /* 设置分享到QQ互联的appID
     * U-Share SDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
     */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"1104952055"/*设置QQ平台的appID*/  appSecret:@"fIQERH5KYd2zXvZC" redirectURL:@"http://mobile.umeng.com/social"];
    /* 设置新浪的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:@"331066347"  appSecret:@"3fff8e15b2b1a15c1259fcf3ee4c66da" redirectURL:@"https://sns.whalecloud.com/sina2/callback"];
    
    
    
    // 配置友盟SDK产品并并统一初始化
//    [UMConfigure setLogEnabled:YES];
    [UMConfigure initWithAppkey:@"5abdf5baf43e48434c000023" channel:@"App Store"];
    [MobClick setScenarioType:E_UM_NORMAL];
    // Push组件基本功能配置

    if (@available(iOS 10.0, *)) {
        [UNUserNotificationCenter currentNotificationCenter].delegate = self;
    } else {
        // Fallback on earlier versions
    }

    UMessageRegisterEntity * entity = [[UMessageRegisterEntity alloc] init];
    
    //type是对推送的几个参数的选择，可以选择一个或者多个。默认是三个全部打开，即：声音，弹窗，角标等
    entity.types = UMessageAuthorizationOptionBadge|UMessageAuthorizationOptionAlert|UMessageAuthorizationOptionSound;
   
    [UMessage registerForRemoteNotificationsWithLaunchOptions:launchOptions Entity:entity completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
            // 用户选择了接收Push消息
            NSLog(@" 用户选择了接收Push消息");
        }else{
            // 用户拒绝接收Push消息
             NSLog(@" 用户拒绝接收Push消息");
        }
    }];
    
}
//
//-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
//{
//    [UMessage setAutoAlert:NO];
//    [UMessage didReceiveRemoteNotification:userInfo];
//}
//-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler
//{
//    NSDictionary *userinfo=notification.request.content.userInfo;
//    if ([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
//        [UMessage setAutoAlert:NO];
//        [UMessage didReceiveRemoteNotification:userinfo];
//    }
//}
//-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler
//{
//    NSDictionary *userinfo=response.notification.request.content.userInfo;
//    if ([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
//        [UMessage didReceiveRemoteNotification:userinfo];
//    }
//}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}
//iOS10以下使用这两个方法接收通知，
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    [UMessage setAutoAlert:NO];
    if([[[UIDevice currentDevice] systemVersion]intValue] < 10){
        [UMessage didReceiveRemoteNotification:userInfo];
        completionHandler(UIBackgroundFetchResultNewData);
    }
}

//iOS10新增：处理前台收到通知的代理方法
-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler{
    NSDictionary * userInfo = notification.request.content.userInfo;
    NSLog(@"QIANTAI == %@",userInfo);
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //应用处于前台时的远程推送接受
        //关闭U-Push自带的弹出框
        [UMessage setAutoAlert:NO];
        //必须加这句代码
        [UMessage didReceiveRemoteNotification:userInfo];
        
    }else{
        //应用处于前台时的本地推送接受
    }
    //当应用处于前台时提示设置，需要哪个可以设置哪一个
    completionHandler(UNNotificationPresentationOptionSound|UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionAlert);
}

//iOS10新增：处理后台点击通知的代理方法
-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler{
    NSDictionary * userInfo = response.notification.request.content.userInfo;
     NSLog(@"HOUTAIDIANJI == %@",userInfo);
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //应用处于后台时的远程推送接受
        //必须加这句代码
        [UMessage didReceiveRemoteNotification:userInfo];
        
    }else{
        //应用处于后台时的本地推送接受
    }
}

//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                           O\  =  /O
//                        ____/`---'\____
//                      .'  \\|     |//  `.
//                     /  \\|||  :  |||//  \
//                    /  _||||| -:- |||||-  \
//                    |   | \\\  -  /// |   |
//                    | \_|  ''\---/''  |   |
//                    \  .-\__  `-`  ___/-. /
//                   ___`. .'  /--.--\  `. . __
//                ."" '<  `.___\_<|>_/___.'  >'"".
//              | | :  `- \`.;`\ _ /`;.`/ - ` : | |
//              \  \ `-.   \_ __\ /__ _/   .-` /  /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//                  佛祖镇楼                  BUG辟易
//          佛曰:
//                  写字楼里写字间，写字间里程序员；
//                  程序人员写程序，又拿程序换酒钱。
//                  酒醒只在网上坐，酒醉还来网下眠；
//                  酒醉酒醒日复日，网上网下年复年。
//                  但愿老死电脑间，不愿鞠躬老板前；
//                  奔驰宝马贵者趣，公交自行程序员。
//                  别人笑我忒疯癫，我笑自己命太贱；
//                  不见满街漂亮妹，哪个归得程序员？

/**********************
 ┏┓　　　┏┓
 ┏┛┻━━━━━┛┻┓
 ┃         ┃
 ┃    ━    ┃
 ┃　┳┛　┗┳　┃
 ┃         ┃
 ┃    ┻    ┃
 ┃         ┃
 ┗━┓　　　┏━┛
 ┃　　　┃ 神兽保佑
 ┃　　　┃ 代码无BUG！
 ┃　　　┗━━━┓
 ┃         ┣┓
 ┃         ┏┛
 ┗┓┓┏━━━┳┓┏┛
 ┃┫┫   ┃┫┫
 ┗┻┛   ┗┻┛
 **********************/



@end
