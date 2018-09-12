//
//  YFCapitalSubsidiaryDetailViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/24.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFCapitalSubsidiaryDetailViewController.h"
#define YFMineTittle1 @[@"交易时间",@"交易流水号",@"投资订单号",@"交易金额"]

#define YFMineTittle3 @[@"交易流水号",@"订单编号",@"交易金额"]

@interface YFCapitalSubsidiaryDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

/*
 
 */
@property(nonatomic,strong)NSMutableArray *YFDetailArray;

@end

@implementation YFCapitalSubsidiaryDetailViewController
static NSString *cellId = @"YFCapitalSubsidiaryDetailTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=[NSString stringWithFormat:@"%@明细",_type];
    
    if ([_detailModel.type integerValue] ==3||[_detailModel.type integerValue] ==4||[_detailModel.type integerValue] ==5||[_detailModel.type integerValue] ==8||[_detailModel.type integerValue] ==9||[_detailModel.type integerValue] ==1 ||[_detailModel.type integerValue] ==2) {
        
        [self.YFDetailArray addObject:[YFTool timeWithTimeIntervalString:_detailModel.createTime Format:@"YYYY-MM-dd HH:mm:ss"]];
         [self.YFDetailArray addObject:_detailModel.tradingFlow];
        [self.YFDetailArray addObject:_detailModel.tradeNo];
        [self.YFDetailArray addObject:[NSString stringWithFormat:@"%@元",_detailModel.tradeAmount]];
        
    }else{
        [self.YFDetailArray addObject:_detailModel.tradingFlow];
        [self.YFDetailArray addObject:_detailModel.tradeNo];
        [self.YFDetailArray addObject:[NSString stringWithFormat:@"%@元",_detailModel.tradeAmount]];
        
    }

    
    
     [self configuration];
    self.view.backgroundColor=WHITECOLOR;
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

-(NSMutableArray *)YFDetailArray
{
    if (!_YFDetailArray) {
        _YFDetailArray=[NSMutableArray array];
    }
    return _YFDetailArray;
}


-(YFBaseTableView *)YFTableView
{
    if (!_YFTableView) {
        YFBaseTableView *tableView= [[YFBaseTableView alloc] init];
        tableView.separatorColor = LIGHTGREYCOLOR;
        tableView.tableFooterView = [UIView new];
        tableView.scrollEnabled=NO;
        tableView.delegate = self;
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
    
    if (section==0) {
      return YF_H(10);
    }
    else{
        return 0;
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
    if (indexPath.section==0) {
       return YF_H(80);
    }
    if (indexPath.section==1) {
      return YF_H(40);
    }
    if (indexPath.section==2) {
      return YF_H(80);
    }
    else{
        return 0;
    }
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }
    if (section==1) {
        if ([_detailModel.type integerValue] ==6||[_detailModel.type integerValue] ==7) {
            return 3;
        }
        else{
        return 4;
        }
    }
    if (section==2) {
        return 1;
    }
    else{
    return 0;
    }
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFCapitalSubsidiaryDetailTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFCapitalSubsidiaryDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    


     if ([_detailModel.type integerValue] ==3||[_detailModel.type integerValue] ==4||[_detailModel.type integerValue] ==5||[_detailModel.type integerValue] ==8||[_detailModel.type integerValue] ==9||[_detailModel.type integerValue] ==1||[_detailModel.type integerValue] ==2) {
        [cell setterIndexRow:indexPath.row indexSection:indexPath.section totalString:_type tittleString:[YFMineTittle1 objectAtIndex:indexPath.row] contentString:[self.YFDetailArray objectAtIndex:indexPath.row] models:self.detailModel];
    }
     if ([_detailModel.type integerValue] ==6||[_detailModel.type integerValue] ==7) {
        [cell setterTwoIndexRow:indexPath.row indexSection:indexPath.section totalString:_type tittleString:[YFMineTittle3 objectAtIndex:indexPath.row] contentString:[self.YFDetailArray objectAtIndex:indexPath.row] models:self.detailModel];
    }


    
    return cell;
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    
    
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
