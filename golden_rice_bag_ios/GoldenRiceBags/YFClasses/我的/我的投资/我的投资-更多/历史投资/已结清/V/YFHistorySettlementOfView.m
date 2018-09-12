//
//  YFHistorySettlementOfView.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFHistorySettlementOfView.h"
#import "YFMineRequest.h"
#import "YFNormalFinancialDetailsViewController.h"
@implementation YFHistorySettlementOfView

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
    
   
    if (self.isZhuanRangED) {
        self.YFTableView.sd_layout
        .topSpaceToView(self, YF_H(0))
        .leftSpaceToView(self, 0)
        .widthIs(WIDTH)

        .heightIs(YF_H(540));
    }else{
        self.YFTableView.sd_layout
        .topSpaceToView(self, YF_H(0))
        .leftSpaceToView(self, 0)
        .widthIs(WIDTH)
        
        .heightIs(YF_H(490));
    }
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
  
    return 4;
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
        if (self.isZhuanRangED) {
            return 6;
        }
        return 5;
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
    
    if (self.isZhuanRangED) {
        [cell setterIndexSection:indexPath.section IndexPath:indexPath.row HomePageModel:self.model];

    }else{
        [cell setterHistoryIndexSection:indexPath.section IndexPath:indexPath.row HomePageModel:self.model];

    }
    return cell;
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section == 0 &&indexPath.row == 0) {
        YFNormalFinancialDetailsViewController *YFFinancialDetailsVC=[[YFNormalFinancialDetailsViewController alloc]init];
        YFFinancialDetailsVC.listModel=self.model;
        YFFinancialDetailsVC.typeId = YFNormalFinancialDetailsViewControllerTypeMyList;
        YFFinancialDetailsVC.type = [self.model.residue integerValue] == 0 ?NO:YES;
        if ([self.model.status integerValue]==0) {
            YFFinancialDetailsVC.type=YES;
        }
        [[YFTool getCurrentVC].navigationController pushViewController:YFFinancialDetailsVC animated:YES];
    }
   

}

- (void)setModel:(YFHomePageModel *)model
{
    _model = model;
}
- (void)setIsZhuanRangED:(BOOL)isZhuanRangED
{
    _isZhuanRangED = isZhuanRangED;
        [self configuration];
}


@end
