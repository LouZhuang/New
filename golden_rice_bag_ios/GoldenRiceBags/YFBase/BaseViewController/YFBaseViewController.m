//
//  YFBaseViewController.m
//  FDBigHealth
//
//  Created by 风鼎-叶烽 on 2018/2/1.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"

@interface YFBaseViewController ()

@end

@implementation YFBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor =LIGHTGREYCOLOR;
    self.StatusBarStyle = UIStatusBarStyleDefault;
    
    [self setNavBarBackColor];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self setIsHidenNaviBar:_isHidenNaviBar];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

-(void)setNavBarBackColor
{
    //初始化导航栏颜色
    
//    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
//    
//    NSArray *colors = @[[YFTool YFColorWithString:@"FFFFFF"],[YFTool YFColorWithString:@"FFFFFF"]];
//    
//    [navigationBarAppearance setBarTintColor:[UIColor redColor]];
}


#pragma mark - setter
- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return _StatusBarStyle;
}

//动态更新状态栏颜色
-(void)setStatusBarStyle:(UIStatusBarStyle)StatusBarStyle{
    
    _StatusBarStyle = StatusBarStyle;
    
    [self setNeedsStatusBarAppearanceUpdate];
}

/**
 *  是否显示返回按钮
 */
- (void)setIsShowLiftBack:(BOOL)isShowLiftBack
{
    _isShowLiftBack = isShowLiftBack;
    
    NSInteger VCCount = self.navigationController.viewControllers.count;
    
    //下面判断的意义是 当VC所在的导航控制器中的VC个数大于1 或者 是present出来的VC时，才展示返回按钮，其他情况不展示
    
    if (isShowLiftBack && (VCCount > 1 || self.navigationController.presentingViewController != nil)) {
        
        //TODO:这里设置导航栏返回按钮
        
        [self addNavigationItemWithImageNames:@[@"Nav_Back"] isLeft:YES target:self action:@selector(backBtnClicked) tags:nil];
        
    }else {
        
        self.navigationItem.hidesBackButton = YES;
        
        UIBarButtonItem * NULLBar=[[UIBarButtonItem alloc]initWithCustomView:[UIView new]];
        
        self.navigationItem.leftBarButtonItem = NULLBar;
    }
}


/**
 *  是否隐藏导航栏
 */
- (void)setIsHidenNaviBar:(BOOL) isHidenNaviBar {
    
    _isHidenNaviBar = isHidenNaviBar;
    
    if (isHidenNaviBar) {
        //隐藏
        if (self.navigationController.navigationBar.hidden == NO)
        {
            [self.navigationController setNavigationBarHidden:YES animated:YES];
            
        }
        
    }else{
        //显示
        [self.navigationController setNavigationBarHidden:NO  animated:YES];
    }
    
}

/**
 导航栏字体颜色
 */
-(void)setNaviStrColor:(UIColor *)strColor
{
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:strColor,NSForegroundColorAttributeName,nil]];
}

/**
 *  设置导航栏背景色
 */
- (void)setNaviBackGroundColor:(UIColor *)naviBackGroundColor
{
//    UIView *naviView  = [[UIView alloc]initWithFrame:CGRectMake(0, -20, WIDTH, 64)];
//    naviView.backgroundColor = naviBackGroundColor;
//
//    [self.navigationController.navigationBar setValue:naviView forKey:@"backgroundView"];
}


/**
 *  设置左右侧返回文字按钮
 *
 *  @param titles titles
 *  @param isLeft isLeft
 *  @param target self
 *  @param action action
 *  @param tags   tags
 */
- (void)addNavigationItemWithTitles:(NSArray *)titles isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags color:(UIColor *)titleColor
{
    
    NSMutableArray * items = [[NSMutableArray alloc] init];
    
    //调整按钮位置
    UIBarButtonItem* spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //将宽度设为负值(看情况设置位置)
    spaceItem.width = 0;
    
    [items addObject:spaceItem];
    
    NSInteger i = 0;
    for (NSString * title in titles) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(0, 0, 40, 20);
        [btn setTitle:title forState:UIControlStateNormal];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = YF_FONT(14);
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
        btn.tag = [tags[i++] integerValue];
        [btn sizeToFit];
        UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [items addObject:item];
    }
    if (isLeft) {
        self.navigationItem.leftBarButtonItems = items;
    } else {
        self.navigationItem.rightBarButtonItems = items;
    }
}

/**
 *  设置左右侧返回图片按钮
 *
 *  @param imageNames  imageNames
 *  @param isLeft   isLeft
 *  @param target   target
 *  @param action   action
 *  @param tags     tags
 */
- (void)addNavigationItemWithImageNames:(NSArray *)imageNames isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags
{
    
    NSMutableArray * items = [[NSMutableArray alloc] init];
    
    NSInteger i = 0;
    
    for (NSString * imageName in imageNames) {
        //        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        //        backView.backgroundColor=RedColor;
        //        backView.userInteractionEnabled=YES;
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        //        [backView addSubview:btn];
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, 30, 30);
        
        if(isLeft){
            btn.frame = CGRectMake(0, 0, YF_W(7), YF_H(12));
            //设置按钮相对位置
            [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
            
            
        }else{
            
            [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
            
        }
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        
        btn.tag = [tags[i++] integerValue];
        
        UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        
        [items addObject:item];
        
    }
    if (isLeft) {
        self.navigationItem.leftBarButtonItems = items;
    } else {
        self.navigationItem.rightBarButtonItems = items;
    }
}




/**
 *  返回按钮事件
 */
- (void)backBtnClicked
{
    if (self.navigationController.viewControllers.count > 1) {
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }else{
        
        if (self.presentingViewController) {
            
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }else{
            
            [self.navigationController popViewControllerAnimated:YES];
        }
        
    }
    
    
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
