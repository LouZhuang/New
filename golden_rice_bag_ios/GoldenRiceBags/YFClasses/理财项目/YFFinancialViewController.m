//
//  YFFinancialViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/9.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFFinancialViewController.h"

@interface YFFinancialViewController ()<UITableViewDelegate,UITableViewDataSource,YFLifeDelegate>

@end

@implementation YFFinancialViewController

{
    NSInteger leftType;
    NSInteger middleType;
    NSInteger rightType;
    
    NSString *sort;
    NSString *sortType;
    NSString *repayTypeStr;
    NSString *projectType;
}

static NSString *cellId = @"YFFinancialTableViewCell";

/*
 视图将要显示
 */
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=WHITECOLOR;
    self.title = @"产品";
    
    [self configuration];
    
    [self YFRefresh];

}

-(NSMutableArray *)YFHotArray
{
    if (!_YFHotArray) {
        _YFHotArray=[NSMutableArray array];
    }
    return _YFHotArray;
}
-(void)configuration
{
    _page=1;
    leftType=middleType=rightType=0;
    
    sort=@"";
    sortType=@"";
    repayTypeStr=@"";
    projectType=@"";
    
    
    
    [self.view sd_addSubviews:@[self.headerView,self.YFTableView,self.tittleImageView,self.footerview]];
    
    self.headerView.sd_layout
    .topSpaceToView(self.view, YF_H(0))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(YF_H(112));
    
    UIBezierPath * bezierPath = [UIBezierPath bezierPathWithRoundedRect:_headerView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(YF_W(15), YF_W(15))];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = _headerView.bounds;
    maskLayer.path = bezierPath.CGPath;
    _headerView.layer.mask = maskLayer;
    
    [self.headerView sd_addSubviews:@[self.leftButton,self.middleButton,self.rightButton]];
    
    self.leftButton.sd_layout
    .bottomEqualToView(self.headerView)
    .leftSpaceToView(self.headerView, YF_W(14))
    .widthIs(WIDTH/3-YF_W(14))
    .heightIs(YF_H(44));
    
    [self.leftButton setIconInRightWithSpacing:5];
    
    self.middleButton.sd_layout
    .bottomEqualToView(self.headerView)
    .centerXEqualToView(self.headerView)
    .widthIs(WIDTH/3)
    .heightIs(YF_H(44));
    
    [self.middleButton setIconInRightWithSpacing:5];
    
    self.rightButton.sd_layout
    .bottomEqualToView(self.headerView)
    .rightSpaceToView(self.headerView, YF_W(14))
    .widthIs(WIDTH/3-YF_W(14))
    .heightIs(YF_H(44));
    
    [self.rightButton setIconInRightWithSpacing:5];
    
    self.tittleImageView.sd_layout
    .topSpaceToView(self.view, YF_H(30))
    .leftSpaceToView(self.view, YF_W(15))
    .widthIs(YF_W(40))
    .heightIs(YF_H(20));
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, YF_H(112))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(HEIGHT -YF_H(66)-49-YF_H(112));
    
    self.footerview.sd_layout
    .topSpaceToView(self.YFTableView, 0)
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(YF_H(66));
    
    [self.footerview sd_addSubviews:@[self.footerLabel]];
    
    self.footerLabel.sd_layout
    .topSpaceToView(self.footerview, YF_H(15))
    .leftSpaceToView(self.footerview, 0)
    .widthIs(WIDTH)
    .heightIs(YF_H(36));
    
    
}
#pragma mark - lazy

-(UIView *)headerView
{
    if (!_headerView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = ZHUTICOLOR;
        view.userInteractionEnabled =YES;
        _headerView = view;
    }
    return _headerView;
}

-(UIButton *)leftButton
{
    if (!_leftButton) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:@"默认排序" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateSelected];
        button.titleLabel.font = YF_FONT(14);
        button.tag=0;
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.titleEdgeInsets = UIEdgeInsetsMake(0, YF_W(14), 0, 0);
        [button setImage:[UIImage imageNamed:@"xialaImage"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"shanglaImage"] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"shanglaImage"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(preventFlicker:) forControlEvents:UIControlEventAllTouchEvents];
        _leftButton = button;
    }
    return _leftButton;
}

-(UIButton *)middleButton
{
    if (!_middleButton) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:@"还款方式" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateSelected];
        button.titleLabel.font = YF_FONT(14);
        button.tag=1;
        [button setImage:[UIImage imageNamed:@"xialaImage"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"shanglaImage"] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"shanglaImage"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(preventFlicker:) forControlEvents:UIControlEventAllTouchEvents];
        _middleButton = button;
    }
    return _middleButton;
}


-(UIButton *)rightButton
{
    if (!_rightButton) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:@"产品类型" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateSelected];
        button.titleLabel.font = YF_FONT(14);
        button.tag=2;
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, YF_W(14));
        [button setImage:[UIImage imageNamed:@"xialaImage"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"shanglaImage"] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"shanglaImage"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(preventFlicker:) forControlEvents:UIControlEventAllTouchEvents];
        _rightButton = button;
    }
    return _rightButton;
}

-(void)leftClick:(UIButton *)sender
{
    sender.selected =!sender.selected;
    NSArray *array=[NSArray array];
    NSInteger type = 0;
    if (sender.tag==0) {
        type=leftType;
        array=@[@" 默认排序",@" 期限升序",@" 期限降序",@"回报率降序"];
    }
    if (sender.tag==1) {
        type=middleType;
        array=@[@"  全 部  ",@"一次性还本付息",@" 等额本息 ",@" 先息后本 "];
    }
    if (sender.tag==2) {
        type=rightType;
        array=@[@" 全部 ",@"原项目",@"债权转让"];
    }
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    YFLifeSupermarketsView *leftLifeView = [[ YFLifeSupermarketsView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) scrocType:1 selectType:type viewY:YF_H(112) tittleArray:array center:1];
    leftLifeView.lifeDelegate = self;
    [window addSubview:leftLifeView];
}
-(void)YFLifeIndex:(NSInteger)index tittleString:(NSString *)tittle
{
    if ([tittle isEqualToString:@"delete"])
    {
        self.leftButton.selected =NO;
        self.middleButton.selected =NO;
        self.rightButton.selected =NO;
    }
    
    if (![tittle isEqualToString:@"delete"]){
        
        if (self.leftButton.selected ==YES) {
            leftType=index;
            self.leftButton.selected =NO;
            [self.leftButton setTitle:tittle forState:UIControlStateNormal];
            
            self.leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            self.leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, YF_W(14), 0, 0);
            [self.leftButton setIconInRightWithSpacing:5];
        }
        if (self.middleButton.selected ==YES) {
            middleType=index;
            self.middleButton.selected =NO;
            [self.middleButton setTitle:tittle forState:UIControlStateNormal];
            [self.middleButton setIconInRightWithSpacing:5];
        }
        if (self.rightButton.selected ==YES) {
            rightType=index;
            self.rightButton.selected =NO;
            [self.rightButton setTitle:tittle forState:UIControlStateNormal];
            
            self.rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            self.rightButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, YF_W(14));
            [self.rightButton setIconInRightWithSpacing:5];
        }
        
        if (leftType==0) {
            sort=@"";
            sortType=@"";
        }
        if (leftType==1) {
            sort=@"limit_days";
            sortType=@"ASC";
        }
        if (leftType==2) {
            sort=@"limit_days";
            sortType=@"DESC";
        }
        if (leftType==3) {
            sort=@"rate_of_year";
            sortType=@"DESC";
        }
        if (middleType==0) {
            repayTypeStr=@"";
        }
        if (middleType==1) {
            repayTypeStr=@"一次性还本付息";
        }
        if (middleType==2) {
            repayTypeStr=@"等额本息";
        }
        if (middleType==3) {
            repayTypeStr=@"先息后本";
        }
        if (rightType==0) {
            projectType=@"";
        }
        if (rightType==1) {
            projectType=@"原项目";
        }
        if (rightType==2) {
            projectType=@"债转项目";
        }
        
        [self.YFTableView.mj_header beginRefreshing];
    }
    
    
    
}

- (void)preventFlicker:(UIButton *)button {
    button.highlighted = NO;
}


-(UIView *)footerview
{
    if (!_footerview) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = LIGHTGREYCOLOR;
        view.userInteractionEnabled =YES;
        _footerview = view;
    }
    return _footerview;
}

-(UILabel *)footerLabel
{
    if (!_footerLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF999;
        label.textAlignment=NSTextAlignmentCenter;
        label.numberOfLines=0;
        label.text =@"期待回报不代表实际利息回报承诺\n市场有风险，投资需谨慎";
        _footerLabel = label;
    }
    return _footerLabel;
}

-(UIImageView *)tittleImageView
{
    if (!_tittleImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image =[UIImage imageNamed:@"licaiImage"];
        _tittleImageView = imageView;
    }
    return _tittleImageView;
}


-(YFBaseTableView *)YFTableView
{
    if (!_YFTableView) {
        YFBaseTableView *tableView= [[YFBaseTableView alloc] init];
        tableView.separatorColor = LIGHTGREYCOLOR;
        tableView.tableFooterView = [UIView new];
        tableView.delegate = self;
        tableView.dataSource =self;
        _YFTableView =tableView;
    }
    return _YFTableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return YF_H(20);
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImageView *view = [[UIImageView alloc] init];
    view.userInteractionEnabled = YES;
    view.backgroundColor = WHITECOLOR;
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YF_H(201);
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.YFHotArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFHomePageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[YFHomePageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    YFHomePageModel *model=[self.YFHotArray objectAtIndex:indexPath.row];
    
    [cell setterHomePageModel:model];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    
     YFHomePageModel *model=[self.YFHotArray objectAtIndex:indexPath.row];
    /*
    债权转让
    */
    if ([model.type isEqualToString:@"债转项目"]) {
        
        YFFinancialDetailsViewController *YFFinancialDetailsVC=[[YFFinancialDetailsViewController alloc]init];
        YFFinancialDetailsVC.projectId=model.id;
        [self.navigationController pushViewController:YFFinancialDetailsVC animated:YES];
    }
    /*
     新人专享type  yes未满  No 已满
     */
    if ([model.type isEqualToString:@"原项目"]) {
        
        YFNormalFinancialDetailsViewController *YFFinancialDetailsVC=[[YFNormalFinancialDetailsViewController alloc]init];
        YFFinancialDetailsVC.listModel=model;
        YFFinancialDetailsVC.typeId = YFNormalFinancialDetailsViewControllerTypeList;
        YFFinancialDetailsVC.type = [model.residue integerValue] == 0 ?NO:YES;
        if ([model.status integerValue]==0) {
            YFFinancialDetailsVC.type=YES;
        }
        [self.navigationController pushViewController:YFFinancialDetailsVC animated:YES];
    }
    
}

-(void)YFRefresh
{
    self.YFTableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        _page=1;
        _isTheDropDown=YES;
        [self DataRequest];
    }];
    
    self.YFTableView.mj_footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.YFTableView.mj_footer.automaticallyChangeAlpha = YES;
        _page=_page+1;
        _isTheDropDown=NO;
        [self DataRequest];
    }];
    [self.YFTableView.mj_header beginRefreshing];
    
}

/*
 数据请求
 */
-(void)DataRequest
{
    [YFProjectFinanceReques YFProjectPageNum:[NSString stringWithFormat:@"%ld",_page] pageSizeString:@"10" sortString:sort sortTypeString:sortType repayTypeStrString:repayTypeStr projectTypeString:projectType success:^(id json) {
        NSLog(@"2323 == %@",json);
        
        if ([YFTool Nsdic:json]==1) {
            
            NSDictionary *datadic=[json objectForKey:@"data"];
            NSDictionary *listdic=[datadic objectForKey:@"list"];
            NSArray *contentArr=[listdic objectForKey:@"list"];
            
            if (_isTheDropDown==YES) {
                [self.YFHotArray removeAllObjects];
                
                for (NSDictionary *dic in contentArr) {
                    YFHomePageModel *model=[[YFHomePageModel alloc] init];
                    [model setValuesForKeysWithDictionary:dic];
                    [self.YFHotArray addObject:model];
                    
                }
                [self.YFTableView.mj_header endRefreshing];
                if (contentArr.count==10) {
                    [self.YFTableView.mj_footer resetNoMoreData];
                }
                if (contentArr.count<10) {
                    [self.YFTableView.mj_footer endRefreshingWithNoMoreData];
                }
                [self.YFTableView reloadData];
                
            }
            if (_isTheDropDown==NO) {
                for (NSDictionary *dic in contentArr) {
                    YFHomePageModel *model=[[YFHomePageModel alloc] init];
                    [model setValuesForKeysWithDictionary:dic];
                    [self.YFHotArray addObject:model];
                    
                }
                [self.YFTableView.mj_footer endRefreshing];
                if (contentArr.count==0) {
                    [self.YFTableView.mj_footer endRefreshingWithNoMoreData];
                }
                if (contentArr.count>0) {
                    [self.YFTableView reloadData];
                }
                
            }
  
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
             [self.YFTableView.mj_header endRefreshing];
             [self.YFTableView.mj_footer endRefreshing];
        }
        
    } failure:^(NSError *error) {
        [self.YFTableView.mj_header endRefreshing];
        [self.YFTableView.mj_footer endRefreshing];
    }];
}



/*
 视图将要消失
 */
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    
}

/**  section不悬停  */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = YF_H(20);
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
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

