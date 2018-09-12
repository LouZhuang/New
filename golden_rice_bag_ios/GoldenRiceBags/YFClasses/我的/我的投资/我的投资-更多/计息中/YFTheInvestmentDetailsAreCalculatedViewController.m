//
//  YFTheInvestmentDetailsAreCalculatedViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFTheInvestmentDetailsAreCalculatedViewController.h"


@interface YFTheInvestmentDetailsAreCalculatedViewController ()<UIScrollViewDelegate,SectionChooseVCDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSDictionary *dataDic;
@end

@implementation YFTheInvestmentDetailsAreCalculatedViewController
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"投资详情";
    self.view.backgroundColor = [UIColor whiteColor];
    self.canScroll = YES;
    [self configuration];
    /*
     数据请求
     */
    [self DataRequest];
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
    return HEIGHT-64-YF_H(52);
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
        self.contentCell = [YFTheInvestmentDetailsAreCalculatedTableViewCell dequeueCellForTableView:tableView];
        self.contentCell.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentCell.dataDic = self.dataDic;
        [self.contentCell setPageView];
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
    
    [self.view sd_addSubviews:@[self.headerView]];
    
    self.headerView.sd_layout
    .topEqualToView(self.view)
    .leftEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(590 ));
    
    
    
    self.tableView =[[YFMineTableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64) style:UITableViewStylePlain];
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
    [YFTheInvestmentDetailsAreCalculatedTableViewCell regisCellForTableView:self.tableView];
    
    
    
    self.segment = [[SectionChooseView alloc] initWithFrame:CGRectMake(0,0, WIDTH, YF_H(52)) titleArray:@[@"资金运用情况",@"回款计划"]];
    self.segment.selectIndex = 0;
    self.segment.backgroundColor = WHITECOLOR;
    self.segment.delegate = self;
    self.segment.normalBackgroundColor = WHITECOLOR;
    self.segment.selectBackgroundColor = WHITECOLOR;
    self.segment.titleNormalColor = YF999;
    self.segment.titleSelectColor = ZHUTICOLOR;
    self.segment.normalTitleFont = YF_W(14);
    self.segment.selectTitleFont = YF_W(14);

    
    
}

-(YFTheInvestmentDetailsAreCalculatedHeaderView *)headerView
{
    if (!_headerView) {
        YFTheInvestmentDetailsAreCalculatedHeaderView *view = [[YFTheInvestmentDetailsAreCalculatedHeaderView alloc] init];
        view.backgroundColor=ZHUTICOLOR;
        view.userInteractionEnabled =YES;
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(webViewPush) name:@"YFHistorySettlementOfViewPushWeb" object:nil];

        _headerView = view;
    }
    return _headerView;
}

- (void)webViewPush
{
  
    if (![self.dataDic[@"baseDetail"][@"reserve3"] isEqualToString:@"NOSIGN"]) {
        RHWebViewController *vc = [[RHWebViewController alloc]init];
        vc.webUrl = self.dataDic[@"baseDetail"][@"reserve3"];
        vc.title = @"金米袋网借款协议";
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        [YFProgressHUD showInfoWithStatus:@"未签署借款合同"];
    }
}
/*
 数据请求
 */
-(void)DataRequest
{
    
    [YFMineRequest YFInvestmentDetailTypeString:self.model.id success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            
            NSLog(@"323232 == %@",json);
            
            NSDictionary *dataDic=[json objectForKey:@"data"];
            self.dataDic = [dataDic mutableCopy];
            NSDictionary *baseDetailDic=[dataDic objectForKey:@"baseDetail"];
            [self.model setValuesForKeysWithDictionary:baseDetailDic];
           [self.headerView setModel:self.model];
           
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
- (NSDictionary *)dataDic
{
    if (_dataDic == nil) {
        _dataDic = [NSDictionary dictionary];
    }
    return _dataDic;
}
@end
