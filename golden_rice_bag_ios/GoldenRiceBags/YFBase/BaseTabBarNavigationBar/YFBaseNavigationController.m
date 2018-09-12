//
//  YFBaseNavigationController.m
//  FDBigHealth
//
//  Created by 风鼎-叶烽 on 2018/2/1.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseNavigationController.h"

@interface YFBaseNavigationController ()

@end

@implementation YFBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.interactivePopGestureRecognizer.delegate = self;
    //    /**  去掉导航栏黑线  */
    self.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}


+(void)initialize
{
    //设置导航items数据主题
    [self setupNavigationItemsTheme];
    
    //设置导航栏主题
    [self setupNavigationBarTheme];
}

#pragma mark - 设置导航栏数据主题
+(void)setupNavigationItemsTheme
{
    UIBarButtonItem *barButtonItem = [UIBarButtonItem appearance];
    
    //设置字体颜色
    [barButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [YFTool YFColorWithString:@"333333"],NSFontAttributeName : [UIFont systemFontOfSize:17]} forState:UIControlStateNormal];
    
    [barButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName :[YFTool YFColorWithString:@"333333"]} forState:UIControlStateHighlighted];
    
    [barButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [YFTool YFColorWithString:@"333333"]} forState:UIControlStateDisabled];
}

#pragma mark - 设置导航栏主题
+(void)setupNavigationBarTheme
{
    UINavigationBar *bar = [UINavigationBar appearance];
    
    //设置导航栏的title属性
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName : [YFTool YFColorWithString:@"333333"]}];
    //设置导航栏颜色
//    [bar setBarTintColor:[YFTool YFColorWithString:@"FFFFFF"]];
        //设置导航栏背景图
        UIImage *image =[UIImage imageNamed:@"navigationImage"];
    
        [bar setBackgroundImage:[YFTool reSizeImage:image toSize:CGSizeMake(WIDTH, 64)] forBarMetrics:UIBarMetricsDefault];
    
    
    
    
    
}



#pragma  mark - 拦截所有push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        // 如果navigationController的字控制器个数大于两个就隐藏，底部工具栏
        viewController.hidesBottomBarWhenPushed = YES;
        
        //设置返回按钮
        UIImage *backImage = [[UIImage alloc] init];
        backImage =[YFTool TabbarImage:@"tabbarImage"];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backImage style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    }
    [super pushViewController:viewController animated:animated];
}


/**
 *  点击返回按钮时调用
 *  返回上一个界面
 */
-(void)back
{
    [super popViewControllerAnimated:YES];
    
}

/**
 *  手势识别器对象会调用这个代理方法来决定手势是否有效
 *
 *  @return YES : 手势有效, NO : 手势无效
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 手势何时有效 : 当导航控制器的子控制器个数 > 1就有效
//    return self.childViewControllers.count > 1;
       return NO;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
