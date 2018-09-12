//
//  YFFinancialDetailsViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/21.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFFinancialDetailsViewController.h"

@interface YFFinancialDetailsViewController ()<UIScrollViewDelegate,SectionChooseVCDelegate,UITableViewDelegate,UITableViewDataSource,YFCustomPopoverDelegate,UIActionSheetDelegate,YFCustomOpenTheDepositoryDelegate,YFOpenAnAccountDelegate>

/*
 footer
 */
@property(nonatomic,strong)UIView *footerView;

/*
 footerImageview
 */
@property(nonatomic,strong)UIImageView *footerImageView;

/*
 footertittle
 */
@property(nonatomic,strong)UILabel *footerTittleLabel;


/*
 立即开户
 */
@property(nonatomic,strong)UIButton *YFButton;

/*
 开通弹窗
 */

@property (nonatomic,strong)YFCustomOpenTheDepositoryView *CustomOpenTheDepositoryView;
/*
 成功弹窗
 */
@property (nonatomic,strong)YFCustomSuccessView *CustomSuccessView;

@end

@implementation YFFinancialDetailsViewController
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=self.listModel.projectName;
     self.canScroll = YES;
    
    
     [self configuration];
    
    self.tableView =[[YFMineTableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-YF_H(99)-YF_H(49)-64) style:UITableViewStylePlain];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.tableView setTableHeaderView:self.headerView];
    self.tableView.userInteractionEnabled=YES;
    [self.view addSubview: self.tableView];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    //通知的处理
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onPageViewCtrlChange:) name:@"CenterPageViewScroll" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onOtherScrollToTop:) name:@"kLeaveTopNtf" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onScrollBottomView:) name:@"PageViewGestureState" object:nil];
    self.tableView.showsVerticalScrollIndicator = NO;
    [YFFinancialDetailsListTableViewCell regisCellForTableView:self.tableView];
    
    
    
    self.segment = [[SectionChooseView alloc] initWithFrame:CGRectMake(0,0, WIDTH, YF_H(52)) titleArray:@[@"投资记录"]];
    self.segment.selectIndex = 0;
    self.segment.backgroundColor = WHITECOLOR;
    self.segment.delegate = self;
    self.segment.normalBackgroundColor = WHITECOLOR;
    self.segment.selectBackgroundColor = WHITECOLOR;
    self.segment.titleNormalColor = YF999;
    self.segment.titleSelectColor = ZHUTICOLOR;
    self.segment.normalTitleFont = YF_W(14);
    self.segment.selectTitleFont = YF_W(14);

    
    /*
     数据请求
     */
    [self DataRequest];
    // Do any additional setup after loading the view.
}


//通知的处理pageViewController页面变动时的通知
- (void)onPageViewCtrlChange:(NSNotification *)ntf
{
    //1.更改YUSegment选中目标
    // 2.把对应的标题选中
    self.segment.selectIndex = [ntf.object integerValue];
    
}


//子控制器到顶部了 主控制器可以滑动
- (void)onOtherScrollToTop:(NSNotification *)ntf
{
    self.canScroll = YES;
    self.contentCell.canScroll = NO;
}

//当滑动下面的PageView时，当前要禁止滑动
- (void)onScrollBottomView:(NSNotification *)ntf
{
    if ([ntf.object isEqualToString:@"ended"]) {
        //bottomView停止滑动了  当前页可以滑动
        self.tableView.scrollEnabled = YES;
    } else {
        //bottomView滑动了 当前页就禁止滑动
        self.tableView.scrollEnabled = NO;
    }
}

-(void)SectionSelectIndex:(NSInteger)selectIndex
{
    
    self.contentCell.selectIndex=selectIndex;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //要减去导航栏 状态栏 以及 sectionheader的高度
    return HEIGHT-YF_H(99)-YF_H(49)-64-YF_H(52);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    //sectionheader的高度，这是要放分段控件的
    return YF_H(52);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.segment;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!self.contentCell) {
        self.contentCell = [YFFinancialDetailsListTableViewCell dequeueCellForTableView:tableView];
        self.contentCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentCell setPageView:self.listModel.id];
    }
    
    
    return self.contentCell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    //子控制器和主控制器之间的滑动状态切换
    CGFloat tabOffsetY = [_tableView rectForSection:0].origin.y;
    if (scrollView.contentOffset.y >= tabOffsetY) {
        scrollView.contentOffset = CGPointMake(0, tabOffsetY);
        if (_canScroll) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"kScrollToTopNtf" object:@1];
            _canScroll = NO;
            self.contentCell.canScroll = YES;
        }
    } else {
        if (!_canScroll) {
            scrollView.contentOffset = CGPointMake(0, tabOffsetY);
        }
    }
}


-(void)configuration
{
    
    
    
    
    [self.view sd_addSubviews:@[self.footerView,self.YFButton,self.headerView]];
   
    
    self.footerView.sd_layout
    .bottomSpaceToView(self.view, YF_H(49))
    .leftEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(99));
    
    
    self.YFButton.sd_layout
    .bottomEqualToView(self.view)
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(YF_H(49));
    
    
     [self.footerView sd_addSubviews:@[self.footerImageView,self.footerTittleLabel]];
    
    self.footerImageView.sd_layout
    .topSpaceToView(self.footerView, YF_H(10))
    .centerXEqualToView(self.footerView)
    .widthIs( YF_W(17))
    .heightIs(YF_H(20));
    
    self.footerTittleLabel.sd_layout
    .topSpaceToView(self.footerView, YF_H(34))
    .rightSpaceToView(self.footerView, YF_W(14))
    .widthIs(WIDTH - YF_W(28))
    .heightIs(YF_H(55));
    
    
    
}

-(YFFinancialDetailsHeaderView *)headerView
{
    if (!_headerView) {
        YFFinancialDetailsHeaderView *view = [[YFFinancialDetailsHeaderView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, YF_H(626))];
        view.backgroundColor=WHITECOLOR;
        [view.checkButton addTarget:self action:@selector(heckClick) forControlEvents:UIControlEventTouchUpInside];
        view.userInteractionEnabled =YES;
        _headerView = view;
    }
    return _headerView;
}

-(void)heckClick
{
    
    /*
     普通 满标
     */
//    YFNormalFinancialDetailsViewController *YFFinancialDetailsVC=[[YFNormalFinancialDetailsViewController alloc]init];
//    YFFinancialDetailsVC.type=NO;
//    YFFinancialDetailsVC.listModel=self.listModel;
//    YFFinancialDetailsVC.typeId = YFNormalFinancialDetailsViewControllerTypeList;
//    [[YFTool getCurrentVC].navigationController pushViewController:YFFinancialDetailsVC animated:YES];
    
    YFNormalFinancialDetailsViewController *YFFinancialDetailsVC=[[YFNormalFinancialDetailsViewController alloc]init];
    YFFinancialDetailsVC.listModel=self.listModel;
    YFFinancialDetailsVC.typeId = YFNormalFinancialDetailsViewControllerTypeYuanDetail;
    YFFinancialDetailsVC.type = [self.listModel.residue integerValue] == 0 ?NO:YES;
    if ([self.listModel.status integerValue]==0) {
        YFFinancialDetailsVC.type=YES;
    }
    [self.navigationController pushViewController:YFFinancialDetailsVC animated:YES];
    
}


-(UIView *)footerView
{
    if (!_footerView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor=LIGHTGREYCOLOR;
        view.userInteractionEnabled =YES;
        _footerView = view;
    }
    return _footerView;
}


-(UIImageView *)footerImageView
{
    if (!_footerImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image =[UIImage imageNamed:@"anquanImage"];
        _footerImageView = imageView;
    }
    return _footerImageView;
}


-(UILabel *)footerTittleLabel
{
    if (!_footerTittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textAlignment=NSTextAlignmentCenter;
        label.numberOfLines = 0;
        label.textColor =[YFTool YFColorWithString:@"999999"];
        label.text =@"出借资金全程由银行存管\n期待回报不代表实际利息回报承诺\n市场有风险，投资需谨慎";
        _footerTittleLabel = label;
    }
    return _footerTittleLabel;
}

-(UIButton *)YFButton
{
    if (!_YFButton) {
        UIButton *button=[[UIButton alloc] init];
       
        button.titleLabel.font = YF_FONT(17);
    
        [button addTarget:self action:@selector(openClick) forControlEvents:UIControlEventTouchUpInside];
        _YFButton = button;
        
    }
    return _YFButton;
}


-(void)openClick
{
 
    if ([[YFTool userDefaultsId:YFisDepository] integerValue]==0 ||[[YFTool userDefaultsId:YFisDepositoryB] integerValue]==0) {
        YFCustomOpenTheDepositoryView *CustomOpenTheDepositoryView =[[YFCustomOpenTheDepositoryView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
        CustomOpenTheDepositoryView.OpenTheDepositoryDelegate=self;
        [KeyWindow addSubview:CustomOpenTheDepositoryView];
        return;
    }
    
    if (![[YFTool userDefaultsId:YFInvestmentType] isEqualToString:@"进取型"] &&![[YFTool userDefaultsId:YFInvestmentType] isEqualToString:@"稳健型"]) {
        _CustomPopoverView =[[YFCustomPopoverView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
        _CustomPopoverView.CustomPopoverDelegate=self;
        [KeyWindow addSubview:_CustomPopoverView];
        return;
    }
    YFIWantToInvestViewController *YFIWantToInvestVC=[[YFIWantToInvestViewController alloc]init];
    YFIWantToInvestVC.listModel=self.listModel;
    [self.navigationController pushViewController:YFIWantToInvestVC animated:YES];
    
    
    
}
- (void)btnClick
{
   
    for (UIView *view in KeyWindow.subviews) {
        if (view.tag == 10000 || view.tag == 20000) {
           [view removeFromSuperview];
        }
       
    }
    YFOpenASavingsAccountViewController *YFOpenASavingsAccountVC=[[YFOpenASavingsAccountViewController alloc] init];
    YFOpenASavingsAccountVC.OpenAnAccountDelegate=self;
    [self.navigationController pushViewController:YFOpenASavingsAccountVC animated:YES];
}
-(void)SuccessfulType:(NSInteger)type
{
    if (type ==0) {
        
        
//        RHWebViewController *vc = [[RHWebViewController alloc]init];
//        vc.view.frame = CGRectMake(20, 150, WIDTH - 40, HEIGHT - 300);
//        vc.title = @"风险承受能力评估-12";
//        vc.view.tag = 10000;
//        vc.isWord = YES;
//        vc.pathUrl = [[NSBundle mainBundle]pathForResource:@"风险承受能力评估-12" ofType:@"doc"];
//        [KeyWindow addSubview:vc.view];
//
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        btn.frame = CGRectMake(KeyWindow.centerX - 60, vc.view.bottom - 50, 120, 30);
//        [btn setTitle:@"知道了" forState:UIControlStateNormal];
//        btn.backgroundColor = [UIColor orangeColor];
//        btn.layer.masksToBounds = YES;
//        btn.layer.cornerRadius = 8;
//        btn.tag = 20000;
//        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//        [btn setTitleColor:[YFTool YFColorWithString:@"ffffff"] forState:UIControlStateNormal];
//        [KeyWindow addSubview:btn];
////        KeyWindow.alpha = 0.3;
//        KeyWindow.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        YFOpenASavingsAccountViewController *YFOpenASavingsAccountVC=[[YFOpenASavingsAccountViewController alloc] init];
        YFOpenASavingsAccountVC.OpenAnAccountDelegate=self;
        [self.navigationController pushViewController:YFOpenASavingsAccountVC animated:YES];
       
    }
    if (type ==1) {
        NSLog(@"暂不考虑");
    }
}
-(void)CustomPopoverSuccessfulType:(NSInteger)type
{
    if (type ==1) {
        YFCreditRiskRatingViewController *YFCreditRiskRatingVC=[[YFCreditRiskRatingViewController alloc]init];
        [self.navigationController pushViewController:YFCreditRiskRatingVC animated:YES];
    }
    if (type ==2) {
        NSLog(@"我先看看");
    }
}

/*
 开户成功代理
 */
-(void)OpenAnAccount
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    _CustomSuccessView =[[YFCustomSuccessView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    [window addSubview:_CustomSuccessView];
}



/*
 数据请求
 */
-(void)DataRequest
{
    [YFHomePageRequest YFHomePageProjectDetail:self.projectId success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            NSLog(@"ProjectDetail == %@",json);
            NSDictionary *dic=[json objectForKey:@"data"];
            NSDictionary *loanInfoEntityDic = [dic objectForKey:@"projectEntity"];
            self.title = dic[@"projectEntity"][@"projectName"]; //@"投资详情";
            self.listModel = [[YFHomePageModel alloc]init];
            [self.listModel setValuesForKeysWithDictionary:loanInfoEntityDic];
            [self.headerView setterHomePageModel:self.listModel];
            
            if ([self.listModel.residue floatValue] == 0) {
                [self.YFButton setTitle:@"已满标" forState:UIControlStateNormal];
                [self.YFButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                self.YFButton.backgroundColor =[YFTool YFColorWithString:@"DDDDDD"];
                self.YFButton.enabled = NO;
            }else{
                self.YFButton.backgroundColor =ZHUTICOLOR;
                [self.YFButton setTitle:@"立即投资" forState:UIControlStateNormal];
                [self.YFButton setTitleColor:WHITECOLOR forState:UIControlStateNormal];
            }
            
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
        
    } failure:^(NSError *error) {
        
    }];
    
    
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
