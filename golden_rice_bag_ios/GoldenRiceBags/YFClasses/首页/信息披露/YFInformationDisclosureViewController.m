//
//  YFInformationDisclosureViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/19.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFInformationDisclosureViewController.h"

@interface YFInformationDisclosureViewController ()<YFCustomSectionVCDelegate,UIScrollViewDelegate>


/*
 滚动视图
 */
@property(nonatomic,strong)UIScrollView *sectionScrollerView;
/*
 选择器
 */
@property(nonatomic,strong)YFCustomSectionChooseView *sectionChooseView;

/*
 滚动视图
 */
@property(nonatomic,strong)UIScrollView *YF_scrollerView;
@end

@implementation YFInformationDisclosureViewController
{
    CGFloat itemWidth;
    NSArray *array;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"信息披露";
    
    array=@[@"基本信息",@"备案信息",@"审核信息",@"经营信息",@"重大事项",@"法律法规",@"消费者咨询及投诉渠道",@"去年公示",@"法人代表承诺书"];
    itemWidth = 0;
    for (NSInteger i = 0; i <array.count ; i++) {
        
        itemWidth=itemWidth +[YFTool LableWidth:[array objectAtIndex:i] LabelFont:YF_W(18) Bold:NO]+YF_W(30);
    }
    
    
    [self configuration];
    // Do any additional setup after loading the view.
}

-(void)configuration
{
    
    [self.view sd_addSubviews:@[self.sectionScrollerView]];
    
    self.sectionScrollerView.sd_layout
    .leftSpaceToView(self.view, YF_W(0))
    .topEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(50));
    
    
    // 首次进入加载第一个界面通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showFirstVC) name:@"CustomABC" object:nil];
    //添加所有子控制器
    [self setupChildViewController];
    //初始化UIScrollView
    [self setupUIScrollView];
    
    [self showVc:self.index];
    // 2.把对应的标题选中
    self.sectionChooseView.selectIndex = self.index;
     [self selectIndex:self.index];
    
}

-(UIScrollView *)sectionScrollerView
{
    if (!_sectionScrollerView) {
        UIScrollView *scrollView=[[UIScrollView alloc] init];
//        scrollView.bounces=YES;
        [scrollView setContentSize:CGSizeMake(itemWidth, 0)];
        scrollView.showsHorizontalScrollIndicator=NO;
        scrollView.scrollEnabled=NO;
        _sectionScrollerView= scrollView;
    }
    return _sectionScrollerView;
}

- (void)setupUIScrollView {
    
    // 创建底部滚动视图
    self.YF_scrollerView = [[UIScrollView alloc] init];
    _YF_scrollerView.frame = CGRectMake(0,YF_H(50), WIDTH, HEIGHT - 64 -YF_H(50));
    _YF_scrollerView.contentSize = CGSizeMake(self.view.frame.size.width * 9, 0);
    _YF_scrollerView.backgroundColor = WHITECOLOR;
    // 开启分页
    _YF_scrollerView.pagingEnabled = YES;
    // 没有弹簧效果
    _YF_scrollerView.bounces = YES;
    // 隐藏水平滚动条
    _YF_scrollerView.showsHorizontalScrollIndicator = NO;
    // 设置代理
    _YF_scrollerView.delegate = self;
    [self.view addSubview:_YF_scrollerView];
    
    self.sectionChooseView = [[YFCustomSectionChooseView alloc] initWithFrame:CGRectMake(0, 0, itemWidth, YF_H(50)) titleArray:@[@"基本信息",@"备案信息",@"审核信息",@"经营信息",@"重大事项",@"法律法规",@"消费者咨询及投诉渠道",@"去年公示",@"法人代表承诺书"]];
    self.sectionChooseView.selectIndex = 0;
    self.sectionChooseView.delegate = self;
    self.sectionChooseView.normalBackgroundColor = ZHUTICOLOR;
    self.sectionChooseView.selectBackgroundColor = ZHUTICOLOR;
    self.sectionChooseView.titleNormalColor = [YFTool YFColorWithString:@"fccfb8"];
    self.sectionChooseView.titleSelectColor = WHITECOLOR;
    self.sectionChooseView.normalTitleFont = YF_W(17);
    self.sectionChooseView.selectTitleFont = YF_W(18);
    [self.sectionScrollerView addSubview:self.sectionChooseView];

    
    [self.YF_scrollerView setContentOffset:CGPointMake(self.index *WIDTH, 0) animated:NO];
    
}

#pragma mark -SMCustomSegmentDelegate

- (void)YFCustomSectionSelectIndex:(NSInteger)selectIndex {
    
    NSLog(@"---------%ld",(long)selectIndex);

    // 1 计算滚动的位置
    CGFloat offsetX = selectIndex * self.view.frame.size.width;
    self.YF_scrollerView.contentOffset = CGPointMake(offsetX, 0);

    // 2.给对应位置添加对应子控制器
    [self showVc:selectIndex];
    
    [self selectIndex:selectIndex];
    
    
}

-(void)selectIndex:(NSInteger)index
{
    if (index<=1) {
        [self.sectionScrollerView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    if (index >1 ) {
        CGFloat Width = 0;
        for (NSInteger i = 0; i <=index-1 ; i++) {
            
            Width=Width +[YFTool LableWidth:[array objectAtIndex:i] LabelFont:YF_W(18) Bold:NO]+YF_W(30);
            
            
        }
        if (index!=8) {
            [self.sectionScrollerView setContentOffset:CGPointMake(Width -(WIDTH -([YFTool LableWidth:[array objectAtIndex:index] LabelFont:YF_W(18) Bold:NO]+YF_W(30)))/2, 0) animated:YES];
        }
        if (index==8) {
            [self.sectionScrollerView setContentOffset:CGPointMake(itemWidth-WIDTH, 0) animated:YES];
        }
    }
}

- (void)showFirstVC {
    
    [self showVc:0];
}

#pragma mark -添加所有子控制器

-(void)setupChildViewController {
    
    
    /*
     基本信息
     */
    YFTheBasicInformationViewController *aVC = [[YFTheBasicInformationViewController alloc] init];
    aVC.title = self.title;
    [self addChildViewController:aVC];
    
    /*
     备案信息
     */
    YFForTheRecordInformationViewController *bVC = [[YFForTheRecordInformationViewController alloc] init];
    bVC.title = self.title;
    [self addChildViewController:bVC];
    
    /*
     审核信息
     */
    YFAuditInformationViewController *cVC = [[YFAuditInformationViewController alloc] init];
    cVC.title = self.title;
    [self addChildViewController:cVC];
    
    /*
     经营信息
     */
    YFBusinessInformationViewController *dVC = [[YFBusinessInformationViewController alloc] init];
    dVC.title = self.title;
    [self addChildViewController:dVC];
    
    /*
     重大事项
     */
    YFImportantMattersViewController *eVC = [[YFImportantMattersViewController alloc] init];
    eVC.title = self.title;
    [self addChildViewController:eVC];
    
    /*
     法律法规
     */
    YFLawsAndRegulationsViewController *fVC = [[YFLawsAndRegulationsViewController alloc] init];
    fVC.title = self.title;
    [self addChildViewController:fVC];
    
    /*
    消费者咨询及投诉渠道
     */
    YFConsultingTheComplaintViewController *gVC = [[YFConsultingTheComplaintViewController alloc] init];
    gVC.title = self.title;
    [self addChildViewController:gVC];
    
    /*
     去年公示
     */
    YFLastYearThePublicViewController *hVC = [[YFLastYearThePublicViewController alloc] init];
    hVC.title = self.title;
    [self addChildViewController:hVC];
    
    /*
     法人代表承诺书
     */
    YFLetterOfCommitmentViewController *iVC = [[YFLetterOfCommitmentViewController alloc] init];
    iVC.title = self.title;
    [self addChildViewController:iVC];
    
    
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
    if (vc.isViewLoaded) return;
    
    [self.YF_scrollerView addSubview:vc.view];
    vc.view.frame = CGRectMake(offsetX, 0, self.view.frame.size.width, _YF_scrollerView.frame.size.height);
    
    
    

    
}

#pragma mark -UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (self.YF_scrollerView) {
        // 计算滚动到哪一页
        NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
        
        // 1.添加子控制器view
        [self showVc:index];
        
        // 2.把对应的标题选中
        self.sectionChooseView.selectIndex = index;
        
        if (index<=1) {
            [self.sectionScrollerView setContentOffset:CGPointMake(0, 0) animated:YES];
        }
        if (index >1 &&index<8) {
            CGFloat Width = 0;
            for (NSInteger i = 0; i <=index-1 ; i++) {
                
                Width=Width +[YFTool LableWidth:[array objectAtIndex:i] LabelFont:YF_W(18) Bold:NO]+YF_W(30);
            }
            
            if (index!=8) {
            [self.sectionScrollerView setContentOffset:CGPointMake(Width -(WIDTH -([YFTool LableWidth:[array objectAtIndex:index] LabelFont:YF_W(18) Bold:NO]+YF_W(30)))/2, 0) animated:YES];
            }
            if (index==8) {
                [self.sectionScrollerView setContentOffset:CGPointMake(itemWidth-WIDTH, 0) animated:YES];
            }
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
