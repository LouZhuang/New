//
//  YFBorrowingInformationViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBorrowingInformationViewController.h"

@interface YFBorrowingInformationViewController ()<UITableViewDelegate,UITableViewDataSource,JHPickerDelegate,UITextViewDelegate>


@end

@implementation YFBorrowingInformationViewController
{
    NSInteger typeZore;//
    NSInteger typeThree;//
    NSInteger typeFive;//
    NSInteger typeFour;//
    
    NSString *selectOne;
    NSString *selectTwo;
    
    
    NSInteger typeOne;//负债情况  多选 存在其他贷款为1   不存在未0
    NSInteger typeTwo;//其他平台  在其他平台为0  否为1
    
    NSMutableArray *threeArray;
    
    
    NSString *textViewString;
    NSString *textFieldOneString;
    NSString *textFieldTwoString;
}

static NSString *cellId = @"YFBorrowingHeaderTableViewCell";
static NSString *cellSelectId = @"YFBorrowingSelectTableViewCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"申请借款";
    typeZore=0;
    typeThree=0;
    typeFive=3;
    typeFour=1;
    
    selectOne=@"请选择所属行业";
    selectTwo=@"请选择收入金额区间";
    
    typeOne=0;
    typeTwo=1;
    textViewString=@"";
    textFieldOneString=@"";
    textFieldTwoString=@"";
    threeArray=[NSMutableArray arrayWithObjects:@"0",@"0",@"0", nil];
    
    [self configuration];
    // Do any additional setup after loading the view.
}


-(void)configuration
{
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
    return 6;
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
        return YF_H(80);
    }
    
    if (indexPath.section ==2) {
        
        return YF_H(100);
        
    }
    if (indexPath.section ==3) {
        if (indexPath.row==0) {
            return YF_H(80);
        }
        if (indexPath.row==1) {
            return YF_H(75);
        }
        else{
            return 0;
        }
    }
    if (indexPath.section ==4) {
        if (indexPath.row==0) {
            return YF_H(80);
        }
        if (indexPath.row==1) {
            return YF_H(50);
        }
        if (indexPath.row==2) {
            return YF_H(50);
        }
        if (indexPath.row==3) {
            return YF_H(80);
        }
        else{
            return 0;
        }
    }
    else{
        return YF_H(10);
    }
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section ==0) {
        return 1;
    }
    if (section ==1) {
        return 1;
    }
    if (section ==2) {
        return 2;
    }
    if (section ==3) {
        if (typeOne==0) {
            return 1;
        }
        if (typeOne==1) {
            return 2;
        }
        else{
            return 0;
        }
    }
    if (section ==4) {
        if (typeTwo==0) {
            return 4;
        }
        if (typeTwo==1) {
            return 1;
        }
        else{
            return 0;
        }
        
    }
    else{
        return 1;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section==0) {
        YFBorrowingHeaderTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell == nil) {
            cell = [[YFBorrowingHeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            
        }
        
        [cell setterIndexPath:indexPath.row selectType:0 tittleString:@"借款人信息"];
        
        
        return cell;
    }
    else{
        YFBorrowingSelectTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell == nil) {
            cell = [[YFBorrowingSelectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellSelectId];
            
        }
        if (indexPath.section==1) {
            
            [cell setterSetionOneSelectType:typeZore];
            [cell.firstButton addTarget:self action:@selector(sectionOneClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.secondButton addTarget:self action:@selector(sectionOneClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.threeButton addTarget:self action:@selector(sectionOneClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        if (indexPath.section==2) {
            
            [cell setterSetionTwoRow:indexPath.row industryString:selectOne amountString:selectTwo];
            
            [cell.selectButton addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        if (indexPath.section==3) {
            
            [cell setterSetionThreeRow:indexPath.row SelectType:threeArray textViewString:textViewString];
            cell.YF_TextView.delegate=self;
            [cell.firstButton addTarget:self action:@selector(sectionTwoClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.secondButton addTarget:self action:@selector(sectionTwoClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.threeButton addTarget:self action:@selector(sectionTwoClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        if (indexPath.section==4) {
            [cell setterSetionFourRow:indexPath.row SelectType:typeFour lastType:typeFive textFieldOneString:textFieldOneString textFieldTwoString:textFieldTwoString];
            [cell.firstButton addTarget:self action:@selector(sectionFourClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.secondButton addTarget:self action:@selector(sectionFourClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.YFtextField addTarget:self action:@selector(textClick:) forControlEvents:UIControlEventEditingChanged];
            
        }
        
        return cell;
    }
    
    
}

-(void)textClick:(UITextField *)sender
{
    
    if (sender.tag==0) {
        textFieldOneString=sender.text;
    }
    if (sender.tag==1) {
        textFieldTwoString=sender.text;
    }
}

-(void)textViewDidChange:(UITextView *)textView
{
    textViewString=textView.text;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

/*
 section1
 */
-(void)sectionOneClick:(UIButton *)sender
{
    typeZore=sender.tag;
    [self.YFTableView reloadData];
}


-(void)selectClick:(UIButton *)sender
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    _picker = [[JHPickView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64)];
    _picker.delegate = self ;
    _picker.selectLb.text = @"";
    if (sender.tag==0) {
        
        _picker.tag=0;
        _picker.customArr = @[@"农林牧渔业",@"采矿业",@"制造业",@"电力、热力、燃气及水生产和供应业",@"建筑业",@"批发和零售业",@"交通运输、仓储和邮政业",@"住宿和餐饮业",@"信息传输、软件和技术服务业",@"金融业",@"房地产业",@"租赁和商务服务业",@"科学研究和技术服务业",@"水利、环境和公共设施管理业",@"居民服务、修理和其他业",@"教育",@"卫生和社会工作",@"文化、体育和娱乐业",@"公共管理、社会保障和组织",@"国际组织"];
        
    }
    if (sender.tag==1) {
        _picker.tag=1;
        _picker.customArr = @[@"2000元以下",@"2000-5000元",@"5000-10000元",@"10000元以上"];
    }
    [window addSubview:_picker];
    
}
-(void)PickerSelectorIndixString:(NSString *)str
{
    if (_picker.tag==0) {
        selectOne=str;
    }
    if (_picker.tag==1) {
        selectTwo=str;
    }
    
    [self.YFTableView reloadData];
    
    
}


/*
 section3
 */
-(void)sectionTwoClick:(UIButton *)sender
{
    
    if (sender.selected==YES) {
        [threeArray replaceObjectAtIndex:sender.tag withObject:@"0"];
    }
    if (sender.selected==NO) {
        [threeArray replaceObjectAtIndex:sender.tag withObject:@"1"];
    }
    
    sender.selected=!sender.selected;
    
    if ([[threeArray objectAtIndex:2] integerValue]==1) {
        typeOne=1;
    }
    if ([[threeArray objectAtIndex:2] integerValue]==0) {
        typeOne=0;
        textViewString=@"";
    }
    
    [self.YFTableView reloadData];
}


/*
 section4
 */
-(void)sectionFourClick:(UIButton *)sender
{
    
    if (sender.tag<=1) {
        typeFour=sender.tag;
        if (sender.tag==0) {
            typeTwo=0;
        }
        if (sender.tag==1) {
            typeTwo=1;
            textFieldOneString=@"";
            textFieldTwoString=@"";
            typeFive=3;
        }
    }
    
    if (sender.tag>1) {
        typeFive=sender.tag;
    }
    
    
    [self.YFTableView reloadData];
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
    if ([selectOne isEqualToString:@"请选择所属行业"]) {
        [YFProgressHUD showInfoWithStatus:@"请选择所属行业"];
        return;
    }
    if ([selectTwo isEqualToString:@"请选择收入金额区间"]) {
        [YFProgressHUD showInfoWithStatus:@"请选择收入金额区间"];
        return;
    }
    /*
     其他贷款
     */
    if (typeOne==1) {
        if (textViewString.length==0) {
            
            [YFProgressHUD showInfoWithStatus:@"请填写贷款类型"];
            return;
        }
    }
    /*
     在其他平台贷款
     */
    if (typeTwo==0) {

        if (textFieldTwoString.length==0) {
            
            [YFProgressHUD showInfoWithStatus:@"请填写借款金额"];
            return;
        }
        
        
    }
    
   
    
    YFBorrowingDetailViewController *YFBorrowingDetailVC=[[YFBorrowingDetailViewController alloc]init];
    YFBorrowingDetailVC.dataDic= [self DataSorting];
    [self.navigationController pushViewController:YFBorrowingDetailVC animated:YES];
   
    
    
    
    
   
}
/*
  数据整理
  */
-(NSMutableDictionary *)DataSorting
{
    NSString *organizationString=@"natural";
    if (typeZore==1) {
        organizationString=@"corporation";
    }
    if (typeZore==2) {
        organizationString=@"other";
    }
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    /*
     主体性质
     */
    [dictionary setObject:organizationString forKey:@"organization"];
    
    /*
     所属行业
     */
    [dictionary setObject:selectOne forKey:@"occupation"];
    
    /*
     月收入
     */
    [dictionary setObject:selectTwo forKey:@"annualIncome"];
    
    
    /*
     负债情况
     */
    NSString *incurDebtsString=@"";
    
    if ([[threeArray objectAtIndex:0] integerValue]==0 &&[[threeArray objectAtIndex:1] integerValue]==0 &&[[threeArray objectAtIndex:2] integerValue]==0 ) {
        /*
         无负债情况
         */
        NSLog(@"无负债情况 == %@",dictionary);
        
    }
    else{
        
        /*
         有贷款无其他贷款
         */
        if ([[threeArray objectAtIndex:0] integerValue]==1 &&[[threeArray objectAtIndex:1] integerValue]==0&&[[threeArray objectAtIndex:2] integerValue]==0) {
            /*
             只有房贷
             */
            incurDebtsString=@"房贷";
            
        }
        if ([[threeArray objectAtIndex:0] integerValue]==0 &&[[threeArray objectAtIndex:1] integerValue]==1&&[[threeArray objectAtIndex:2] integerValue]==0) {
            /*
             只有车贷
             */
            incurDebtsString=@"车贷";
            
        }
        if ([[threeArray objectAtIndex:0] integerValue]==0 &&[[threeArray objectAtIndex:1] integerValue]==0&&[[threeArray objectAtIndex:2] integerValue]==1) {
            /*
             只有其他贷款
             */
            incurDebtsString=textViewString;
            
        }
        if ([[threeArray objectAtIndex:0] integerValue]==1 &&[[threeArray objectAtIndex:1] integerValue]==1&&[[threeArray objectAtIndex:2] integerValue]==0) {
            /*
             房贷和车贷
             */
            incurDebtsString=@"房贷/车贷";
            
        }
        if ([[threeArray objectAtIndex:0] integerValue]==1 &&[[threeArray objectAtIndex:1] integerValue]==0&&[[threeArray objectAtIndex:2] integerValue]==1) {
            /*
             房贷和其他贷款
             */
            incurDebtsString=[NSString stringWithFormat:@"房贷/%@",textViewString];
            
        }
        if ([[threeArray objectAtIndex:0] integerValue]==0 &&[[threeArray objectAtIndex:1] integerValue]==1&&[[threeArray objectAtIndex:2] integerValue]==1) {
            /*
             车贷和其他贷款
             */
            incurDebtsString=[NSString stringWithFormat:@"车贷/%@",textViewString];
            
        }
        if ([[threeArray objectAtIndex:0] integerValue]==1 &&[[threeArray objectAtIndex:1] integerValue]==1&&[[threeArray objectAtIndex:2] integerValue]==1) {
            /*
             车贷和其他贷款
             */
            incurDebtsString=[NSString stringWithFormat:@"房贷/车贷/%@",textViewString];
            
        }
        
        [dictionary setObject:incurDebtsString forKey:@"incurDebts"];
        
        NSLog(@"youdaikuan == %@",dictionary);
    }
    
    if (typeTwo==1 ) {
        /*
         没有再其他平台借贷
         */
        NSLog(@"没有再其他平台借贷 == %@",dictionary);
        
    }
    else{
        /*
         借款平台名称  选填
         */
        [dictionary setObject:textFieldOneString forKey:@"otherPlatform"];
        
        /*
         借款金额
         */
        [dictionary setObject:textFieldTwoString forKey:@"otherPlatformLoan"];
        
        /*
         isOverdue  是否逾期(0否1是)
         */
        
        if (typeTwo==1) {
            [dictionary setObject:@"0" forKey:@"isOverdue"];
        }
        if (typeTwo==0) {
            [dictionary setObject:@"1" forKey:@"isOverdue"];
        }
        
        NSLog(@"是否逾期 ==%@",dictionary);
        
    }
    
    return dictionary;
    
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

