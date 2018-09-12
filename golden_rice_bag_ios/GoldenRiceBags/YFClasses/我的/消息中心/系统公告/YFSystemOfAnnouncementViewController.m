//
//  YFSystemOfAnnouncementViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFSystemOfAnnouncementViewController.h"

@interface YFSystemOfAnnouncementViewController ()<UITableViewDelegate,UITableViewDataSource>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;
/*
 系统消息数组
 */
@property(nonatomic,strong)NSMutableArray *YFSystemArray;
@end

@implementation YFSystemOfAnnouncementViewController
static NSString *cellId = @"YFSystemOfAnnouncementTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"系统公告";
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

-(NSMutableArray *)YFSystemArray
{
    if (!_YFSystemArray) {
        _YFSystemArray=[NSMutableArray array];
    }
    return _YFSystemArray;
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
    return self.YFSystemArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return YF_H(56);
    
    
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImageView *view = [[UIImageView alloc] init];
    view.userInteractionEnabled = YES;
    view.backgroundColor = LIGHTGREYCOLOR;
    
    UILabel *label=[[UILabel alloc] init];
    label.font=YF_FONT(12);
    label.textColor=WHITECOLOR;
    label.textAlignment =NSTextAlignmentCenter;
    label.backgroundColor=[YFTool YFColorWithString:@"D8D8D8"];
    label.layer.cornerRadius=YF_W(12);
    label.layer.masksToBounds=YES;
    [view addSubview:label];
    
    label.sd_layout
    .centerXEqualToView(view)
    .centerYEqualToView(view)
    .widthIs(YF_W(123))
    .heightIs(YF_H(26));
    
    YFMessageModel *systemModel=[self.YFSystemArray objectAtIndex:section];
    label.text=[YFTool timeWithTimeIntervalString:systemModel.createTime Format:@"yyyy-MM-dd HH:mm"];
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YFMessageModel *systemModel=[self.YFSystemArray objectAtIndex:indexPath.section];
    
    return YF_H(37)+[YFTool lableHeight:systemModel.content labelFont:YF_W(14) WD:WIDTH -YF_W(28) Bold:NO] +YF_H(20);
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFSystemOfAnnouncementTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFSystemOfAnnouncementTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    YFMessageModel *systemModel=[self.YFSystemArray objectAtIndex:indexPath.section];
    
    [cell setterMessageModel:systemModel];
    
    return cell;
    
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
    [YFMineRequest YFTypeString:@"1" PageNumString:[NSString stringWithFormat:@"%ld",_page] PageSizeString:@"10" success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
                NSLog(@"2222 == %@",json);
                NSDictionary *dic=[json objectForKey:@"data"];
                NSArray *contentArr=[dic objectForKey:@"list"];

            if (_isTheDropDown==YES) {
                [self.YFSystemArray removeAllObjects];
                
                for (NSDictionary *dic in contentArr) {
                    YFMessageModel *model=[[YFMessageModel alloc] init];
                    [model setValuesForKeysWithDictionary:dic];
                    [self.YFSystemArray addObject:model];
                    
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
                    [self.YFSystemArray addObject:model];
                    
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
    CGFloat sectionHeaderHeight = YF_H(56);
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
