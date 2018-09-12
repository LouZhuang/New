//
//  YFAutomaticBidViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFAutomaticBidViewController.h"

@interface YFAutomaticBidViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;
/*
 确认开启
 */
@property(nonatomic,strong)UIButton *YFButton;

/*
 对比数据字典
 */
@property(nonatomic,strong)NSDictionary *CompareDataDic;

@end

@implementation YFAutomaticBidViewController
{
    NSString *keepBal;//最低保留金额
    
    NSString *amountMin;//最低投标金额
    NSString *amountMax;//最高投标金额
    
    NSString *investmentMin;//最低投资期限
    NSString *investmentMax;//最高投资
    
    NSString *rateMin;//最低年化利率
    NSString *rateMax;//最高年化利率
    
    NSInteger isFull;//余额全投 0不开启 1开启
    NSInteger isUse;//使用红包 0不用 1用
    NSInteger is_auto;//是否开启了自动投资  0位否 1位开启
     NSInteger isHas;//是否第一次 0为是 1为否
    NSInteger autoCount;//开启人数
    
}
static NSString *cellId = @"YFAutomaticBidSetion0TableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"自动投标";
    is_auto=0;
    isFull=0;
    isUse=0;
    isHas=0;
    [self configuration];
    
    /*
     数据请求
     */
    [self DataRequest];
    
    // Do any additional setup after loading the view.
}
-(void)configuration
{
    
    [self addNavigationItemWithTitles:@[@"规则说明"] isLeft:NO target:self action:@selector(rulesClick) tags:nil color:YF666];
    
    [self.view sd_addSubviews:@[self.YFTableView,self.YFButton]];
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, YF_H(0))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(HEIGHT - 64-YF_H(49));
    
    self.YFButton.sd_layout
    .bottomEqualToView(self.view)
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(YF_H(49));
}

-(void)rulesClick
{
//    [YFProgressHUD showInfoWithStatus:@"规则说明"];
    RHWebViewController *vc = [[RHWebViewController alloc]init];
    vc.title = @"自动投标规则说明";
    vc.pathUrl = [[NSBundle mainBundle]pathForResource:@"自动投标规则" ofType:@"html"];
    [self.navigationController pushViewController:vc animated:YES];
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
    if (section==1) {
        return YF_H(0);
    }
    if (section==2) {
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


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return YF_H(185);
    }
    if (indexPath.section==1) {
        if (indexPath.row==0 ||indexPath.row==1) {
            return YF_H(55);
        }
        if (indexPath.row==2) {
            return YF_H(36);
        }
        else{
            return 0;
        }
        
    }
    if (indexPath.section==2) {
        if (indexPath.row==0 ||indexPath.row==1||indexPath.row==2||indexPath.row==3) {
            return YF_H(50);
        }
        if (indexPath.row==4) {
            return YF_H(36);
        }
        else{
            return 0;
        }
    }
    else{
        return YF_H(0);
    }
    
    
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
        
        return 5;
    }
    else{
        return 0;
    }
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    YFAutomaticBidSetion0TableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFAutomaticBidSetion0TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    if (indexPath.section==0) {
        
        [cell setterUtilizationString:@"提高回收利用率\n最高15%预计年化收益率" stateType:is_auto];
        cell.openLabel.text = [NSString stringWithFormat:@"已有%ld人开启",autoCount];
        
    }
    if (indexPath.section==1) {
        
        [cell setterStion0:indexPath.row Type0:isFull Type1:isUse];
        [cell.SwitchButton addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    if (indexPath.section==2) {
        
        [cell setterStion1:indexPath.row string0:keepBal string1:amountMin string2:amountMax string3:investmentMin string4:investmentMax string5:rateMin string6:rateMax];
        [cell.leftTextField addTarget:self action:@selector(leftTextClick:) forControlEvents:UIControlEventEditingChanged];
        [cell.rightTextField addTarget:self action:@selector(rightTextClick:) forControlEvents:UIControlEventEditingChanged];
    }
    
    return cell;
    
}

-(void)switchAction:(UIButton *)sender
{
    if (sender.tag==0) {
        if (sender.selected==NO) {
            isFull=1;
        }
        if (sender.selected==YES) {
            isFull=0;
        }
        [_YFTableView reloadData];
        
    }
    if (sender.tag==1) {
        if (sender.selected==NO) {
            isUse=1;
        }
        if (sender.selected==YES) {
            isUse=0;
        }
        [_YFTableView reloadData];
    }
    [self CompareTheData];
}

-(void)leftTextClick:(UITextField *)sender
{
    if (sender.tag==1) {
        amountMin=sender.text;
    }
    if (sender.tag==2) {
        investmentMin=sender.text;
    }
    if (sender.tag==3) {
        rateMin=sender.text;
    }
    [self CompareTheData];
}
-(void)rightTextClick:(UITextField *)sender
{
    if (sender.tag==0) {
        keepBal=sender.text;
    }
    if (sender.tag==1) {
        amountMax=sender.text;
    }
    if (sender.tag==2) {
        investmentMax=sender.text;
    }
    if (sender.tag==3) {
        rateMax=sender.text;
        
    }
    
    [self CompareTheData];
    
}





-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}


-(UIButton *)YFButton
{
    if (!_YFButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(17);
        
        [button setTitle:@"确认开启" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(closeClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        _YFButton = button;
        
    }
    return _YFButton;
}
-(void)CompareTheData
{
    if (isHas==1) {
        
        /*
         关闭状态
         */
        if (is_auto==0) {
        
        if (isFull ==[[NSString stringWithFormat:@"%@",[self.CompareDataDic objectForKey:@"isFull"]] integerValue] &&isUse ==[[NSString stringWithFormat:@"%@",[self.CompareDataDic objectForKey:@"isUse"]] integerValue] && [keepBal isEqualToString:[NSString stringWithFormat:@"%@",[self.CompareDataDic objectForKey:@"keepBal"]]] && [amountMin isEqualToString:[NSString stringWithFormat:@"%@",[self.CompareDataDic objectForKey:@"amountMin"]]]&& [amountMax isEqualToString:[NSString stringWithFormat:@"%@",[self.CompareDataDic objectForKey:@"amountMax"]]]&& [investmentMin isEqualToString:[NSString stringWithFormat:@"%@",[self.CompareDataDic objectForKey:@"investmentMin"]]]&& [investmentMax isEqualToString:[NSString stringWithFormat:@"%@",[self.CompareDataDic objectForKey:@"investmentMax"]]]&& [rateMin isEqualToString:[NSString stringWithFormat:@"%@",[self.CompareDataDic objectForKey:@"rateMin"]]]&& [rateMax isEqualToString:[NSString stringWithFormat:@"%@",[self.CompareDataDic objectForKey:@"rateMax"]]]) {
            
            [self.YFButton setTitle:@"确认开启" forState:UIControlStateNormal];
            
        }
        else{
            [self.YFButton setTitle:@"保存更改" forState:UIControlStateNormal];
        }
            
        }
        /*
         开启状态
         */
        if (is_auto==1) {
            
            if (isFull ==[[NSString stringWithFormat:@"%@",[self.CompareDataDic objectForKey:@"isFull"]] integerValue] &&isUse ==[[NSString stringWithFormat:@"%@",[self.CompareDataDic objectForKey:@"isUse"]] integerValue] && [keepBal isEqualToString:[NSString stringWithFormat:@"%@",[self.CompareDataDic objectForKey:@"keepBal"]]] && [amountMin isEqualToString:[NSString stringWithFormat:@"%@",[self.CompareDataDic objectForKey:@"amountMin"]]]&& [amountMax isEqualToString:[NSString stringWithFormat:@"%@",[self.CompareDataDic objectForKey:@"amountMax"]]]&& [investmentMin isEqualToString:[NSString stringWithFormat:@"%@",[self.CompareDataDic objectForKey:@"investmentMin"]]]&& [investmentMax isEqualToString:[NSString stringWithFormat:@"%@",[self.CompareDataDic objectForKey:@"investmentMax"]]]&& [rateMin isEqualToString:[NSString stringWithFormat:@"%@",[self.CompareDataDic objectForKey:@"rateMin"]]]&& [rateMax isEqualToString:[NSString stringWithFormat:@"%@",[self.CompareDataDic objectForKey:@"rateMax"]]]) {
                
                [self.YFButton setTitle:@"确认关闭" forState:UIControlStateNormal];
                
            }
            else{
                [self.YFButton setTitle:@"保存更改" forState:UIControlStateNormal];
            }
            
        }
            
    }
    
}


/*
 获取自动投标策略
 */
-(void)DataRequest
{
    [YFMineRequest YFGetStrategySuccess:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            NSLog(@"2222 == %@",json);

            NSDictionary *dataDic=[json objectForKey:@"data"];
            autoCount = [dataDic[@"autoCount"] integerValue];
            is_auto=[[NSString stringWithFormat:@"%@",[dataDic objectForKey:@"isAuto"]] integerValue];
            isHas=[[NSString stringWithFormat:@"%@",[dataDic objectForKey:@"has"]] integerValue];
            if (isHas==1) {
                NSDictionary *detailDic=[dataDic objectForKey:@"detail"];
                self.CompareDataDic=[dataDic objectForKey:@"detail"];
                
                isFull=[[NSString stringWithFormat:@"%@",[detailDic objectForKey:@"isFull"]] integerValue];
                isUse=[[NSString stringWithFormat:@"%@",[detailDic objectForKey:@"isUse"]] integerValue];
                keepBal=[NSString stringWithFormat:@"%@",[detailDic objectForKey:@"keepBal"]];
                amountMin=[NSString stringWithFormat:@"%@",[detailDic objectForKey:@"amountMin"]];
                amountMax=[NSString stringWithFormat:@"%@",[detailDic objectForKey:@"amountMax"]];
                investmentMin=[NSString stringWithFormat:@"%@",[detailDic objectForKey:@"investmentMin"]];
                investmentMax=[NSString stringWithFormat:@"%@",[detailDic objectForKey:@"investmentMax"]];
                rateMin=[NSString stringWithFormat:@"%@",[detailDic objectForKey:@"rateMin"]];
                rateMax=[NSString stringWithFormat:@"%@",[detailDic objectForKey:@"rateMax"]];
                
                if (is_auto==1) {
                    [self.YFButton setTitle:@"确认关闭" forState:UIControlStateNormal];
                }
                
                
            }
            
            [self.YFTableView reloadData];
            
        }
        
    } failure:^(NSError *error) {
        
    }];
}




-(void)closeClick
{
    if (isHas==1) {
        if ([self.YFButton.titleLabel.text isEqualToString:@"确认关闭"]) {
           
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确认关闭自动投标吗?\n您的资金可能会站岗哦" message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *active = [UIAlertAction actionWithTitle:@"立即关闭" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                [self close];

            }];
            
            [alertController addAction: active];
            UIAlertAction *notice = [UIAlertAction actionWithTitle:@"再用看看" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:notice];
            
            [self presentViewController:alertController animated:YES completion:nil];
            
        }
        if ([self.YFButton.titleLabel.text isEqualToString:@"保存更改"]) {
          [self change];
        }
        if ([self.YFButton.titleLabel.text isEqualToString:@"确认开启"]) {
             [self open];
        }
  
    }
    if (isHas==0) {
    
        [self open];
    }
    
}

-(void)open
{
    if (keepBal.length==0||amountMin.length==0||amountMax.length==0||investmentMin.length==0||investmentMax.length==0||rateMin.length==0||rateMax.length==0)
    {
        [YFProgressHUD showInfoWithStatus:@"请完善信息"];
        
        return;
    }
    
    
    [YFSRFManager YFSrfSuccess:^(id json) {
        
        [self srfString:json];
        
    } failure:^(NSError *error) {
        
    }];

    
   
}

-(void)srfString:(NSString *)srfStr
{
    [YFProgressHUD showWithStatus:nil];
    
    [YFMineRequest YFIsFullString:isUse isUseString:isFull amountMinString:amountMin amountMaxString:amountMax keepBalString:keepBal investmentMinString:investmentMin investmentMaxString:investmentMax rateMinString:rateMin rateMaxString:rateMax srfString:srfStr success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            [YFProgressHUD showSuccessWithStatus:@"自动投标开启成功"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [self.navigationController popViewControllerAnimated:YES];
                
            });
            
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
        
        
    } failure:^(NSError *error) {
        
    }];

}

-(void)close
{
    [YFProgressHUD showWithStatus:nil];
    [YFMineRequest YFSetStrategyCloseSuccess:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            
            [YFProgressHUD showSuccessWithStatus:@"自动投标已关闭"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [self.navigationController popViewControllerAnimated:YES];
                
            });
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
    } failure:^(NSError *error) {
        
    }];
    
}

-(void)change
{
    if (keepBal.length==0||amountMin.length==0||amountMax.length==0||investmentMin.length==0||investmentMax.length==0||rateMin.length==0||rateMax.length==0)
    {
        [YFProgressHUD showInfoWithStatus:@"请完善信息"];
        
        return;
    }
    
    [YFSRFManager YFSrfSuccess:^(id json) {
        
        [self srfChangeString:json];
        
    } failure:^(NSError *error) {
        
    }];

    
    
}

-(void)srfChangeString:(NSString *)srfStr
{
    
    [YFProgressHUD showWithStatus:nil];
    
    [YFMineRequest YFSetStrategyIsFullString:isUse isUseString:isFull amountMinString:amountMin amountMaxString:amountMax keepBalString:keepBal investmentMinString:investmentMin investmentMaxString:investmentMax rateMinString:rateMin rateMaxString:rateMax srfString:srfStr success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            if (is_auto ==0) {
                [YFProgressHUD showSuccessWithStatus:@"自动投标修改成功"];
            }
            if (is_auto ==1) {
                [YFProgressHUD showSuccessWithStatus:@"自动投标修改成功"];
            }
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [self.navigationController popViewControllerAnimated:YES];
                
            });
            
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
        
        
    } failure:^(NSError *error) {
        
    }];
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

