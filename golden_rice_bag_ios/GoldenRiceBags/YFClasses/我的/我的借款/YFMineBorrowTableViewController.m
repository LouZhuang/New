//
//  YFMineBorrowTableViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFMineBorrowTableViewController.h"

@interface YFMineBorrowTableViewController ()
/*
 data数组
 */
@property(nonatomic,strong)NSMutableArray *YFDataArray;
@end

@implementation YFMineBorrowTableViewController
{
    NSString *totalCount;// 0为没有数据
}
static NSString *cellId = @"YFMineBorrowTableViewCell";


/*
 视图将要显示
 */
-(void)viewWillAppear:(BOOL)animated
{
    
    /*
     数据请求
     */
    [self DataRequest];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    totalCount=@"0";
    [self configuration];
    self.tableView.separatorColor = LIGHTGREYCOLOR;
    self.tableView.tableFooterView =[UIView new];
    [self.tableView setTableHeaderView:self.headerView];
    
    _page=1;
    
    self.tableView.mj_footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.tableView.mj_footer.automaticallyChangeAlpha = YES;
        _page=_page+1;
        [self MJDataRequest];
    }];
    
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
    [self.view sd_addSubviews:@[self.headerView]];
    
    self.headerView.sd_layout
    .topEqualToView(self.view)
    .leftEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(164));
    
    
    [self.headerView sd_addSubviews:@[self.totalLabel,self.totalNumberLabel,self.amountLabel,self.amountNumberLabel,self.daysamountLabel,self.daysamountNumberLabel,self.WithinLabel,self.WithinNumberLabel]];
    
    self.totalLabel.sd_layout
    .topSpaceToView(self.headerView, YF_H(15))
    .leftSpaceToView(self.headerView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(17));
    
    self.totalNumberLabel.sd_layout
    .topSpaceToView(self.headerView, YF_H(35))
    .leftSpaceToView(self.headerView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(24));
    
    self.amountLabel.sd_layout
    .topSpaceToView(self.headerView, YF_H(15))
    .rightSpaceToView(self.headerView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(17));
    
    self.amountNumberLabel.sd_layout
    .topSpaceToView(self.headerView, YF_H(35))
    .rightSpaceToView(self.headerView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(24));
    
    self.daysamountLabel.sd_layout
    .topSpaceToView(self.headerView, YF_H(90))
    .leftSpaceToView(self.headerView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(17));
    
    self.daysamountNumberLabel.sd_layout
    .topSpaceToView(self.headerView, YF_H(110))
    .leftSpaceToView(self.headerView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(24));
    
    self.WithinLabel.sd_layout
    .topSpaceToView(self.headerView, YF_H(90))
    .rightSpaceToView(self.headerView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(17));
    
    self.WithinNumberLabel.sd_layout
    .topSpaceToView(self.headerView, YF_H(110))
    .rightSpaceToView(self.headerView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(24));
    
    UIImageView *imageViewfirst = [[UIImageView alloc] init];
    imageViewfirst.image = [UIImage imageNamed:@"shuxuxianImage"];
    [self.headerView addSubview:imageViewfirst];
    
    imageViewfirst.sd_layout
    .topSpaceToView(self.headerView, YF_H(23.5))
    .centerXEqualToView(self.headerView)
    .widthIs(YF_W(1))
    .heightIs(YF_H(30));
    
    
    UIImageView *imageViewsecond = [[UIImageView alloc] init];
    imageViewsecond.image = [UIImage imageNamed:@"shuxuxianImage"];
    [self.headerView addSubview:imageViewsecond];
    
    imageViewsecond.sd_layout
    .topSpaceToView(imageViewfirst, YF_H(45))
    .centerXEqualToView(self.headerView)
    .widthIs(YF_W(1))
    .heightIs(YF_H(30));
    
    UIImageView *imageViewthird = [[UIImageView alloc] init];
    imageViewthird.backgroundColor=LIGHTGREYCOLOR;
    [self.headerView addSubview:imageViewthird];
    
    imageViewthird.sd_layout
    .topSpaceToView(self.headerView, YF_H(74))
    .leftSpaceToView(self.headerView, YF_W(14))
    .widthIs(WIDTH - YF_W(28))
    .heightIs(YF_H(1));
    
}


#pragma mark - lazy

-(UIView *)headerView
{
    if (!_headerView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = WHITECOLOR;
        view.userInteractionEnabled =YES;
        _headerView = view;
    }
    return _headerView;
}


-(UILabel *)totalLabel
{
    if (!_totalLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =[YFTool YFColorWithString:@"999999"];
        label.text =@"当前借款总金额(元)";
        _totalLabel = label;
    }
    return _totalLabel;
}


-(UILabel *)totalNumberLabel
{
    if (!_totalNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textColor =ZHUTICOLOR;
        label.text =@"0.00";
        _totalNumberLabel = label;
    }
    return _totalNumberLabel;
}

-(UILabel *)amountLabel
{
    if (!_amountLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =[YFTool YFColorWithString:@"999999"];
        label.text =@"待还金额(元)";
        label.textAlignment=NSTextAlignmentRight;
        _amountLabel = label;
    }
    return _amountLabel;
}


-(UILabel *)amountNumberLabel
{
    if (!_amountNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textColor =ZHUTICOLOR;
        label.text =@"0.00";
        label.textAlignment=NSTextAlignmentRight;
        _amountNumberLabel = label;
    }
    return _amountNumberLabel;
}

-(UILabel *)daysamountLabel
{
    if (!_daysamountLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =[YFTool YFColorWithString:@"999999"];
        label.text =@"近30天应还金额(元)";
        _daysamountLabel = label;
    }
    return _daysamountLabel;
}


-(UILabel *)daysamountNumberLabel
{
    if (!_daysamountNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textColor =ZHUTICOLOR;
        label.text =@"0.00";
        _daysamountNumberLabel = label;
    }
    return _daysamountNumberLabel;
}

-(UILabel *)WithinLabel
{
    if (!_WithinLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textAlignment=NSTextAlignmentRight;
        label.textColor =[YFTool YFColorWithString:@"999999"];
        label.text =@"逾期金额(元)";
        _WithinLabel = label;
    }
    return _WithinLabel;
}


-(UILabel *)WithinNumberLabel
{
    if (!_WithinNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textColor =ZHUTICOLOR;
        label.textAlignment=NSTextAlignmentRight;
        label.text =@"0.00";
        _WithinNumberLabel = label;
    }
    return _WithinNumberLabel;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     if ([totalCount integerValue] ==0) {
         return 1;
     }
     else{
    return self.YFDataArray.count;
     }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YF_H(205);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFMineBorrowTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFMineBorrowTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];

    }

    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    if ([totalCount integerValue] ==0) {
       
        [cell setterMineBorrowModel:nil totalCountString:totalCount];
    }
    else{
    YFMineBorrowModel *model=[self.YFDataArray objectAtIndex:indexPath.row];

    [cell setterMineBorrowModel:model totalCountString:totalCount];
    }
    
    
    
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

     if ([totalCount integerValue] > 0) {
    YFMineBorrowModel *model=[self.YFDataArray objectAtIndex:indexPath.row];
    switch (model.status) {
        case 0:
        {
            /*
             申请中
             */
            YFInTheApplicationViewController *MineVC = [[YFInTheApplicationViewController alloc] init];
            MineVC.mineBorrowModel=model;
            [[YFTool getCurrentVC].navigationController pushViewController:MineVC animated:YES];
         
        }
            break;
        case 1:
        {
            /*
             募集中
             */
            YFToRaiseTheViewController *MineVC = [[YFToRaiseTheViewController alloc] init];
            MineVC.mineBorrowModel=model;
            [[YFTool getCurrentVC].navigationController pushViewController:MineVC animated:YES];
           
        }
            break;
        case 2:
        {
            /*
             正常还款中
             */
            YFNormalRepaymentViewController *MineVC = [[YFNormalRepaymentViewController alloc] init];
            MineVC.mineBorrowModel = model;
            [[YFTool getCurrentVC].navigationController pushViewController:MineVC animated:YES];
            
            
        }
            break;
        case 3:
        {
            /*
             审核未通过
             */
            YFAuditFailedViewController *MineVC = [[YFAuditFailedViewController alloc] init];
            MineVC.mineBorrowModel=model;
            [[YFTool getCurrentVC].navigationController pushViewController:MineVC animated:YES];
           
        }
            break;
        case 4:
        {
            /*
             关闭
             */
            YFCloseViewController *MineVC = [[YFCloseViewController alloc] init];
            MineVC.mineBorrowModel=model;
            [[YFTool getCurrentVC].navigationController pushViewController:MineVC animated:YES];
        }
            break;
        case 5:
        {
            /*
            募集失败
             */
            YFRaiseFailureViewController *MineVC = [[YFRaiseFailureViewController alloc] init];
            MineVC.mineBorrowModel=model;
            [[YFTool getCurrentVC].navigationController pushViewController:MineVC animated:YES];
        }
            break;
        case 6:
        {
            /*
             正常结款
             */
            YFNormalAndModelViewController *MineVC = [[YFNormalAndModelViewController alloc] init];
            MineVC.mineBorrowModel=model;
            MineVC.title=@"正常结款";
            
            [[YFTool getCurrentVC].navigationController pushViewController:MineVC animated:YES];
        }
            break;
        case 7:
        {
            /*
             提前还款
             */
            YFNormalAndModelViewController *MineVC = [[YFNormalAndModelViewController alloc] init];
            MineVC.title=@"提前还款";
            MineVC.mineBorrowModel = model;
            [[YFTool getCurrentVC].navigationController pushViewController:MineVC animated:YES];
           
        }
            break;
        case 8:
        {
            /*
             募集成功
             */
            YFToRaiseSuccessfulViewController *MineVC = [[YFToRaiseSuccessfulViewController alloc] init];
            MineVC.mineBorrowModel = model;
            [[YFTool getCurrentVC].navigationController pushViewController:MineVC animated:YES];
            
        }
            break;
        case 9:
        {
            /*
             逾期中
             */
            YFInTheLateViewController *MineVC = [[YFInTheLateViewController alloc] init];
            MineVC.mineBorrowModel=model;
            [[YFTool getCurrentVC].navigationController pushViewController:MineVC animated:YES];
        }
            break;
        default:
            break;
    }
    
     }
    
}


/*
 数据请求
 */
-(void)DataRequest
{
    [YFMineRequest YFPageNumString:@"1" PageSizeString:@"10" success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            
            NSLog(@"232323===%@",json);
            
            
            NSDictionary *dic=[json objectForKey:@"data"];
            NSDictionary *accountDic=[dic objectForKey:@"account"];
            
            [self.YFDataArray removeAllObjects];
             NSDictionary *loantDic=[dic objectForKey:@"loan"];
            NSArray *loanArr=[loantDic objectForKey:@"result"];
            
            for (NSDictionary *dic in loanArr) {
                YFMineBorrowModel *model=[[YFMineBorrowModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.YFDataArray addObject:model];
                
            }
            if (loanArr.count==0) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            totalCount=[NSString stringWithFormat:@"%ld",self.YFDataArray.count];
            
            [self.tableView reloadData];
            
            /*
             数据刷新
             */
            [self dataAssignment:accountDic dataDic:dic];
            
            
        }
        
    } failure:^(NSError *error) {
        
    }];
}



/*
 数据请求
 */
-(void)MJDataRequest
{
    
    [YFMineRequest YFPageNumString:[NSString stringWithFormat:@"%ld",_page] PageSizeString:@"10" success:^(id json) {
         NSLog(@"232323===%@",json);
        
        if ([YFTool Nsdic:json]==1) {
            
           
            
            NSDictionary *dic=[json objectForKey:@"data"];

            NSDictionary *loantDic=[dic objectForKey:@"loan"];
            NSArray *loanArr=[loantDic objectForKey:@"result"];
            
            for (NSDictionary *dic in loanArr) {
                YFMineBorrowModel *model=[[YFMineBorrowModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.YFDataArray addObject:model];
                
            }
            [self.tableView.mj_footer endRefreshing];
            if (loanArr.count==0) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            if (loanArr.count>0) {
                [self.tableView reloadData];
            }
            
        } else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer endRefreshing];
        }
        
    } failure:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    }];
    

}

-(void)dataAssignment:(NSDictionary *)accountDic dataDic:(NSDictionary *)data
{

    
    /*
     当前借款总金额(元)
     */
    self.totalNumberLabel.text=[NSString stringWithFormat:@"%.2f",[[accountDic objectForKey:@"loan"] floatValue]];
    /*
     待还金额(元)
     */ //waitRepay
    self.amountNumberLabel.text=[NSString stringWithFormat:@"%.2f",[[data objectForKey:@"loanRepay"] floatValue]];
    /*
    近30天应还金额(元)
     */
    self.daysamountNumberLabel.text=[NSString stringWithFormat:@"%.2f",[[data objectForKey:@"thirty"] floatValue]];
    /*
     逾期金额(元)
     */
    self.WithinNumberLabel.text=[NSString stringWithFormat:@"%.2f",[[data objectForKey:@"overdue"] floatValue]];

    
}



@end
