//
//  YFWithdrawalViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFWithdrawalViewController.h"

@interface YFWithdrawalViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate,UITextFieldDelegate>
/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

/*
 头部image
 */
@property(nonatomic,strong)UIImageView *imageView;

/*
 分割image
 */
@property(nonatomic,strong)UIImageView *segmentationImageView;

/*
 back
 */
@property(nonatomic,strong)UIButton *backButton;

/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 subit
 */
@property(nonatomic,strong)UILabel *subitLabel;

/*
 number
 */
@property(nonatomic,strong)UILabel *numberLabel;


/*
 明细
 */
@property(nonatomic,strong)UIButton *pleaseButton;

/*
 投资按钮
 */
@property(nonatomic,strong)UIButton *YFinvestmentButton;

/*
 借款按钮
 */
@property(nonatomic,strong)UIButton *YFborrowingButton;

/*
 image
 */
@property(nonatomic,strong)UIImageView *leftImageView;

/*
 image
 */
@property(nonatomic,strong)UIImageView *rightImageView;

/*
 确定提现按钮
 */
@property(nonatomic,strong)UIButton *YFButton;
@end

@implementation YFWithdrawalViewController
{
    BOOL isHaveDian;
    NSString *textfield;//
    NSString *poudg;//手续费
    NSString *total;//总共
    NSString *bankCard;//银行卡号
}
static NSString *cellId = @"YFWithdrawalTableViewCell";

/*
 视图将要显示
 */
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    textfield=@"";
    poudg=@"0";
    total=@"0";
    bankCard=@"";
     [self configuration];
    [self DataRequest:@"1"];
    // Do any additional setup after loading the view.
}

-(void)configuration
{
    [self.view sd_addSubviews:@[self.imageView,self.YFTableView,self.YFButton]];
    
    self.imageView.sd_layout
    .topSpaceToView(self.view, YF_H(0))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(YF_H(217));
    
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, YF_H(217))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(HEIGHT -YF_H(266));
    
    [self.imageView sd_addSubviews:@[self.backButton,self.tittleLabel,self.subitLabel,self.numberLabel,self.pleaseButton,self.segmentationImageView,self.YFinvestmentButton,self.YFborrowingButton,self.leftImageView,self.rightImageView]];
    
    self.backButton.sd_layout
    .topSpaceToView(self.imageView, YF_H(36))
    .leftSpaceToView(self.imageView, YF_W(14))
    .widthIs(YF_W(7))
    .heightIs(YF_H(12));
    
    self.tittleLabel.sd_layout
    .topSpaceToView(self.imageView, YF_H(30))
    .centerXEqualToView(self.imageView)
    .widthIs(YF_W(90))
    .heightIs(YF_H(24));
    
    self.YFinvestmentButton.sd_layout
    .topSpaceToView(self.imageView, YF_H(74))
    .leftSpaceToView(self.imageView, YF_W(50))
    .widthIs(YF_W(96))
    .heightIs(YF_H(20));
    
    self.YFborrowingButton.sd_layout
    .topSpaceToView(self.imageView, YF_H(74))
    .rightSpaceToView(self.imageView, YF_W(50))
    .widthIs(YF_W(96))
    .heightIs(YF_H(20));
    
    
    self.subitLabel.sd_layout
    .topSpaceToView(self.imageView, YF_H(141))
    .centerXEqualToView(self.imageView)
    .widthIs(WIDTH)
    .heightIs(YF_H(20));
    
    self.numberLabel.sd_layout
    .topSpaceToView(self.imageView, YF_H(165))
    .centerXEqualToView(self.imageView)
    .widthIs(WIDTH)
    .heightIs(YF_H(33));
    
    self.pleaseButton.sd_layout
    .rightSpaceToView(self.imageView, YF_W(14))
    .topSpaceToView(self.imageView, YF_H(34))
    .widthIs(YF_W(100))
    .heightIs(YF_H(20));
    
    self.YFButton.sd_layout
    .bottomEqualToView(self.view)
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(YF_H(49));
    
    self.segmentationImageView.sd_layout
    .centerXEqualToView(self.imageView)
    .topSpaceToView(self.imageView, YF_H(83))
    .widthIs(YF_W(1))
    .heightIs(YF_H(20));
    
    self.leftImageView.sd_layout
    .leftSpaceToView(self.imageView, YF_W(73))
    .topSpaceToView(self.imageView, YF_H(109))
    .widthIs(YF_W(50))
    .heightIs(YF_H(2));
    
    self.rightImageView.sd_layout
    .rightSpaceToView(self.imageView, YF_W(73))
    .topSpaceToView(self.imageView, YF_H(109))
    .widthIs(YF_W(50))
    .heightIs(YF_H(2));
    
}

-(UIImageView *)imageView
{
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image=[UIImage imageNamed:@"OnScheduleImage"];
        imageView.userInteractionEnabled =YES;
        _imageView = imageView;
    }
    return _imageView;
}

-(UIImageView *)segmentationImageView
{
    if (!_segmentationImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor=WHITECOLOR;
        _segmentationImageView = imageView;
    }
    return _segmentationImageView;
}


-(UIImageView *)leftImageView
{
    if (!_leftImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor=WHITECOLOR;
        _leftImageView = imageView;
    }
    return _leftImageView;
}

-(UIImageView *)rightImageView
{
    if (!_rightImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor=[YFTool YFColorWithString:@"FFDFC4"];
        _rightImageView = imageView;
    }
    return _rightImageView;
}

-(UIButton *)backButton
{
    if (!_backButton) {
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"backbaiImage"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        [button setEnlargeEdge:YF_W(60)];
        _backButton = button;
    }
    return _backButton;
}
-(void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textColor =WHITECOLOR;
        label.textAlignment=NSTextAlignmentCenter;
        label.text =@"提现";
        _tittleLabel = label;
    }
    return _tittleLabel;
}


-(UILabel *)subitLabel
{
    if (!_subitLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =WHITECOLOR;
        label.textAlignment=NSTextAlignmentCenter;
        label.text =@"当前账户余额(元)";
        _subitLabel = label;
    }
    return _subitLabel;
}


-(UILabel *)numberLabel
{
    if (!_numberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(24);
        label.textColor =WHITECOLOR;
        label.textAlignment=NSTextAlignmentCenter;
        label.text =[NSString stringWithFormat:@"%@",self.investorString];
        _numberLabel = label;
    }
    return _numberLabel;
}

-(UIButton *)pleaseButton
{
    if (!_pleaseButton) {
        UIButton *button=[[UIButton alloc] init];
        [button setTitle:@"明细" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(14);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [button addTarget:self action:@selector(detaliClick) forControlEvents:UIControlEventTouchUpInside];
        _pleaseButton = button;
    }
    return _pleaseButton;
}

-(void)detaliClick
{
    YFWithdrawalDetailViewController *YFWithdrawalDetailVC=[[YFWithdrawalDetailViewController alloc] init];
    [self.navigationController pushViewController:YFWithdrawalDetailVC animated:YES];
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
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return YF_H(0);
    }
    if (section==1) {
        return YF_H(10);
    }
    if (section==2) {
        return YF_H(40);
    }else{
        return 0;
    }
    
    
    
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImageView *view = [[UIImageView alloc] init];
    view.userInteractionEnabled = YES;
    view.backgroundColor = LIGHTGREYCOLOR;
    
    if (section==2) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF999;
        label.text =@"提现到";
        [view addSubview:label];
        
        label.sd_layout
        .leftSpaceToView(view, YF_H(14))
        .centerYEqualToView(view)
        .widthIs(WIDTH)
        .heightIs(YF_H(20));
        
        
    }
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return YF_H(50);
    }
    if (indexPath.section==1) {
        return YF_H(45);
    }
    if (indexPath.section==2) {
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
    if (section==1) {
        return 2;
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
    
    YFWithdrawalTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFWithdrawalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    [cell setterIndexPath:indexPath.row IndexSection:indexPath.section textString:textfield poundageString:poudg totalString:total BankCardNumberString:bankCard];
    
    [cell.changeButton addTarget:self action:@selector(changeClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.YFtextField.delegate=self;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"111 == %@",textField.text);
    textfield=textField.text;
    if (textField.text.length>0) {
        [YFProgressHUD showWithStatus:nil];
        [YFMineRequest YFWithDrawDataString:textField.text success:^(id json) {
            
            if ([YFTool Nsdic:json]==1) {
                NSLog(@"1111 == %@",json);
                NSDictionary *dic=[json objectForKey:@"data"];
                textfield=textField.text;
                poudg=[NSString stringWithFormat:@"%.2f",[[dic objectForKey:@"commission"] floatValue]];
                total=[NSString stringWithFormat:@"%.2f",[textField.text floatValue]-[[dic objectForKey:@"commission"] floatValue]];
             
                [self.YFTableView reloadData];
            }
            
        } failure:^(NSError *error) {
            
        }];
        
    }
}

-(void)Tab
{

    textfield=@"0";
    poudg=@"0";
    total=@"0";
    [self.YFTableView reloadData];
}



-(UIButton *)YFinvestmentButton
{
    if (!_YFinvestmentButton) {
        UIButton *button=[[UIButton alloc] init];
        [button setTitle:@"投资账户" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateSelected];
        button.selected=YES;
        [button setTitleColor:[YFTool YFColorWithString:@"FFDFC4"] forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(14);
        [button addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
        _YFinvestmentButton = button;
        
    }
    return _YFinvestmentButton;
}
-(void)leftClick
{
    self.YFinvestmentButton.selected=YES;
    self.YFborrowingButton.selected=NO;
    self.leftImageView.backgroundColor=WHITECOLOR;
    self.rightImageView.backgroundColor=[YFTool YFColorWithString:@"FFDFC4"];
    self.numberLabel.text=[NSString stringWithFormat:@"%.2f",[self.investorString floatValue]];
    [self DataRequest:@"1"];
     [self Tab];
}

-(UIButton *)YFborrowingButton
{
    if (!_YFborrowingButton) {
        UIButton *button=[[UIButton alloc] init];
        [button setTitle:@"借款账户" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateSelected];
        button.titleLabel.font = YF_FONT(14);
        [button setTitleColor:[YFTool YFColorWithString:@"FFDFC4"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
        _YFborrowingButton = button;
        
    }
    return _YFborrowingButton;
}
-(void)rightClick
{
    self.YFinvestmentButton.selected=NO;
    self.YFborrowingButton.selected=YES;
    self.leftImageView.backgroundColor=[YFTool YFColorWithString:@"FFDFC4"];
    self.rightImageView.backgroundColor=WHITECOLOR;
    self.numberLabel.text=[NSString stringWithFormat:@"%.2f",[self.borrowerString floatValue]];
    [self DataRequest:@"0"];
    [self Tab];
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
        [YFProgressHUD showInfoWithStatus:@"请输入提现金额"];
        return;
    }
    NSString *typeString=@"0";
    if (self.YFinvestmentButton.selected==YES) {
        typeString=@"1";
    }
    [YFSRFManager YFSrfSuccess:^(id json) {
        
        [self Verification:typeString srfString:json];
        
    } failure:^(NSError *error) {
        
    }];

    
   
    
}
-(void)Verification:(NSString *)typeStr srfString:(NSString *)srfStr
{
    [YFProgressHUD showWithStatus:nil];
    [YFMineRequest YFWithdrawString:textfield typeString:typeStr srfString:srfStr success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            
            YFUnbindBankCardWebViewController *YFOpenASavingsWebVC=[[YFUnbindBankCardWebViewController alloc] init];
            YFOpenASavingsWebVC.urlString=[json objectForKey:@"data"];
            YFOpenASavingsWebVC.title=@"请输入支付密码";
            YFOpenASavingsWebVC.changePassWordType=10;
            [self.navigationController pushViewController:YFOpenASavingsWebVC animated:YES];
            
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
    } failure:^(NSError *error) {
        
    }];
}

-(void)changeClick:(UIButton *)sender
{
    if (sender.tag==0) {
        if (self.YFinvestmentButton.selected==YES) {
          textfield=self.investorString;
        }
        if (self.YFborrowingButton.selected==YES) {
          textfield=self.borrowerString;
        }
        NSLog(@"222 == %@",textfield);
        
        if (textfield.length>0&&[textfield floatValue] >0) {
            [YFProgressHUD showWithStatus:nil];
            [YFMineRequest YFWithDrawDataString:textfield success:^(id json) {
                
                if ([YFTool Nsdic:json]==1) {
                    NSLog(@"1111 == %@",json);
                    NSDictionary *dic=[json objectForKey:@"data"];
                    if (self.YFinvestmentButton.selected==YES) {
                        textfield=self.investorString;
                    }
                    if (self.YFborrowingButton.selected==YES) {
                        textfield=self.borrowerString;
                    }
                    poudg=[NSString stringWithFormat:@"%.2f",[[dic objectForKey:@"commission"] floatValue]];
                    total=[NSString stringWithFormat:@"%.2f",[textfield floatValue]-[[dic objectForKey:@"commission"] floatValue]];
                    [self.YFTableView reloadData];
                }
                
            } failure:^(NSError *error) {
                
            }];
            
        }
        
    }
    if (sender.tag==1) {
        YFMineBnakCardAllViewController *YFMineBnakCardAllVC=[[YFMineBnakCardAllViewController alloc]init];
        [self.navigationController pushViewController:YFMineBnakCardAllVC animated:YES];
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


/*
 视图将要消失
 */
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    
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
