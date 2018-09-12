//
//  YFBaseTabBarController.m
//  FDBigHealth
//
//  Created by 风鼎-叶烽 on 2018/2/2.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTabBarController.h"

@interface YFBaseTabBarController ()<UITabBarControllerDelegate>

@end

@implementation YFBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addAllViewControllers];
}
#pragma mark - 添加所有自控制器
- (void)addAllViewControllers
{
    //将需要绑定的页面个添加进来
    YFHomePageViewController *HomePageVC = [[YFHomePageViewController alloc] init];
    
    
    YFBorrowViewController *BorrowVC = [[YFBorrowViewController alloc] init];
    YFFinancialViewController *FinancialVC = [[YFFinancialViewController alloc] init];
    YFMineViewController *MineVC = [[YFMineViewController alloc] init];
    
    NSMutableArray *VCArray = [NSMutableArray array];
    [VCArray addObject:HomePageVC];
    [VCArray addObject:FinancialVC];
    [VCArray addObject:BorrowVC];
    [VCArray addObject:MineVC];
    
    NSMutableArray *tittleArray = [NSMutableArray arrayWithObjects:@"首页",@"产品",@"我要借款",@"我的",nil];
    NSMutableArray *imageArray = [NSMutableArray arrayWithObjects:@"homeNoSelectImage",@"FinancialNoSelectImage",@"borrowNoSelectImage",@"mineNoSelectImage",nil];
    NSMutableArray *selectImageArray = [NSMutableArray arrayWithObjects:@"homeSelectImage",@"FinancialSelectImage",@"borrowSelectImage",@"mineSelectImage",nil];
    
    for (NSInteger i = 0; i < 4; i ++) {
        [self addViewController:[VCArray objectAtIndex:i] tittleString:[tittleArray objectAtIndex:i] imageString:[imageArray objectAtIndex:i] selectImageString:[selectImageArray objectAtIndex:i]];
        
    }
    
    
    
    self.delegate = self;
}

-(void)addViewController:(UIViewController *)VC tittleString:(NSString *)tittle imageString:(NSString *)image selectImageString:(NSString *)selectImage
{

    //实例化一个VC为根视图的NavigationViewController
    YFBaseNavigationController *YFNav = [[YFBaseNavigationController alloc] initWithRootViewController:VC];
    //设置tabBarItem的标题
    YFNav.tabBarItem.title =tittle;
    //设置tabBarItem的图片
    YFNav.tabBarItem.image = [UIImage imageNamed:image];
    //设置tabbaritem选中时的显示的图片
    YFNav.tabBarItem.selectedImage = [YFTool TabbarImage:selectImage];
    //添加NavigationViewController到tabbar
    [self addChildViewController:YFNav];
    
}


+(void)initialize
{
    //设置UITabBarItem主题
    [self setupTabBarItemTheme];
    
    
}

#pragma mark - 设置tabbarItem的主题
+(void)setupTabBarItemTheme
{
    
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    
    /****设置文字属性****/
    //普通状态颜色为黑色，字体大小12
    [tabBarItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:YF_W(10)],NSForegroundColorAttributeName : [YFTool YFColorWithString:@"999999"]} forState:UIControlStateNormal];
    
    //选中状态颜色为橙色，字体大小12
    [tabBarItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:YF_W(10)],NSForegroundColorAttributeName :[YFTool YFColorWithString:@"FF8421"]} forState:UIControlStateSelected];
    
    //高亮状态
    [tabBarItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:YF_W(10)]} forState:UIControlStateHighlighted];
    
    //不可用状态
    [tabBarItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:YF_W(10)]} forState:UIControlStateDisabled];
    
}


-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    
    NSLog(@"点击的tabbarItem === %@",item.title);
    [YFTool setObject:item.title key:@"title"];
    
    
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
