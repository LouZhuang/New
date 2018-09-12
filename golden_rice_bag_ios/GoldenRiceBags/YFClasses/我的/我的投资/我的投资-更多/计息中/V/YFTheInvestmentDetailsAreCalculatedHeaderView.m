//
//  YFTheInvestmentDetailsAreCalculatedHeaderView.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFTheInvestmentDetailsAreCalculatedHeaderView.h"
#import "YFNormalFinancialDetailsViewController.h"

@implementation YFTheInvestmentDetailsAreCalculatedHeaderView
static NSString *cellId = @"YFHeaderViewTableViewCell";
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        [self configuration];
        
    }
    return self;
}

-(void)configuration
{
    [self sd_addSubviews:@[self.YFTableView]];
    
    self.YFTableView.sd_layout
    .topSpaceToView(self, YF_H(0))
    .leftSpaceToView(self, 0)
    .widthIs(WIDTH)
    .heightIs(YF_H(598));
    
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
    if (self.model != nil) {
        return 4;
    }
    return 0;
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
        return 7;
    }
    else{
        return 0;
    }
    
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFHeaderViewTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFHeaderViewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    [cell setterIndexSectioned:indexPath.section IndexPath:indexPath.row HomePageModel:self.model];
    
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
        [[YFTool getCurrentVC].navigationController pushViewController:YFFinancialDetailsVC animated:YES];
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


-(void)setModel:(YFHomePageModel *)model
{
    _model = model;
    [self.YFTableView reloadData];
}

@end
