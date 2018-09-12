//
//  YFNormalAndModelViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFNormalAndModelViewController.h"
#import "YFBorrowingInformationViewController.h"


#import "YFOnScheduleTableViewCell.h" //还款计划
@interface YFNormalAndModelViewController ()<UITableViewDelegate,UITableViewDataSource>
/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;
/*
 确定提前还款按钮
 */
@property (nonatomic, strong) NSDictionary *dataDic;
@property (nonatomic, strong) NSArray *repayEntitiesArr;//还款计划
@property(nonatomic,strong)UIButton *YFButton;
@property (nonatomic, assign) BOOL isPlan;//是否点击还款计划

@end

@implementation YFNormalAndModelViewController
static NSString *cellId = @"YFNormalAndModelTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self configuration];
    // Do any additional setup after loading the view.
    [self DataRequest];
}


-(void)configuration
{
    [self.view sd_addSubviews:@[self.YFTableView,self.YFButton]];
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, 0)
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(HEIGHT -64-YF_H(49));
    
    self.YFButton.sd_layout
    .bottomEqualToView(self.view)
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(YF_H(49));
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
    if (![self.dataDic allKeys].count) {
        return 0;
    }
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section!=2) {
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
    
    if (indexPath.section ==0) {
        
        return YF_H(80);
    }
    if (indexPath.section ==1) {
        if (indexPath.row <= 7) {
            return YF_H(45);
        }
        
        return YF_H(80);
    }
    if (indexPath.section ==2) {
        
        return YF_H(90);
    }
    if (indexPath.section ==3) {
        if (indexPath.row == 0) {
            return YF_H(45);
        }
        else{
         return YF_H(29);
        }
        
    }
    else{
        return 0;
    }
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==0) {
        return 1;
    }
    if (section ==1) {
        if (self.isPlan) {
            return  8 + self.repayEntitiesArr.count;
        }
        return 8;
    }
    if (section ==2) {
        return 0;
    }
    if (section ==3) {
        return 5;
    }
    else{
        return 0;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFNormalAndModelTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFNormalAndModelTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    if (indexPath.section == 0) {
      
       [cell setterIndexRow:indexPath.row numberString:self.dataDic[@"loanDetail"][@"loanAmount"]];
          return cell;
    }
    if (indexPath.section == 1) {
        
        if (indexPath.row <= 7) {
          
            //        [cell setterIndexRow:indexPath.row modelArray:@[@"CZ000123000",@"2018-03-01",@"20日",@"83天",@"一次性还本付息",@"9.3%",@"查看",@""]];
            [cell setterIndexRow:indexPath.row modelArray:@[self.dataDic[@"loanDetail"][@"loanNo"],
                                                            [YFTool timeWithTimeIntervalString:[NSString stringWithFormat:@"%@",self.dataDic[@"repayEntities"][0][@"createTime"]] Format:@"yyyy-MM-dd"],
                                                            [YFTool timeWithTimeIntervalString:[NSString stringWithFormat:@"%@",self.dataDic[@"repayEntities"][0][@"repayDate"]] Format:@"dd"],
                                                            @"一次性还本付息",
                                                            [NSString stringWithFormat:@"%d期",[self.dataDic[@"loanDetail"][@"loanDays"] intValue]],
                                                            
                                                            [NSString stringWithFormat:@"%.2f%%",[self.dataDic[@"loanDetail"][@"rateOfYear"] floatValue]],
                                                            @"查看",@""]];
            [cell.toViewButton addTarget:self action:@selector(toViewClick) forControlEvents:UIControlEventTouchUpInside];
            
        }else{
            YFOnScheduleTableViewCell *cellPlan = [tableView dequeueReusableCellWithIdentifier:@"YFOnScheduleTableViewCell"];
            if (cellPlan == nil) {
                cellPlan = [[YFOnScheduleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"YFOnScheduleTableViewCell"];
            }
            
            [cellPlan indexPath:indexPath.row andDic:self.repayEntitiesArr[indexPath.row - 8]];
            return cellPlan;
        }

    }
    
    if (indexPath.section == 3) {
     
//        dic[@"principal"] floatValue],[dic[@"interest"] floatValue],[dic[@"poundage
        [cell setterIndexRow:indexPath.row sectioTwomodelArray:@[[NSString stringWithFormat:@"%@元",self.dataDic[@"total"]],[NSString stringWithFormat:@"%@元",self.dataDic[@"principal"]],[NSString stringWithFormat:@"%@元",self.dataDic[@"interest"]],[NSString stringWithFormat:@"%@元",self.dataDic[@"overduefee"]],[NSString stringWithFormat:@"%@元",self.dataDic[@"poundage"]]]];
        
    }

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section == 1  && indexPath.row == 7 && self.repayEntitiesArr.count > 0) {
        self.isPlan = !self.isPlan;
        NSIndexSet *indexSet = [[NSIndexSet alloc]initWithIndex:1];
        [self.YFTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationNone];
    }
   
    
}
-(void)toViewClick
{
//    [YFProgressHUD showInfoWithStatus:@"查看"];
    if (![self.dataDic[@"loanDetail"][@"contract"] isEqualToString:@"NOSIGN"]) {
        RHWebViewController *vc = [[RHWebViewController alloc]init];
        vc.webUrl = self.dataDic[@"loanDetail"][@"contract"];
        vc.title = @"金米袋网借款协议";
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        [YFProgressHUD showInfoWithStatus:@"未签署借款合同"];
    }
}


-(UIButton *)YFButton
{
    if (!_YFButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitle:@"再借一笔" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(17);
        [button addTarget:self action:@selector(closeClick) forControlEvents:UIControlEventTouchUpInside];
        _YFButton = button;
        
    }
    return _YFButton;
}

-(void)closeClick
{
//    [YFProgressHUD showInfoWithStatus:@"再借一笔"];
    YFBorrowingInformationViewController *YFBorrowingInformationVC=[[YFBorrowingInformationViewController alloc]init];
    [self.navigationController pushViewController:YFBorrowingInformationVC animated:YES];
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

/*
 数据请求
 */
-(void)DataRequest
{
    
    
    [YFMineRequest YFUidString:self.mineBorrowModel.id success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            
            NSLog(@"23232 == %@",json);
            self.dataDic = json[@"data"];
            self.repayEntitiesArr = json[@"data"][@"repayEntities"];
            [self.YFTableView reloadData];
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
        
    } failure:^(NSError *error) {
        
    }];
    
}
- (NSDictionary *)dataDic
{
    if (_dataDic == nil) {
        _dataDic = [NSDictionary dictionary];
    }
    return _dataDic;
}
- (NSArray *)repayEntitiesArr
{
    if (_repayEntitiesArr == nil) {
        _repayEntitiesArr = [NSArray array];
    }
    return _repayEntitiesArr;
}
@end
