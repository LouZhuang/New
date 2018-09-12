//
//  YFTopUpViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFTopUpViewController.h"

@interface YFTopUpViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,JHPickerDelegate>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;
/*
 确定支付按钮
 */
@property(nonatomic,strong)UIButton *YFButton;
@end

@implementation YFTopUpViewController
{
    BOOL isHaveDian;
    NSString *textfield;//
//    NSString *poudg;//手续费
//     NSString *total;//总共
    NSString *type;//充值类型
    NSString *payType;//支付方式
    NSString *bankCard;//银行卡号
}
static NSString *cellId = @"YFTopUpTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"充值";
    textfield=@"";
//    poudg=@"0";
//    total=@"0";
    type=@"投资账户";
    bankCard=@"";
    payType=@"";
     [self configuration];
     [self DataRequest:@"1"];
    // Do any additional setup after loading the view.
}


-(void)configuration
{
    
    [self addNavigationItemWithTitles:@[@"明细"] isLeft:NO target:self action:@selector(detali) tags:nil color:YF666];
    
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

-(void)detali
{
    YFTopUpDetailViewController *YFTopUpDetailVC=[[YFTopUpDetailViewController alloc] init];
    [self.navigationController pushViewController:YFTopUpDetailVC animated:YES];
}


-(YFBaseTableView *)YFTableView
{
    if (!_YFTableView) {
        YFBaseTableView *tableView= [[YFBaseTableView alloc] init];
        tableView.separatorColor = LIGHTGREYCOLOR;
        tableView.tableFooterView = [UIView new];
        tableView.delegate = self;
        tableView.scrollEnabled=NO;
        tableView.dataSource =self;
        _YFTableView =tableView;
    }
    return _YFTableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
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
    if (indexPath.section==0) {
       return YF_H(50);
    }
//    if (indexPath.section==1) {
//        return YF_H(45);
//    }
    if (indexPath.section==1) {
        return YF_H(50);
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
//    if (section==1) {
//        return 2;
//    }
    if (section==1) {
        return 3;
    }
    else{
    return 0;
    }
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFTopUpTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFTopUpTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    [cell setterIndexPath:indexPath.row IndexSection:indexPath.section  textString:textfield BankCardNumberString:bankCard typeString:type payTypeString:payType];
    [cell.YFtextField addTarget:self action:@selector(numberClick:) forControlEvents:UIControlEventEditingChanged];
    cell.YFtextField.delegate=self;
    
    [cell.changeButton addTarget:self action:@selector(changeClick) forControlEvents:UIControlEventTouchUpInside];
    [cell.changeTypeButton addTarget:self action:@selector(changeTypeClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
    
}
-(void)changeClick
{
    YFMineBnakCardAllViewController *YFMineBnakCardAllVC=[[YFMineBnakCardAllViewController alloc]init];
    [self.navigationController pushViewController:YFMineBnakCardAllVC animated:YES];
}
-(void)changeTypeClick:(UIButton *)sender
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    _picker = [[JHPickView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64)];
    _picker.delegate = self ;
    _picker.selectLb.text = @"";
    if (sender.tag==0) {
        _picker.tag=0;
     _picker.customArr = @[@"银联支付",@"快捷支付"];
    }
    if (sender.tag==1) {
        _picker.tag=1;
        _picker.customArr = @[@"投资账户",@"借款账户"];
    }
    
    [window addSubview:_picker];
}
-(void)PickerSelectorIndixString:(NSString *)str
{
    if (_picker.tag==0) {
        payType=str;
         [self.YFTableView reloadData];
        
    }
    
    if (_picker.tag==1) {
        type=str;
        if ([type isEqualToString:@"投资账户"]) {
            [self DataRequest:@"1"];
        }
        if ([type isEqualToString:@"借款账户"]) {
            [self DataRequest:@"0"];
        }
    }
   
}

/*
 数据请求
 */
-(void)DataRequest:(NSString *)type
{
    [YFMineRequest YFBankCardTypeString:type success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            
            NSLog(@"bankCard == %@",json);
            NSDictionary *dataDic=[json objectForKey:@"data"];
            NSDictionary *bankDic=[dataDic objectForKey:@"bank"];
            bankCard=[NSString stringWithFormat:@"%@",[bankDic objectForKey:@"cardno"]];
            [self.YFTableView reloadData];
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
    } failure:^(NSError *error) {
        
    }];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

}

-(void)numberClick:(UITextField *)sender
{
    NSLog(@"111 == %@",sender.text);
//    textfield=sender.text;
//    if (sender.text.length>0) {
//        [YFProgressHUD showWithStatus:nil];
//        [YFMineRequest YFRechargeDataString:sender.text success:^(id json) {
//
//            if ([YFTool Nsdic:json]==1) {
//                NSLog(@"1111 == %@",json);
//                NSDictionary *dic=[json objectForKey:@"data"];
//                textfield=sender.text;
//                poudg=[NSString stringWithFormat:@"%.2f",[[dic objectForKey:@"commission"] floatValue]];
//                total=[NSString stringWithFormat:@"%.2f",[[dic objectForKey:@"commission"] floatValue]+ [sender.text floatValue]];
//                [self.YFTableView reloadData];
//            }
//
//        } failure:^(NSError *error) {
//
//        }];
//
//    }
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
//    NSLog(@"111 == %@",textField.text);
    textfield=textField.text;
//    if (textField.text.length>0) {
//
//
//        [YFProgressHUD showWithStatus:nil];
//        [YFMineRequest YFRechargeDataString:textField.text success:^(id json) {
//
//            if ([YFTool Nsdic:json]==1) {
//                NSLog(@"1111 == %@",json);
//                NSDictionary *dic=[json objectForKey:@"data"];
//                textfield=textField.text;
//                poudg=[NSString stringWithFormat:@"%.2f",[[dic objectForKey:@"commission"] floatValue]];
//                total=[NSString stringWithFormat:@"%.2f", [textField.text floatValue]];
//                [self.YFTableView reloadData];
//            }
//
//        } failure:^(NSError *error) {
//
//        }];
//
//    }
}


-(UIButton *)YFButton
{
    if (!_YFButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitle:@"确认支付" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(17);
        [button addTarget:self action:@selector(closeClick) forControlEvents:UIControlEventTouchUpInside];
        _YFButton = button;
        
    }
    return _YFButton;
}

-(void)closeClick
{
    if (textfield.length==0 ||[textfield floatValue]==0) {
        [YFProgressHUD showInfoWithStatus:@"请输入充值金额"];
        return;
    }
    
    if (payType.length==0) {
        [YFProgressHUD showInfoWithStatus:@"请选择支付方式"];
        return;
    }

    NSString *typeString=@"0";
    if ([type isEqualToString:@"投资账户"]) {
        typeString=@"1";
    }
    
    
    [YFSRFManager YFSrfSuccess:^(id json) {
        
        [self typeStr:typeString srfString:json];
        
    } failure:^(NSError *error) {
        
    }];
    
   

}

-(void)typeStr:(NSString *)sender srfString:(NSString *)srfStr
{
    [YFProgressHUD showWithStatus:nil];
    
    NSString *rechargeWayString=@"WEB";
    if ([payType isEqualToString:@"快捷支付"]) {
        rechargeWayString=@"SWIFT";
    }
    
    [YFMineRequest YFRechargeString:textfield String:sender rechargeWayString:rechargeWayString srfString:srfStr success:^(id json) {
        
        
        if ([YFTool Nsdic:json]==1) {
            NSLog(@"2222 == %@",json);
            YFUnbindBankCardWebViewController *YFOpenASavingsWebVC=[[YFUnbindBankCardWebViewController alloc] init];
            YFOpenASavingsWebVC.urlString=[json objectForKey:@"data"];
            YFOpenASavingsWebVC.title=@"请输入支付密码";
            YFOpenASavingsWebVC.changePassWordType=9;
            [self.navigationController pushViewController:YFOpenASavingsWebVC animated:YES];
 
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
    } failure:^(NSError *error) {
        
    }];
    
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
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string

{
    
    if ([textField.text rangeOfString:@"."].location == NSNotFound)
    {
        isHaveDian = NO;
    }
    if ([string length] > 0)
    {
        unichar single = [string characterAtIndex:0];//当前输入的字符
        if ((single >= '0' && single <= '9') || single == '.')//数据格式正确
        {
            //首字母不能为0和小数点
            if([textField.text length] == 0)
            {
                
                if(single == '.')
                {

                    [textField.text stringByReplacingCharactersInRange:range withString:@""];
                    
                    return NO;
                    
                }
                
//                if (single == '0')
//                {
//
//                    [textField.text stringByReplacingCharactersInRange:range withString:@""];
//
//                    return NO;
//
//                }
                
            }
            
            //输入的字符是否是小数点
            
            if (single == '.')
            {
                
                if(!isHaveDian)//text中还没有小数点
                {
                    
                    isHaveDian = YES;
                    
                    return YES;
                    
                }else{
                    
                    [textField.text stringByReplacingCharactersInRange:range withString:@""];
                    
                    return NO;
                    
                }
                
            }else{
                
                if (isHaveDian) {//存在小数点
                    
                    //判断小数点的位数
                    
                    NSRange ran = [textField.text rangeOfString:@"."];
                    
                    if (range.location - ran.location <= 2) {
                        
                        return YES;
                        
                    }else{
                        
                        return NO;
                        
                    }
                    
                }else{
                    
                    return YES;
                    
                }
                
            }
            
        }else{//输入的数据格式不正确
            
            [textField.text stringByReplacingCharactersInRange:range withString:@""];
            
            return NO;
            
        }
        
    }
    
    else
        
    {
        
        return YES;
        
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
