//
//  YFNormalRepaymentViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFNormalRepaymentViewController.h"

@interface YFNormalRepaymentViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate>
/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;
@property (nonatomic, strong) NSDictionary *dataDic;
@end

@implementation YFNormalRepaymentViewController

static NSString *cellId = @"YFNormalRepaymentTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"正常还款中";
  
    // Do any additional setup after loading the view.
    [self DataRequest];
}

-(void)configuration
{
    [self.view sd_addSubviews:@[self.YFTableView]];
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, 0)
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(HEIGHT -64);
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
    if (self.dataDic == nil) {
        return 0;
    }
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
    
    if (indexPath.section ==0) {
        
        return YF_H(80);
    }
    if (indexPath.section ==1) {
        
        return YF_H(69);
    }
    if (indexPath.section ==2) {
        
        return YF_H(45);
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
        return 2;
    }
    if (section ==2) {
        return 6;
    }
    else{
        return 0;
    }
   
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFNormalRepaymentTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFNormalRepaymentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    
    if (indexPath.section==0) {
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell setterIndexRow:indexPath.row numberString:self.dataDic[@"loanDetail"][@"loanAmount"]];
    }
    if (indexPath.section==1) {
        
        if (indexPath.row==0) {
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell setterIndexRow:indexPath.row totalString:[NSString stringWithFormat:@"共%d笔",[self.dataDic[@"residue"] intValue]]];
    }
    if (indexPath.section==2) {
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell setterIndexRow:indexPath.row modelArray:@[self.dataDic[@"loanDetail"][@"loanNo"],
                                                 [YFTool timeWithTimeIntervalString:[NSString stringWithFormat:@"%@",self.dataDic[@"repayEntities"][0][@"createTime"]] Format:@"yyyy-MM-dd"],
                                                 [YFTool timeWithTimeIntervalString:[NSString stringWithFormat:@"%@",self.dataDic[@"repayEntities"][0][@"repayDate"]] Format:@"dd"],
                                                 [NSString stringWithFormat:@"%d个月",[self.dataDic[@"loanDetail"][@"loanDays"] intValue]],
                                                 [NSString stringWithFormat:@"%.2f%%",[self.dataDic[@"loanDetail"][@"rateOfYear"] floatValue]],
                                                 @"查看"]];
        if (indexPath.row == 5) {
            [cell.toViewButton addTarget:self action:@selector(toViewClick) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section==1) {
        if (indexPath.row==0) {
            YFRepaymentViewController *YFRepaymentVC=[[YFRepaymentViewController alloc]init];
            YFRepaymentVC.mineBorrowModel = self.mineBorrowModel;
            [self.navigationController pushViewController:YFRepaymentVC animated:YES];
        }
        
        if (indexPath.row==1) {
            YFOnScheduleViewController *YFOnScheduleVc=[[YFOnScheduleViewController alloc] init];
         
             YFOnScheduleVc.dataArr = self.dataDic[@"repayEntities"];
               double money = 0;
            for (NSDictionary *dic in  YFOnScheduleVc.dataArr) {
                if ([dic[@"status"] integerValue] == 0 || [dic[@"status"] integerValue] == 2) {
                    money+= [dic[@"total"] doubleValue];
                }
            }
            YFOnScheduleVc.totalMoney = [NSString stringWithFormat:@"%.2f",money];
           
            [self.navigationController pushViewController:YFOnScheduleVc animated:YES];
        }
    }
}
-(void)toViewClick
{
    //创建actionSheet对象
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"借款协议", nil];
    //actionSheet样式
    sheet.actionSheetStyle = UIActionSheetStyleAutomatic;
    //显示
    [sheet showInView:self.view];
    sheet.delegate = self;
}

//actionSheet代理方法
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        if (![self.dataDic[@"loanDetail"][@"contract"] isEqualToString:@"NOSIGN"]) {
            RHWebViewController *vc = [[RHWebViewController alloc]init];
            vc.webUrl = self.dataDic[@"loanDetail"][@"contract"];
            vc.title = @"金米袋网借款协议";
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            [YFProgressHUD showInfoWithStatus:@"未签署借款合同"];
        }
    }
  
    if (buttonIndex == 2) {
        NSLog(@"点击取消");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
            [self configuration];
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
@end
