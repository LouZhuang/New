//
//  YFMineMessageViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFMineMessageViewController.h"

@interface YFMineMessageViewController ()<UITableViewDelegate,UITableViewDataSource>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;
/*
 我的消息数组
 */
@property(nonatomic,strong)NSMutableArray *YFMessageArray;
@end

@implementation YFMineMessageViewController
static NSString *cellId = @"YFMineMessageTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的消息";
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

-(NSMutableArray *)YFMessageArray
{
    if (!_YFMessageArray) {
        _YFMessageArray=[NSMutableArray array];
    }
    return _YFMessageArray;
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
    return self.YFMessageArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    if (section==0) {
      return YF_H(10);
    }
    else{
        return YF_H(2);
    }
    
    
    
    
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
    
    return YF_H(128);
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFMineMessageTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFMineMessageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    YFMessageModel *messageModel=[self.YFMessageArray objectAtIndex:indexPath.section];
    
    [cell setterMessageModel:messageModel];

    [cell.checkDetailsButton addTarget:self action:@selector(checkDetailsClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
    
}

-(void)checkDetailsClick:(UIButton *)sender
{
    [YFProgressHUD showInfoWithStatus:@"查看详情"];
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

/*
 数据请求
 */
-(void)DataRequest
{
    [YFMineRequest YFTypeString:@"2" PageNumString:[NSString stringWithFormat:@"%ld",_page] PageSizeString:@"10" success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            NSLog(@"2222 == %@",json);
            NSDictionary *dic=[json objectForKey:@"data"];
            NSArray *contentArr=[dic objectForKey:@"list"];
            
            if (_isTheDropDown==YES) {
                [self.YFMessageArray removeAllObjects];
                
                for (NSDictionary *dic in contentArr) {
                    YFMessageModel *model=[[YFMessageModel alloc] init];
                    [model setValuesForKeysWithDictionary:dic];
                    [self.YFMessageArray addObject:model];
                    
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
                    YFMessageModel *model=[[YFMessageModel alloc] init];
                    [model setValuesForKeysWithDictionary:dic];
                    [self.YFMessageArray addObject:model];
                    
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
