//
//  YFBorrowingDetailViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBorrowingDetailViewController.h"

@interface YFBorrowingDetailViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,PaymentTypeDelegate>


/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

/*
 下一步
 */
@property(nonatomic,strong)UIButton *YFButton;

@end

@implementation YFBorrowingDetailViewController
{
    NSString *moneyString;//借款金额
    NSString *limitString;//借款期限
    NSString *nearString;//年化利率
    NSInteger Type;//还款方式
}
static NSString *cellId = @"YFBorrowingHeaderTableViewCell";
static NSString *cellDetailId = @"YFBorrowingDetailTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"申请借款";
     [self configuration];
    // Do any additional setup after loading the view.
}

-(void)configuration
{
    moneyString=@"";
    limitString=@"";
    nearString=@"";
    Type=4;
    
    [self.view sd_addSubviews:@[self.YFButton,self.YFTableView]];
    
    self.YFButton.sd_layout
    .leftSpaceToView(self.view, YF_W(0))
    .bottomEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(49));
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, YF_H(0))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(HEIGHT -64-YF_H(49));
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return YF_H(10);
    }
    else{
        return 0;
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImageView *view = [[UIImageView alloc] init];
    view.userInteractionEnabled = YES;
    view.backgroundColor = LIGHTGREYCOLOR;
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0) {
        
        return YF_H(102);
    }
    if (indexPath.section ==1) {
        if (indexPath.row ==3) {
            return YF_H(41);
        }
        else{
            return YF_H(50);
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
        return 5;
    }
    else{
        return 0;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        YFBorrowingHeaderTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell == nil) {
            cell = [[YFBorrowingHeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            
        }
        
        [cell setterIndexPath:indexPath.row selectType:0 tittleString:@"借款信息"];
        
        
        return cell;
    }
    if (indexPath.section==1) {
        YFBorrowingDetailTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell == nil) {
            cell = [[YFBorrowingDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDetailId];
            
        }
        
        [cell setterIndex:indexPath.row moneyString:moneyString TimeLimitString:limitString yearsString:[NSString stringWithFormat:@"%@%%",nearString] type:Type];
       [cell.YFTextField addTarget:self action:@selector(textClick:) forControlEvents:UIControlEventEditingChanged];
        cell.YFTextField.delegate=self;
        return cell;
    }
    else{
        
        return nil;
    }
  
    
}

-(void)textClick:(UITextField *)sender
{
    
    if (sender.tag==0) {
        moneyString=sender.text;
    }
    if (sender.tag==1) {
        
//        if ([sender.text floatValue] >12) {
//            sender.text=@"12";
//        }
//        if (sender.text.length > 2) {
//            sender.text = [sender.text substringToIndex:2];
//
//        }
        limitString=sender.text;
    }
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
   
    if (limitString.length!=0&&textField.tag==1&&Type!=4) {
        /*
         计算年化利率
         */
        [YFProgressHUD showWithStatus:nil];
        [YFBorrowingRequest YFSizeString:limitString typeString:[NSString stringWithFormat:@"%ld",Type] success:^(id json) {
            
            if ([YFTool Nsdic:json]==1) {
               
                NSDictionary *dic=[json objectForKey:@"data"];
                nearString=[NSString stringWithFormat:@"%@",[dic objectForKey:@"rate"]];
                
                [_YFTableView reloadData];
            }
            else{
                [YFProgressHUD showInfoWithStatus:MESSAGE];
            }
            
        } failure:^(NSError *error) {
            
        }];
        
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return [self validateNumber:string];
}

- (BOOL)validateNumber:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.section==1) {
        if (indexPath.row==4) {
            if (moneyString.length==0||limitString.length==0) {
                [YFProgressHUD showInfoWithStatus:@"请完善信息"];
                return;
            }
            
            YFReimbursementMeansViewController *YFReimbursementMeansVC=[[YFReimbursementMeansViewController alloc] init];
            YFReimbursementMeansVC.sizeString=limitString;
            YFReimbursementMeansVC.principalString=moneyString;
            YFReimbursementMeansVC.TypeDelegate=self;
            [self.navigationController pushViewController:YFReimbursementMeansVC animated:YES];
        }
    }
}

-(void)Type:(NSInteger)type
{
    Type=type;
    

        /*
         计算年化利率
         */
        [YFProgressHUD showWithStatus:nil];
        [YFBorrowingRequest YFSizeString:limitString typeString:[NSString stringWithFormat:@"%ld",Type] success:^(id json) {
            
            if ([YFTool Nsdic:json]==1) {
                NSLog(@"222 == %@",json);
                
                NSDictionary *dic=[json objectForKey:@"data"];
                nearString=[NSString stringWithFormat:@"%@",[dic objectForKey:@"rate"]];
                
                [_YFTableView reloadData];
            }
            else{
                [YFProgressHUD showInfoWithStatus:MESSAGE];
            }
            
        } failure:^(NSError *error) {
            
        }];
        
    
}


-(UIButton *)YFButton
{
    if (!_YFButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitle:@"下一步" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(17);
        [button addTarget:self action:@selector(YFClick) forControlEvents:UIControlEventTouchUpInside];
        _YFButton = button;
        
        
        
        
    }
    return _YFButton;
}

-(void)YFClick
{
    if (moneyString.length==0) {
        [YFProgressHUD showInfoWithStatus:@"请输入借款金额"];
        return;
    }
    if (limitString.length==0) {
        [YFProgressHUD showInfoWithStatus:@"请输入借款期限"];
        return;
    }
    if (Type==4) {
        [YFProgressHUD showInfoWithStatus:@"请选择还款方式"];
        return;
    }
    
    if ([moneyString floatValue]>200000) {
        [YFProgressHUD showInfoWithStatus:@"借款金额不能大于20万"];
        return;
    }
    
    
    /*
     借多少
     */
    [_dataDic setObject:moneyString forKey:@"loanAmount"];
    /*
     借多久（月数
     */
    [_dataDic setObject:limitString forKey:@"loanDays"];
    /*
     年化利率（%）
     */
    [_dataDic setObject:nearString forKey:@"rateOfYear"];
    /*
     还款方式
     */
    [_dataDic setObject:[NSString stringWithFormat:@"%ld",Type] forKey:@"returnType"];

    
    YFBorrowingOtherViewController *YFBorrowingDetailVC=[[YFBorrowingOtherViewController alloc]init];
    YFBorrowingDetailVC.dataDic=_dataDic;
    [self.navigationController pushViewController:YFBorrowingDetailVC animated:YES];
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
