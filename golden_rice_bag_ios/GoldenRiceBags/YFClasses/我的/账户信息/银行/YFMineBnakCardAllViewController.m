//
//  YFMineBnakCardAllViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/3.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFMineBnakCardAllViewController.h"

@interface YFMineBnakCardAllViewController ()<SectionChooseVCDelegate,UIScrollViewDelegate>
/*
 选择器
 */
@property(nonatomic,strong)SectionChooseView *sectionChooseView;
/*
 滚动视图
 */
@property(nonatomic,strong)UIScrollView *YF_scrollerView;
@end

@implementation YFMineBnakCardAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configuration];
    // Do any additional setup after loading the view.
}


-(void)configuration
{
    
    // 首次进入加载第一个界面通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showFirstVC) name:@"ABC" object:nil];
    //添加所有子控制器
    [self setupChildViewController];
    //初始化UIScrollView
    [self setupUIScrollView];

    
}


- (void)showFirstVC {
    
    [self showVc:0];
}

- (void)setupUIScrollView {
    
    // 创建底部滚动视图
    self.YF_scrollerView = [[UIScrollView alloc] init];
    _YF_scrollerView.frame = CGRectMake(0,YF_H(60), WIDTH, HEIGHT - 64 - YF_H(60));
    _YF_scrollerView.contentSize = CGSizeMake(self.view.frame.size.width * 2, 0);
    _YF_scrollerView.backgroundColor = WHITECOLOR;
    _YF_scrollerView.scrollEnabled = NO;
    // 开启分页
    _YF_scrollerView.pagingEnabled = YES;
    // 没有弹簧效果
    _YF_scrollerView.bounces = YES;
    // 隐藏水平滚动条
    _YF_scrollerView.showsHorizontalScrollIndicator = NO;
    // 设置代理
    _YF_scrollerView.delegate = self;
    [self.view addSubview:_YF_scrollerView];
    
    self.sectionChooseView = [[SectionChooseView alloc] initWithFrame:CGRectMake(0, YF_H(10), WIDTH, YF_H(50)) titleArray:@[@"投资账户", @"借款账户"]];
    self.sectionChooseView.selectIndex = 0;
    self.sectionChooseView.delegate = self;
    self.sectionChooseView.normalBackgroundColor = WHITECOLOR;
    self.sectionChooseView.selectBackgroundColor = WHITECOLOR;
    self.sectionChooseView.titleNormalColor = YF666;
    self.sectionChooseView.titleSelectColor = ZHUTICOLOR;
    self.sectionChooseView.normalTitleFont = YF_W(13);
    self.sectionChooseView.selectTitleFont = YF_W(13);
    [self.view addSubview:self.sectionChooseView];
    
    
    
}

#pragma mark -添加所有子控制器

-(void)setupChildViewController {
    
    
    /*
     投资账户
     */
    YFMineBnakCardNoViewController *aVC = [[YFMineBnakCardNoViewController alloc] init];
    aVC.title = self.title;
    [self addChildViewController:aVC];
    
    /*
     借款账户
     */
    YFMineBnakCardViewController *bVC = [[YFMineBnakCardViewController alloc] init];
    bVC.title = self.title;
    [self addChildViewController:bVC];
    

    
    
}

#pragma mark -SMCustomSegmentDelegate

- (void)SectionSelectIndex:(NSInteger)selectIndex {
    
    NSLog(@"---------%ld",(long)selectIndex);
    
    // 1 计算滚动的位置
    CGFloat offsetX = selectIndex * self.view.frame.size.width;
    self.YF_scrollerView.contentOffset = CGPointMake(offsetX, 0);
    
    // 2.给对应位置添加对应子控制器
    [self showVc:selectIndex];
}

#pragma mark -显示控制器的view
/**
 *  显示控制器的view
 *
 *  @param index 选择第几个
 *
 */
- (void)showVc:(NSInteger)index {
    

    CGFloat offsetX = index * self.view.frame.size.width;
    
    UIViewController *vc = self.childViewControllers[index];
    
    // 判断控制器的view有没有加载过,如果已经加载过,就不需要加载
//    if (vc.isViewLoaded) return;
    
    [self.YF_scrollerView addSubview:vc.view];
    vc.view.frame = CGRectMake(offsetX, 0, self.view.frame.size.width, _YF_scrollerView.frame.size.height);
    
    
    
}

#pragma mark -UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    
    // 计算滚动到哪一页
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    // 1.添加子控制器view
    [self showVc:index];
    
    // 2.把对应的标题选中
    self.sectionChooseView.selectIndex = index;
    
    
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
