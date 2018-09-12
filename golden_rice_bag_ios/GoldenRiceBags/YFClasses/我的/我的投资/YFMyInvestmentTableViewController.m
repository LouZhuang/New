//
//  YFMyInvestmentTableViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFMyInvestmentTableViewController.h"

@interface YFMyInvestmentTableViewController ()
/*
 data数组
 */
@property(nonatomic,strong)NSMutableArray *YFDataArray;

/*
 债权转让数组
 */
@property(nonatomic,strong)NSMutableArray *YFTransferArray;
@end

@implementation YFMyInvestmentTableViewController
{
    NSInteger is_auto;//是否开启了自动投资  0位否 1位开启
    NSString *tztotalCount;//投资 0为没有数据
    NSString *totalCount;//债权转让 0为没有数据
}

static NSString *cellId = @"YFMineInvestmentTableViewCell";
static NSString *cellAutomaticBidId = @"YFAutomaticBidTableViewCell";
static NSString *cellCreditorId = @"YFMineCreditorsRightsTransferTableViewCell";

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
    is_auto=0;
    totalCount=@"0";
    tztotalCount=@"0";
    [self configuration];
    self.tableView.separatorColor = WHITECOLOR;
    self.tableView.tableFooterView =[UIView new];
    [self.tableView setTableHeaderView:self.headerView];
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellid"];
}


-(NSMutableArray *)YFDataArray
{
    if (!_YFDataArray) {
        _YFDataArray=[NSMutableArray array];
    }
    return _YFDataArray;
}

-(NSMutableArray *)YFTransferArray
{
    if (!_YFTransferArray) {
        _YFTransferArray=[NSMutableArray array];
    }
    return _YFTransferArray;
}
-(void)configuration
{
    [self.view sd_addSubviews:@[self.headerView]];
    
    self.headerView.sd_layout
    .topEqualToView(self.view)
    .leftEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(140));
    
    
    [self.headerView sd_addSubviews:@[self.threeLabel,self.investmentAmountLabel,self.deferredPrincipalLabel,self.accumulatedEarningsLabel,self.threeview]];
    
    self.investmentAmountLabel.sd_layout
    .topSpaceToView(self.headerView, YF_H(5))
    .rightSpaceToView(self.headerView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(44));
    
    self.deferredPrincipalLabel.sd_layout
    .topSpaceToView(self.investmentAmountLabel, YF_H(1))
    .rightSpaceToView(self.headerView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(44));
    
    self.accumulatedEarningsLabel.sd_layout
    .topSpaceToView(self.deferredPrincipalLabel, YF_H(1))
    .rightSpaceToView(self.headerView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(44));

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


-(UILabel *)investmentAmountLabel
{
    if (!_investmentAmountLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textColor =ZHUTICOLOR;
        label.text =@"0.00";
        label.textAlignment=NSTextAlignmentRight;
        _investmentAmountLabel = label;
    }
    return _investmentAmountLabel;
}


-(UILabel *)deferredPrincipalLabel
{
    if (!_deferredPrincipalLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textAlignment=NSTextAlignmentRight;
        label.textColor =ZHUTICOLOR;
        label.text =@"0.00";
        _deferredPrincipalLabel = label;
    }
    return _deferredPrincipalLabel;
}


-(UILabel *)accumulatedEarningsLabel
{
    if (!_accumulatedEarningsLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textAlignment=NSTextAlignmentRight;
        label.textColor =ZHUTICOLOR;
        label.text =@"0.00";
        _accumulatedEarningsLabel = label;
    }
    return _accumulatedEarningsLabel;
}


-(UILabel *)threeLabel
{
    if (!_threeLabel) {
        NSArray *array=@[@"当前在投项目(个)",@"预估待收金额(元)",@"历史数据预估收益(元)"];
        for (NSInteger i =0; i < 3; i ++) {
            UILabel *label =[[UILabel alloc] init];
            label.frame = CGRectMake(YF_W(14), YF_H(5) +i*YF_H(45), YF_W(150), YF_H(45));
            label.font = YF_FONT(14);
            label.textColor =YF999;
            label.text =[array objectAtIndex:i];
            _threeLabel = label;
            [self.headerView addSubview:_threeLabel];
        }
       
    }
    return _threeLabel;
}


-(UIImageView *)threeview
{
    if (!_threeview) {
        for (NSInteger i =0; i < 3; i ++) {
            UIImageView *imageView =[[UIImageView alloc] init];
            imageView.frame = CGRectMake(YF_W(14), YF_H(49) +i*YF_H(45),WIDTH - YF_W(28), YF_H(1));
            imageView.image=[UIImage imageNamed:@"xuxianImage"];
            _threeview = imageView;
            [self.headerView addSubview:_threeview];
        }
        
    }
    return _threeview;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==0) {
      return YF_H(244);
    }
    if (indexPath.row==1) {
        return YF_H(213);
    }
    if (indexPath.row==2) {
        return YF_H(279);
    }
    else{
        return 0;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row==0) {
        YFMineInvestmentTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell == nil) {
            cell = [[YFMineInvestmentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            
        }
        
         [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        if (self.YFDataArray.count >0) {
            YFHomePageModel *model=[self.YFDataArray objectAtIndex:0];
            [cell setterMyInvestmentModel:model totalCountString:tztotalCount];
        }
        
      
        
        return cell;
    }
    if (indexPath.row==1) {
        YFMineCreditorsRightsTransferTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell == nil) {
            cell = [[YFMineCreditorsRightsTransferTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellCreditorId];
            
        }
         [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
       
        if (self.YFTransferArray.count >0) {
            YFHomePageModel *model=[self.YFTransferArray objectAtIndex:0];
            [cell setterHomePageModel:model totalCountString:totalCount];
        }
       
        
        return cell;
    }
    if (indexPath.row==2) {
        YFAutomaticBidTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell == nil) {
            cell = [[YFAutomaticBidTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellAutomaticBidId];
            
        }
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell setterUtilizationString:@"提高回收利用率\n最高15%预计年化收益率" stateType:is_auto];
        
        return cell;
    }
    else{
        return nil;
    }
    
   
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    if (indexPath.row==0&&self.YFDataArray.count >0) {
        YFHomePageModel *model=[self.YFDataArray objectAtIndex:0];
//        NSLog(@"23232 == %@",model.status);

        if ([model.status integerValue] ==0) {
            YFMyInvestmentIsInTheFundraisingViewController *YFMyInvestmentIsInTheFundraisingVC=[[YFMyInvestmentIsInTheFundraisingViewController alloc]init];
            YFMyInvestmentIsInTheFundraisingVC.model=model;
            [[YFTool getCurrentVC].navigationController pushViewController:YFMyInvestmentIsInTheFundraisingVC animated:YES];
        }
        if ([model.status integerValue]==1) {
            YFMyInvestmentToRaiseSuccessfulViewController *YFMyInvestmentIsInTheFundraisingVC=[[YFMyInvestmentToRaiseSuccessfulViewController alloc]init];
            YFMyInvestmentIsInTheFundraisingVC.model=model;
            [[YFTool getCurrentVC].navigationController pushViewController:YFMyInvestmentIsInTheFundraisingVC animated:YES];
        }
        if ([model.status integerValue]==2) {
            YFTheInvestmentDetailsAreCalculatedViewController *YFMyInvestmentIsInTheFundraisingVC=[[YFTheInvestmentDetailsAreCalculatedViewController alloc]init];
            YFMyInvestmentIsInTheFundraisingVC.model = model;
            [[YFTool getCurrentVC].navigationController pushViewController:YFMyInvestmentIsInTheFundraisingVC animated:YES];
        }
        if ([model.status integerValue]==5) {
            YFMyInvestmentMoreHistoryClosedViewController *YFMyInvestmentIsInTheFundraisingVC=[[YFMyInvestmentMoreHistoryClosedViewController alloc]init];
            YFMyInvestmentIsInTheFundraisingVC.model=model;
            [[YFTool getCurrentVC].navigationController pushViewController:YFMyInvestmentIsInTheFundraisingVC animated:YES];
        }

        
    }else if (indexPath.row==1&&self.YFDataArray.count >0)
    {
         YFHomePageModel *model=[self.YFDataArray objectAtIndex:0];
//         *YFMyInvestmentIsInTheFundraisingVC=[[YFMyInvestmentMoreHistorySettlementOfViewController alloc]init];
//        YFMyInvestmentIsInTheFundraisingVC.model = model;
//        [self.navigationController pushViewController:YFMyInvestmentIsInTheFundraisingVC animated:YES];
        
        YFMyInvestmentMoreHistorySettlementOfViewController *YFMyInvestmentIsInTheFundraisingVC=[[YFMyInvestmentMoreHistorySettlementOfViewController alloc]init];
        YFMyInvestmentIsInTheFundraisingVC.model=model;
        [[YFTool getCurrentVC].navigationController pushViewController:YFMyInvestmentIsInTheFundraisingVC animated:YES];
    }
}



/*
 数据请求
 */
-(void)DataRequest
{
    [YFMineRequest YFPageNumString:@"1" PageSizeString:@"10" success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            
            NSLog(@"66666 == %@",json);
            NSDictionary *dic=[json objectForKey:@"data"];
            NSDictionary *accountDic=[dic objectForKey:@"account"];
            
            is_auto=[[dic objectForKey:@"is_auto"] integerValue];
            NSDictionary *loantDic=[dic objectForKey:@"investment"];
            tztotalCount =[NSString stringWithFormat:@"%@",[loantDic objectForKey:@"totalCount"]];
          
            if ([tztotalCount integerValue] >0) {
                if (![loantDic[@"obj"] isKindOfClass:[NSNull class]]) {
                    [self.YFDataArray removeAllObjects];
                    NSDictionary *objDic=[loantDic objectForKey:@"obj"];
                    YFHomePageModel *model=[[YFHomePageModel alloc] init];
                    [model setValuesForKeysWithDictionary:objDic];
                    [self.YFDataArray addObject:model];
                }
               
            }
             NSDictionary *projectDic=[dic objectForKey:@"project"];
            totalCount =[NSString stringWithFormat:@"%@",[projectDic objectForKey:@"totalCount"]];
            
            if ([totalCount integerValue]>0) {
                [self.YFTransferArray removeAllObjects];
                NSDictionary *objDic=[projectDic objectForKey:@"obj"][@"project"];
                YFHomePageModel *model=[[YFHomePageModel alloc] init];
                [model setValuesForKeysWithDictionary:objDic];
//                 [model setValuesForKeysWithDictionary:projectDic];
                [self.YFTransferArray addObject:model];
            }
            
            [self.tableView reloadData];
            /*
             数据刷新
             */
            [self dataAssignment:accountDic dataDic:dic];
            
            
        }
        
    } failure:^(NSError *error) {
        
    }];
}

-(void)dataAssignment:(NSDictionary *)accountDic dataDic:(NSDictionary *)data
{
    
    /*
     当前在投项目(个)
     */
    self.investmentAmountLabel.text=[NSString stringWithFormat:@"%.0f",[[data objectForKey:@"under_investment"] floatValue]];
    /*
     预估待收金额(元)
     */
    self.deferredPrincipalLabel.text=[NSString stringWithFormat:@"%.2f",[[accountDic objectForKey:@"investment"] floatValue]];
    /*
    历史数据预估收益(元)
     */
    self.accumulatedEarningsLabel.text=[NSString stringWithFormat:@"%.2f",[[data objectForKey:@"wait_return"] floatValue]];

    
}









@end
