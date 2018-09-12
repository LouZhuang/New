//
//  YFInTheLateViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFInTheLateViewController.h"

@interface YFInTheLateViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate>
/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

/*
 确定提前还款按钮
 */
@property(nonatomic,strong)UIButton *YFButton;

@property (nonatomic, strong) NSDictionary *dataDic;
@end

@implementation YFInTheLateViewController

static NSString *cellId = @"YFNormalRepaymentTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"已逾期";
    [self DataRequest];
//    [self configuration];
    // Do any additional setup after loading the view.
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
        return 9;
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
        [cell setterTimeOutIndexRow:indexPath.row numberString:self.dataDic[@"loanDetail"][@"loanAmount"]];
    }
    if (indexPath.section==1) {
        
        if (indexPath.row==0) {
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        NSInteger count = 0;
        for (NSDictionary *dic in  self.dataDic[@"repayEntities"]) {
            if ([dic[@"status"] integerValue] == 0 || [dic[@"status"] integerValue] == 2) {
                count ++;
            }
        }
        [cell setterTimeOutIndexRow:indexPath.row totalString:[NSString stringWithFormat:@"共%ld笔",count]];
    }
    if (indexPath.section==2) {
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        

        NSString *str = @"";
        switch ([self.dataDic[@"loanDetail"][@"returnType"] integerValue]) {
            case 1:
            {
                str =@"等额本息";
            }
                break;
                
            case 2:
            {
                str =@"先息后本";
            }
                break;
            case 3:
            {
                str =@"一次性还本付息";
            }
                break;
            default:
                break;
        }
        [cell setterTimeOutIndexRow:indexPath.row modelArray:@[self.dataDic[@"loanDetail"][@"loanNo"],
                                                               [YFTool timeWithTimeIntervalString:self.dataDic[@"repayEntities"][0][@"createTime"] Format:@"yyyy-MM-dd"],
                                                                [NSString stringWithFormat:@"%@日",[YFTool timeWithTimeIntervalString:self.dataDic[@"repayEntities"][0][@"repayDate"] Format:@"dd"]],
                                                                 [NSString stringWithFormat:@"%d期",[self.dataDic[@"loanDetail"][@"loanDays"] intValue]],
                                                               str,
                                                                [NSString stringWithFormat:@"%.2f%%",[self.dataDic[@"loanDetail"][@"rateOfYear"] floatValue]],
                                                               @"查看",
                                                               [NSString stringWithFormat:@"%d天",[self.dataDic[@"overdue_day"] intValue]],
                                                                [NSString stringWithFormat:@"%.2f费用",[self.dataDic[@"overdue_fee"] floatValue]]]];
        if (indexPath.row == 6) {
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

-(UIButton *)YFButton
{
    if (!_YFButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitle:@"立即还款" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(17);
        [button addTarget:self action:@selector(closeClick) forControlEvents:UIControlEventTouchUpInside];
        _YFButton = button;
        
    }
    return _YFButton;
}

-(void)closeClick
{
    [YFLoginRequest YFSrfSuccess:^(id json) {
        [self submitData:json[@"data"][0][@"srf"]];
    } failure:^(NSError *error) {
        
    }];
    
    
}

- (void)submitData:(NSString *)srf
{
    [YFMineRequest YFAheadRepayUidStringYuqi:self.mineBorrowModel.id andStr:srf success:^(id json) {
        if ([YFTool Nsdic:json]==1) {
            
            NSLog(@"23232 == %@",json);
            [YFProgressHUD showSuccessWithStatus:@"申请已提交，还款结果以通知为准"];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
    } failure:^(NSError *error) {
        [YFProgressHUD showSuccessWithStatus:@"申请提交失败，请重新提交"];
    }];
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

@end
