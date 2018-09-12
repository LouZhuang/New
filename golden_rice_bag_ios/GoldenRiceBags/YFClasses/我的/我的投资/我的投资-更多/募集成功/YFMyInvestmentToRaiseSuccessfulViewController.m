//
//  YFMyInvestmentToRaiseSuccessfulViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFMyInvestmentToRaiseSuccessfulViewController.h"

@interface YFMyInvestmentToRaiseSuccessfulViewController ()<UITableViewDelegate,UITableViewDataSource>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;


@end

@implementation YFMyInvestmentToRaiseSuccessfulViewController
static NSString *cellId = @"YFMyInvestmentIsInTheFundraisingTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"投资详情";
    
    [self configuration];
    // Do any additional setup after loading the view.
}

-(void)configuration
{
    
    [self.view sd_addSubviews:@[self.YFTableView]];
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, YF_H(0))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(HEIGHT - 64-YF_H(49));
    
    
}


-(YFBaseTableView *)YFTableView
{
    if (!_YFTableView) {
        YFBaseTableView *tableView= [[YFBaseTableView alloc] init];
        tableView.separatorColor = LIGHTGREYCOLOR;
        tableView.delegate = self;
        tableView.tableFooterView=[UIView new];
        tableView.scrollEnabled=NO;
        tableView.dataSource =self;
        _YFTableView =tableView;
    }
    return _YFTableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
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
    
    return YF_H(50);
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }
    if (section==1) {
        return 3;
    }
    if (section==2) {
        return 4;
    }
    else{
        return 0;
    }
    
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFMyInvestmentIsInTheFundraisingTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFMyInvestmentIsInTheFundraisingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    [cell setterIndexSection:indexPath.section IndexPath:indexPath.row stateString:@"募集成功" MyInvestmentModel:self.model];
    
    return cell;
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section==0) {
        YFNormalFinancialDetailsViewController *YFFinancialDetailsVC=[[YFNormalFinancialDetailsViewController alloc]init];
        YFFinancialDetailsVC.listModel=self.model;
        YFFinancialDetailsVC.type=NO;
        if ([self.model.status integerValue]==0) {
            YFFinancialDetailsVC.type=YES;
        }
        [self.navigationController pushViewController:YFFinancialDetailsVC animated:YES];
    }
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



- (void)setIsCerditor:(BOOL)isCerditor
{
    _isCerditor = isCerditor;
    [self DataRequest];
}
-(void)DataRequest
{
    [YFMineRequest YFInvestmentDetailTypeString:self.model.id success:^(id json) {
        if ([YFTool Nsdic:json]==1) {
            
            
            self.model.reserve1 = json[@"data"][@"baseDetail"][@"reserve1"];
            [self.YFTableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
     
}
@end
