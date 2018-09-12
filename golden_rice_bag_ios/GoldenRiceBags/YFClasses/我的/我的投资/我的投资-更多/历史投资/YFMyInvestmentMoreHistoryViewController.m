//
//  YFMyInvestmentMoreHistoryViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFMyInvestmentMoreHistoryViewController.h"

@interface YFMyInvestmentMoreHistoryViewController ()<UITableViewDelegate,UITableViewDataSource>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;
/*
 data数组
 */
@property(nonatomic,strong)NSMutableArray *YFArray;
@end

@implementation YFMyInvestmentMoreHistoryViewController
static NSString *cellId = @"YFMyInvestmentMoreTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"历史投资";
    [self configuration];
    _page=1;
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
    // Do any additional setup after loading the view.
}

-(NSMutableArray *)YFArray
{
    if (!_YFArray) {
        _YFArray=[NSMutableArray array];
    }
    return _YFArray;
}
-(void)configuration
{
    
    
    UIView *footerView=[[UIView alloc] init];
    footerView.backgroundColor=WHITECOLOR;
    
    footerView.sd_layout
    .bottomEqualToView(self.view)
    .leftEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(26));
    
    [self.view sd_addSubviews:@[self.YFTableView]];
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, YF_H(0))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(HEIGHT - 64);
    
    [self.YFTableView setTableFooterView:footerView];
}



-(YFBaseTableView *)YFTableView
{
    if (!_YFTableView) {
        YFBaseTableView *tableView= [[YFBaseTableView alloc] init];
        tableView.separatorColor = LIGHTGREYCOLOR;
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
    
    return YF_H(2);
    
    
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImageView *view = [[UIImageView alloc] init];
    view.userInteractionEnabled = YES;
    view.backgroundColor = LIGHTGREYCOLOR;
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YF_H(205);
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.YFArray.count;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFMyInvestmentMoreTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFMyInvestmentMoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
   YFHomePageModel *model=[self.YFArray objectAtIndex:indexPath.row];
    [cell setterLishiMyInvestmentModel:model];

    return cell;
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    YFHomePageModel *model=[self.YFArray objectAtIndex:indexPath.row];
    if ([model.status integerValue]==3) {
        YFMyInvestmentMoreHistorySettlementOfViewController *YFMyInvestmentIsInTheFundraisingVC=[[YFMyInvestmentMoreHistorySettlementOfViewController alloc]init];
        YFMyInvestmentIsInTheFundraisingVC.model = model;
        [self.navigationController pushViewController:YFMyInvestmentIsInTheFundraisingVC animated:YES];
    }
    if ([model.status integerValue]==5) {
        YFMyInvestmentMoreHistoryClosedViewController *YFMyInvestmentIsInTheFundraisingVC=[[YFMyInvestmentMoreHistoryClosedViewController alloc]init];
        YFMyInvestmentIsInTheFundraisingVC.model=model;
        [self.navigationController pushViewController:YFMyInvestmentIsInTheFundraisingVC animated:YES];
    }

    
    
}


/*
 数据请求
 */
-(void)DataRequest
{
    
    
    [YFMineRequest YFInvestmentHistoryListPageNumString:[NSString stringWithFormat:@"%ld",_page] PageSizeString:@"10" success:^(id json) {
        
        
        if ([YFTool Nsdic:json]==1) {
            NSLog(@"2323 == %@",json);
            
            
            NSDictionary *datadic=[json objectForKey:@"data"];
            NSArray *contentArr=[datadic objectForKey:@"result"];
            
            if (_isTheDropDown==YES) {
                [self.YFArray removeAllObjects];
                
                for (NSDictionary *dic in contentArr) {
                    YFHomePageModel *model=[[YFHomePageModel alloc] init];
                    [model setValuesForKeysWithDictionary:dic];
                    [self.YFArray addObject:model];
                    
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
                    [self.YFArray addObject:model];
                    
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


/**  section不悬停  */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = YF_H(10);
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
