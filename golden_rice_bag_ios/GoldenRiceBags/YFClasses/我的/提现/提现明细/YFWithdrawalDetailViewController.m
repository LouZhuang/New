//
//  YFWithdrawalDetailViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFWithdrawalDetailViewController.h"

@interface YFWithdrawalDetailViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>
/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;
/*
 data数组
 */
@property(nonatomic,strong)NSMutableArray *YFArray;
@end

@implementation YFWithdrawalDetailViewController
{
    NSMutableArray *_isExpandArray;//记录section是否展开
}
static NSString *cellId = @"YFWithdrawalDetailTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"提现明细";
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
    
    _isExpandArray=[NSMutableArray array];
  
    
    [self.view sd_addSubviews:@[self.YFTableView]];
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, YF_H(10))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(HEIGHT -YF_H(10)-64);
    
     [self addNavigationItemWithImageNames:@[@"tabbarImage"] isLeft:YES target:self action:@selector(back) tags:nil];
}
-(void)back
{
    if (_successType==1 ) {
        
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
    
   
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

#pragma -- mark tableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.YFArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([_isExpandArray[section]isEqualToString:@"1"]) {
        return  5;
    }else{
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return YF_H(72);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return YF_H(37);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIImageView *view = [[UIImageView alloc] init];
    view.userInteractionEnabled = YES;
    view.backgroundColor = WHITECOLOR;
    
     YFTopUpDetailModel *systemModel=[self.YFArray objectAtIndex:section];
    
    UILabel *tittleLabel = [[UILabel alloc]init];
    tittleLabel.textColor = YF666;
    tittleLabel.font=YF_FONT(14);
    tittleLabel.text = @"提现";
    [view addSubview:tittleLabel];
    
    tittleLabel.sd_layout
    .topSpaceToView(view, YF_H(15))
    .leftSpaceToView(view, YF_W(14))
    .widthIs(100)
    .heightIs(20);
    
    
    UILabel *timeLabel = [[UILabel alloc]init];
    timeLabel.textColor = YF999;
    timeLabel.font=YF_FONT(14);
    timeLabel.text = [YFTool timeWithTimeIntervalString:systemModel.createTime Format:@"yyyy-MM-dd HH:mm"];
    [view addSubview:timeLabel];
    
    timeLabel.sd_layout
    .topSpaceToView(view, YF_H(37))
    .leftSpaceToView(view, YF_W(14))
    .widthIs(180)
    .heightIs(20);
    
    UILabel *numberLabel = [[UILabel alloc]init];
    numberLabel.textColor = YF333;
    numberLabel.font=YF_FONT(14);
    numberLabel.text =[NSString stringWithFormat:@"%@",systemModel.amount];
    numberLabel.textAlignment= NSTextAlignmentRight;
    [view addSubview:numberLabel];
    
    numberLabel.sd_layout
    .topSpaceToView(view, YF_H(37))
    .rightSpaceToView(view, YF_W(37))
    .widthIs(180)
    .heightIs(20);
    
    
    
    
    UIImageView *selectImageView = [[UIImageView alloc]init];
    [view addSubview:selectImageView];
    
    selectImageView.sd_layout
    .topSpaceToView(view, YF_H(45))
    .rightSpaceToView(view, YF_W(14))
    .widthIs(9)
    .heightIs(5);
    
    if ([_isExpandArray[section] isEqualToString:@"0"]) {
        //未展开
        selectImageView.image = [UIImage imageNamed:@"xiaImage"];
    }else{
        //展开
        selectImageView.image = [UIImage imageNamed:@"shangImage"];
    }
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    tap.delegate = self;
    [view addGestureRecognizer:tap];
    view.tag = section;
    return view;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YFWithdrawalDetailTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFWithdrawalDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    YFTopUpDetailModel *systemModel=[self.YFArray objectAtIndex:indexPath.section];
    [cell setterIndex:indexPath.row TopUpDetailModel:systemModel];
    
    return cell;
}

- (void)tapAction:(UITapGestureRecognizer *)tap{
    if ([_isExpandArray[tap.view.tag] isEqualToString:@"0"]) {
        //关闭 => 展开
        [_isExpandArray removeObjectAtIndex:tap.view.tag];
        [_isExpandArray insertObject:@"1" atIndex:tap.view.tag];
    }else{
        //展开 => 关闭
        [_isExpandArray removeObjectAtIndex:tap.view.tag];
        [_isExpandArray insertObject:@"0" atIndex:tap.view.tag];
        
    }
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:tap.view.tag];
    NSRange rang = NSMakeRange(indexPath.section, 1);
    NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:rang];
    [self.YFTableView reloadSections:set withRowAnimation:UITableViewRowAnimationFade];
    
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
    [YFMineRequest YFWithdrawListString:[NSString stringWithFormat:@"%ld",_page] PageSizeString:@"10" success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            NSLog(@"2222 == %@",json);
            
           
            NSDictionary *dic=[json objectForKey:@"data"];
            NSArray *contentArr=[dic objectForKey:@"list"];
            
            if (_isTheDropDown==YES) {
                [self.YFArray removeAllObjects];
                
                for (NSDictionary *dic in contentArr) {
                    YFTopUpDetailModel *model=[[YFTopUpDetailModel alloc] init];
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
                [_isExpandArray removeAllObjects];
                for (NSInteger i = 0; i < self.YFArray.count; i++) {
                    [_isExpandArray addObject:@"0"];//0:没展开 1:展开
                }
                [self.YFTableView reloadData];
                
            }
            if (_isTheDropDown==NO) {
                for (NSDictionary *dic in contentArr) {
                    YFTopUpDetailModel *model=[[YFTopUpDetailModel alloc] init];
                    [model setValuesForKeysWithDictionary:dic];
                    [self.YFArray addObject:model];
                    
                }
                [self.YFTableView.mj_footer endRefreshing];
                if (contentArr.count==0) {
                    [self.YFTableView.mj_footer endRefreshingWithNoMoreData];
                }
                if (contentArr.count>0) {
                    [_isExpandArray removeAllObjects];
                    for (NSInteger i = 0; i < self.YFArray.count; i++) {
                        [_isExpandArray addObject:@"0"];//0:没展开 1:展开
                    }
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
