//
//  YFReimbursementMeansViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFReimbursementMeansViewController.h"
#define YFMineTittle @[@"每月等额",@"先息后本",@"一次性还本付息"]
#define YFMineTittleContent @[@"每月还款的金额相同",@"先还利息后还本金",@"贷款到期后一次性归还本金和利息"]
@interface YFReimbursementMeansViewController ()<SectionChooseVCDelegate,UIScrollViewDelegate>

/*
 头部imageview
 */
@property(nonatomic,strong)UIImageView *headerImageView;

/*
 底部view
 */
@property(nonatomic,strong)UIView *downView;

/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 subit
 */
@property(nonatomic,strong)UILabel *subitLabel;

/*
 contet
 */
@property(nonatomic,strong)UILabel *contetLabel;

/*
voice
 */
@property(nonatomic,strong)UILabel *voicecontetLabel;


/*
 选择器
 */
@property(nonatomic,strong)SectionChooseView *sectionChooseView;

/*
 滚动视图
 */
@property(nonatomic,strong)UIScrollView *YF_scrollerView;

/*
 确定
 */
@property(nonatomic,strong)UIButton *YFButton;
@end

@implementation YFReimbursementMeansViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configuration];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PaymentType:) name:@"PaymentType" object:nil];
    
    
}

/*收到不同还款类型状态判断*/
-(void)PaymentType:(NSNotification *)noti
{
    
    self.tittleLabel.text=[NSString stringWithFormat:@"共还%@元",[noti.object objectForKey:@"totalRepay"]];
     self.subitLabel.text =[NSString stringWithFormat:@"年利率%.2f%%  利息%.2f",[[noti.object objectForKey:@"rate"] floatValue],[[noti.object objectForKey:@"totalInterest"] floatValue]];
    
    
}

-(void)configuration
{
    
    // 首次进入加载第一个界面通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showFirstVC) name:@"ABC" object:nil];
    //添加所有子控制器
    [self setupChildViewController];
    //初始化UIScrollView
    [self setupUIScrollView];
    
    
    UIView *downView=[[UIView alloc]init];
    downView.backgroundColor=WHITECOLOR;
    [self.view addSubview:downView];
    
    downView.sd_layout
    .topSpaceToView(self.view, YF_H(232))
    .centerXEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(61));
    
    [self.view sd_addSubviews:@[self.headerImageView,self.downView,self.YFButton]];
    
    self.headerImageView.sd_layout
    .topSpaceToView(self.view, YF_H(96))
    .centerXEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(136));
    
    
    self.downView.sd_layout
    .topSpaceToView(self.view, YF_H(218))
    .centerXEqualToView(self.view)
    .widthIs(YF_W(347))
    .heightIs(YF_H(75));
    
     [self.headerImageView sd_addSubviews:@[self.tittleLabel,self.subitLabel]];
    
    self.tittleLabel.sd_layout
    .topSpaceToView(self.headerImageView, YF_H(44))
    .centerXEqualToView(self.headerImageView)
    .widthIs(WIDTH)
    .heightIs(YF_H(28));
    
    self.subitLabel.sd_layout
    .topSpaceToView(self.headerImageView, YF_H(78))
    .centerXEqualToView(self.headerImageView)
    .widthIs(WIDTH)
    .heightIs(YF_H(20));
    
    
     [self.downView sd_addSubviews:@[self.contetLabel,self.voicecontetLabel]];
    
    self.contetLabel.sd_layout
    .topSpaceToView(self.downView, YF_H(15))
    .centerXEqualToView(self.downView)
    .widthIs(WIDTH-YF_W(28))
    .heightIs(YF_H(20));
    
    self.voicecontetLabel.sd_layout
    .topSpaceToView(self.downView, YF_H(40))
    .centerXEqualToView(self.downView)
    .widthIs(WIDTH-YF_W(28))
    .heightIs(YF_H(20));
    
    
    
    self.YFButton.sd_layout
    .leftSpaceToView(self.view, YF_W(0))
    .bottomEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(49));
    
    
    
 
    
}


- (void)showFirstVC {
    
    [self showVc:0];
}

- (void)setupUIScrollView {
    
    // 创建底部滚动视图
    self.YF_scrollerView = [[UIScrollView alloc] init];
    _YF_scrollerView.frame = CGRectMake(0,YF_H(293), WIDTH, HEIGHT - 64 - YF_H(293)-YF_H(49));
    _YF_scrollerView.contentSize = CGSizeMake(self.view.frame.size.width * 3, 0);
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
    
    self.sectionChooseView = [[SectionChooseView alloc] initWithFrame:CGRectMake(0, YF_H(10), WIDTH, YF_H(50)) titleArray:@[@"等额本息", @"先息后本", @"一次性还本付息"]];
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
     等额本息
     */
    YFEqualViewController *aVC = [[YFEqualViewController alloc] init];
    aVC.sizeString=self.sizeString;
    aVC.principalString=self.principalString;
    aVC.title = self.title;
    [self addChildViewController:aVC];
    
    /*
     先息后本
     */
    YFFirstViewController *bVC = [[YFFirstViewController alloc] init];
    bVC.title = self.title;
    bVC.sizeString=self.sizeString;
    bVC.principalString=self.principalString;
    [self addChildViewController:bVC];
    
    /*
     一次性还本付息
     */
    YFAOneTimeViewController *cVC = [[YFAOneTimeViewController alloc] init];
    cVC.title = self.title;
    cVC.sizeString=self.sizeString;
    cVC.principalString=self.principalString;
    [self addChildViewController:cVC];

    
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
    
    self.contetLabel.text=[YFMineTittle objectAtIndex:index];
    self.voicecontetLabel.text=[YFMineTittleContent objectAtIndex:index];
    CGFloat offsetX = index * self.view.frame.size.width;
    
    UIViewController *vc = self.childViewControllers[index];
    
    // 判断控制器的view有没有加载过,如果已经加载过,就不需要加载
    if (vc.isViewLoaded) return;
    
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



-(UIImageView *)headerImageView
{
    if (!_headerImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image =[UIImage imageNamed:@"backgroundImage"];
        _headerImageView = imageView;
    }
    return _headerImageView;
}


-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.textColor =WHITECOLOR;
        label.textAlignment =NSTextAlignmentCenter;
        label.text =@"";
        _tittleLabel = label;
    }
    return _tittleLabel;
}


-(UILabel *)subitLabel
{
    if (!_subitLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =LIGHTGREYCOLOR;
        label.textAlignment =NSTextAlignmentCenter;
        label.text =@"";
        _subitLabel = label;
    }
    return _subitLabel;
}


-(UIView *)downView
{
    if (!_downView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = WHITECOLOR;
        view.layer.cornerRadius = YF_W(8);
        view.userInteractionEnabled =YES;
        view.layer.shadowColor = [UIColor lightGrayColor].CGColor;//阴影颜色
        view.layer.shadowOffset = CGSizeMake(1, 2);//偏移距离
        view.layer.shadowOpacity = 0.8f;//不透明度
        view.layer.shadowRadius = 2.0;//半径r
        _downView = view;
    }
    return _downView;
}


-(UILabel *)contetLabel
{
    if (!_contetLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF666;
        label.textAlignment =NSTextAlignmentCenter;
        label.text =@"每月等额";
        _contetLabel = label;
    }
    return _contetLabel;
}


-(UILabel *)voicecontetLabel
{
    if (!_voicecontetLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF999;
        label.textAlignment =NSTextAlignmentCenter;
        label.text =@"每月还款的金额相同";
        _voicecontetLabel = label;
    }
    return _voicecontetLabel;
}


-(UIButton *)YFButton
{
    if (!_YFButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitle:@"确定" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(17);
        [button addTarget:self action:@selector(YFClick) forControlEvents:UIControlEventTouchUpInside];
        _YFButton = button;
        
        
        
        
    }
    return _YFButton;
}

-(void)YFClick
{
    NSInteger type=1;

    if (self.YF_scrollerView.contentOffset.x==WIDTH) {
        type=2;
    }
    if (self.YF_scrollerView.contentOffset.x==WIDTH*2) {
        type=3;
    }
    
    [self.TypeDelegate Type:type];
    
    [self.navigationController popViewControllerAnimated:YES];
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
