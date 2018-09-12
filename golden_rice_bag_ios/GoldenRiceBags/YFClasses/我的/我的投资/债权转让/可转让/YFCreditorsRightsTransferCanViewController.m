//
//  YFCreditorsRightsTransferCanViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFCreditorsRightsTransferCanViewController.h"
//#import "YFTheInvestmentDetailsAreCalculatedViewController.h"
#import "YFMyInvestmentMoreHistoryViewController.h"
@interface YFCreditorsRightsTransferCanViewController ()<UITableViewDelegate,UITableViewDataSource>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

@end

@implementation YFCreditorsRightsTransferCanViewController
static NSString *cellId = @"YFCreditorsRightsTransferCanTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
     [self configuration];
     [self YFRefresh];
    // Do any additional setup after loading the view.
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray=[NSMutableArray array];
    }
    return _dataArray;
}
-(void)configuration
{
    _page=1;
    [self.view sd_addSubviews:@[self.YFTableView]];
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, YF_H(0))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(HEIGHT - 64-YF_H(60) - kSafeArea_BottomHeight);
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return YF_H(0);
    
    
    
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


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
      return YF_H(50);
    }
    if (indexPath.row==7) {
        return YF_H(49);
    }
    else{
        return YF_H(37);
    }
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 8;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFCreditorsRightsTransferCanTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFCreditorsRightsTransferCanTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    YFHomePageModel *model = [self.dataArray objectAtIndex:indexPath.section];
    [cell setterIndex:indexPath.row IndexSection:indexPath.section CreditorsRightsTransferModel:model];
    
    [cell.canButton addTarget:self action:@selector(canClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    return cell;
    
}

-(void)canClick:(UIButton *)sender
{
    YFHomePageModel *model=[self.dataArray objectAtIndex:sender.tag];
    YFIWantToTransferViewController *YFIWantToTransferVC=[[YFIWantToTransferViewController alloc]init];
    YFIWantToTransferVC.model=model;
    [self.navigationController pushViewController:YFIWantToTransferVC animated:YES];
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
     YFHomePageModel *model=[self.dataArray objectAtIndex:indexPath.section];
    if (indexPath.row!=0) {
//        YFFinancialDetailsViewController *YFFinancialDetailsVC=[[YFFinancialDetailsViewController alloc]init];
//        YFFinancialDetailsVC.projectId=model.projectId;
//        [self.navigationController pushViewController:YFFinancialDetailsVC animated:YES];
        
    }else{
//        YFTheInvestmentDetailsAreCalculatedViewController *vc = [[YFTheInvestmentDetailsAreCalculatedViewController alloc]init];
//        vc.model = model;
//        [self.navigationController pushViewController:vc animated:YES];
        YFMyInvestmentMoreHistorySettlementOfViewController *YFMyInvestmentIsInTheFundraisingVC=[[YFMyInvestmentMoreHistorySettlementOfViewController alloc]init];
        YFMyInvestmentIsInTheFundraisingVC.model = model;
        [self.navigationController pushViewController:YFMyInvestmentIsInTheFundraisingVC animated:YES];
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
    [YFMineRequest YFinvestmentTransferListString:[NSString stringWithFormat:@"%ld",_page] PageSizeString:@"10" typeString:@"1" success:^(id json) {
        NSLog(@"2323 == %@",json);
        
        if ([YFTool Nsdic:json]==1) {
            
            NSDictionary *datadic=[json objectForKey:@"data"];
            NSDictionary *listdic=[datadic objectForKey:@"pageResult"];
            NSArray *contentArr=[listdic objectForKey:@"result"];

            if (_isTheDropDown==YES) {
                [self.dataArray removeAllObjects];

                for (NSDictionary *dic in contentArr) {
                    YFHomePageModel *model=[[YFHomePageModel alloc] init];
                    [model setValuesForKeysWithDictionary:dic];
                    [self.dataArray addObject:model];

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
                    [self.dataArray addObject:model];

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
            [YFProgressHUD showInfoWithStatus:@"暂无可转让项目"];
            [self.YFTableView.mj_header endRefreshing];
            [self.YFTableView.mj_footer endRefreshing];
        }
        
    } failure:^(NSError *error) {
        [self.YFTableView.mj_header endRefreshing];
        [self.YFTableView.mj_footer endRefreshing];
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
