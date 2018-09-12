//
//  YFARedEnvelopeViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/24.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFARedEnvelopeViewController.h"

@interface YFARedEnvelopeViewController ()<UITableViewDelegate,UITableViewDataSource>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

/*
 footerview
 */
@property(nonatomic,strong)UIButton *footerViewButton;

/*
 数据数组
 */
@property(nonatomic,strong)NSMutableArray *YFDataArray;
@end

@implementation YFARedEnvelopeViewController
static NSString *cellId = @"TFMyRedPacketsListTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
     [self configuration];
    /*
     数据请求
     */
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

-(NSMutableArray *)YFDataArray
{
    if (!_YFDataArray) {
        _YFDataArray=[NSMutableArray array];
    }
    return _YFDataArray;
}


-(void)configuration
{
    [self.view sd_addSubviews:@[self.footerViewButton,self.YFTableView]];
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, YF_H(0))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(HEIGHT - 64);
    
    [self.YFTableView setTableFooterView:self.footerViewButton];
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
    
    return YF_H(0);
    
    
    
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
    
    return YF_H(113);
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.YFDataArray.count;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TFMyRedPacketsListTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[TFMyRedPacketsListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    YFMyRedPacketsModel *model=[self.YFDataArray objectAtIndex:indexPath.row];
    
    [cell setterMyRedPacketsModel:model];
    
    
    return cell;
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    YFMyRedPacketsModel *model=[self.YFDataArray objectAtIndex:indexPath.row];
    if (_selectType==1) {
        
        if ([model.rechargeStandard floatValue] <=[_moneyString floatValue]) {
            
            NSDictionary *dic=@{@"0":model.amount,@"1":model.id};
            /**   */
            [[NSNotificationCenter defaultCenter] postNotificationName:@"Red" object:dic];
            [self.navigationController popViewControllerAnimated:YES];
            
        }
    }
    
}

-(UIButton *)footerViewButton
{
    if (!_footerViewButton) {
        UIButton *button =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, WIDTH, YF_H(60))];
        button.titleLabel.font = YF_FONT(14);
        [button setTitleColor:ZHUTICOLOR forState:UIControlStateNormal];
        [button setTitle:@"查看失效红包" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(checkClick) forControlEvents:UIControlEventTouchUpInside];
        _footerViewButton = button;
    }
    return _footerViewButton;
}
-(void)checkClick
{
    TFMyRedPacketsFailureViewController *TFMyRedPacketsFailureVC=[[TFMyRedPacketsFailureViewController alloc]init];
    [self.navigationController pushViewController:TFMyRedPacketsFailureVC animated:YES];
}



/*
 数据请求
 */
-(void)DataRequest
{
    [YFMineRequest YFPageNumString:@"1" PageSizeString:@"10" TypeString:@"2" IdString:[YFTool userDefaultsId:YFID] StatusString:@"0" success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            NSLog(@"222 == %@",json);
            NSDictionary *dataDic=[json objectForKey:@"data"];
            NSArray *contentArr=[dataDic objectForKey:@"list"];
            
            if (_isTheDropDown==YES) {
                [self.YFDataArray removeAllObjects];
                
                for (NSDictionary *dic in contentArr) {
                    YFMyRedPacketsModel *model=[[YFMyRedPacketsModel alloc] init];
                    [model setValuesForKeysWithDictionary:dic];
                    [self.YFDataArray addObject:model];
                    
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
                    YFMyRedPacketsModel *model=[[YFMyRedPacketsModel alloc] init];
                    [model setValuesForKeysWithDictionary:dic];
                    [self.YFDataArray addObject:model];
                    
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
