//
//  YFCreditorsRightsTransferInTheViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFCreditorsRightsTransferInTheViewController.h"
#import "YFHomePageModel.h"
#import "YFTheInvestmentDetailsAreCalculatedViewController.h"


#import "YFMyInvestmentMoreHistorySettlementOfViewController.h"
@interface YFCreditorsRightsTransferInTheViewController ()<UITableViewDelegate,UITableViewDataSource>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

@end

@implementation YFCreditorsRightsTransferInTheViewController
static NSString *cellId = @"YFCreditorsRightsTransferInTheTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configuration];
       [self YFRefresh];
    // Do any additional setup after loading the view.
}


-(void)configuration
{
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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 7;
    
    
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
    if (indexPath.row==1) {
        return YF_H(73);
    }
    if (indexPath.row==6) {
        return YF_H(49);
    }
    else{
        return YF_H(37);
    }
    
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFCreditorsRightsTransferInTheTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFCreditorsRightsTransferInTheTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
//    [cell setterIndex:indexPath.row IndexSection:indexPath.section];
    [cell setterIndex:indexPath.row IndexSection:indexPath.section andStr:self.dataArray[indexPath.section]];
    cell.canButton.tag = indexPath.section;
    [cell.canButton addTarget:self action:@selector(canClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    return cell;
    
}

-(void)canClick:(UIButton *)sender
{
   
//    YFinvestmentTransferCancelString
    [YFSRFManager YFSrfSuccess:^(id json) {
        
        [self cancelBtnClick:json andIndex:sender.tag];
        
    } failure:^(NSError *error) {
        
    }];
   
}

- (void)cancelBtnClick:(NSString *)srf andIndex:(NSInteger )index
{
    YFHomePageModel *model = self.dataArray[index];
    [YFMineRequest YFinvestmentTransferCancelString:model.id srfString:srf success:^(id json) {
        if ([YFTool Nsdic:json]==1) {
            [YFProgressHUD showInfoWithStatus:@"取消转让成功"];
            [self  DataRequest];
        }
    } failure:^(NSError *error) {
        [self.YFTableView.mj_header endRefreshing];
        [self.YFTableView.mj_footer endRefreshing];
    }];
 
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.row == 0) {
         YFHomePageModel *model=[self.dataArray objectAtIndex:indexPath.row];
//        YFTheInvestmentDetailsAreCalculatedViewController *vc = [[YFTheInvestmentDetailsAreCalculatedViewController alloc]init];
//        vc.model = self.dataArray[indexPath.row];
//        [self.navigationController pushViewController:vc animated:YES];
       
        YFMyInvestmentMoreHistorySettlementOfViewController *YFMyInvestmentIsInTheFundraisingVC=[[YFMyInvestmentMoreHistorySettlementOfViewController alloc]init];
        YFMyInvestmentIsInTheFundraisingVC.model = model;
        YFMyInvestmentIsInTheFundraisingVC.type = YFMyInvestmentMoreHistorySettlementOfViewControllerTypeZhuanRanging;
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


-(void)DataRequest
{
    [YFMineRequest YFinvestmentTransferListString:[NSString stringWithFormat:@"%ld",_page] PageSizeString:@"10" typeString:@"2" success:^(id json) {
        NSLog(@"2323 == %@",json);
        
        if ([YFTool Nsdic:json]==1) {
            
            NSDictionary *datadic=[json objectForKey:@"data"];
            NSDictionary *listdic=[datadic objectForKey:@"pageResult"];
            NSArray *contentArr=[listdic objectForKey:@"result"];
            
            if (_isTheDropDown==YES) {
                [self.dataArray removeAllObjects];
                
                for (NSDictionary *dic in contentArr) {
                    NSDictionary *project = dic[@"project"];
                    [project setValue:dic[@"id"] forKey:@"id"];
                    YFHomePageModel *model=[[YFHomePageModel alloc] init];
                    [model setValuesForKeysWithDictionary:project];
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

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
@end
