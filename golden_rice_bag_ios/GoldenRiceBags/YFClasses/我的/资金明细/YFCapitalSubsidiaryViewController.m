//
//  YFCapitalSubsidiaryViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/24.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFCapitalSubsidiaryViewController.h"
#define YFTittle @[@"投资成功-投资订单号CZ123456789099",@"项目回款-投资订单号CZ123456789099",@"撤销投资-投资订单号CZ123456789099",@"自动还款-投资订单号CZ123456789099",@"手动还款-投资订单号CZ123456789099"]
#define YFTittle2 @[@"投资成功",@"项目回款",@"撤销投资",@"自动还款",@"手动还款"]
@interface YFCapitalSubsidiaryViewController ()<UITableViewDelegate,UITableViewDataSource>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

/*
 data数组
 */
@property(nonatomic,strong)NSMutableArray *YFDataArray;

@end

@implementation YFCapitalSubsidiaryViewController
static NSString *cellId = @"YFCapitalSubsidiaryTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"资金明细";
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


-(void)configuration
{
    [self.view sd_addSubviews:@[self.YFTableView]];
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, YF_H(0))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(HEIGHT - 64);
    
    
}

-(NSMutableArray *)YFDataArray
{
    if (!_YFDataArray) {
        _YFDataArray=[NSMutableArray array];
    }
    return _YFDataArray;
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
    
    return YF_H(10);
    
    
    
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
    
    return YF_H(96);
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.YFDataArray.count;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFCapitalSubsidiaryTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFCapitalSubsidiaryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    YFCapitalSubsidiaryModel *model=[self.YFDataArray objectAtIndex:indexPath.row];
    [cell setterCapitalSubsidiaryModel:model];
    
    return cell;
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    YFCapitalSubsidiaryModel *model=[self.YFDataArray objectAtIndex:indexPath.row];
    
    YFCapitalSubsidiaryDetailViewController *YFSystemOfAnnouncementVC=[[YFCapitalSubsidiaryDetailViewController alloc]init];
    YFSystemOfAnnouncementVC.type=[self statesString:model.type];
    YFSystemOfAnnouncementVC.detailModel=model;
    [self.navigationController pushViewController:YFSystemOfAnnouncementVC animated:YES];
    

}


/*
 数据请求
 */
-(void)DataRequest
{
    [YFMineRequest YFAccountRecordListNumString:[NSString stringWithFormat:@"%ld",_page] PageSizeString:@"10" success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            NSLog(@"2222 == %@",json);
            NSDictionary *dataDic=[json objectForKey:@"data"];
            NSArray *contentArr=[dataDic objectForKey:@"list"];
            
            if (_isTheDropDown==YES) {
                [self.YFDataArray removeAllObjects];
                
                for (NSDictionary *dic in contentArr) {
                    YFCapitalSubsidiaryModel *model=[[YFCapitalSubsidiaryModel alloc] init];
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
                    YFCapitalSubsidiaryModel *model=[[YFCapitalSubsidiaryModel alloc] init];
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

/**  section不悬停  */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = YF_H(10);
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
    
}

-(NSString *)statesString:(NSString *)states
{
    NSString *statesString=@"";
    switch ([states integerValue]) {
        case 1:
        {
            statesString=@"提现";
        }
            break;
        case 2:
        {
             statesString=@"充值";
        }
            break;
        case 3:
        {
             statesString=@"投资成功";
        }
            break;
        case 4:
        {
             statesString=@"项目回款";
        }
            break;
        case 5:
        {
             statesString=@"撤销投资";
        }
            break;
        case 6:
        {
             statesString=@"自动还款";
        }
            break;
        case 7:
        {
             statesString=@"手动还款";
        }
            break;
        case 8:
        {
             statesString=@"借款成功";
        }
            break;
        case 9:
        {
             statesString=@"转让成功";
        }
            break;
        default:
            break;
    }
    
    return statesString;
    
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
