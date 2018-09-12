//
//  YFIWantToInvestViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/21.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFIWantToInvestViewController.h"

@interface YFIWantToInvestViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UITextFieldDelegate,YFCustomOpenTheDepositoryDelegate,YFOpenAnAccountDelegate,YFCustomPopoverDelegate>

/*
 底部scrollerView
 */
@property(nonatomic,strong)UIScrollView *YFScrollerView;
/*
 header
 */
@property(nonatomic,strong)UIView *headerView;
/*
 footer
 */
@property(nonatomic,strong)UIView *footerView;

/*
 footerImageview
 */
@property(nonatomic,strong)UIImageView *footerImageView;

/*
 footertittle
 */
@property(nonatomic,strong)UILabel *footerTittleLabel;


/*
 立刻购买
 */
@property(nonatomic,strong)UIButton *YFButton;


/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

@end

@implementation YFIWantToInvestViewController
{
    NSString *investmentMinString;//最低出借金额
    NSString *buyString;//购买金额
    NSString *RateCouponString;//加息券
    NSString *redEnvelopeString;//红包
    NSString *earningsString;//预期收益
    NSString *poundageString;//手续费
    NSString *combinedString;//合计
    NSString *buyListString;//购买金额
    NSString *redEnvelopeListString;//红包
    NSString *RateCouponIdString;//加息券ID
    NSString *redEnvelopeIDString;//红包ID
    
}
static NSString *cellId = @"YFIWantToInvestTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我要投资";
    self.view.backgroundColor=WHITECOLOR;
    
    investmentMinString=self.listModel.investmentMin;
    buyString=@"";
    RateCouponString=@"0";
    redEnvelopeString=@"0";
    earningsString=@"0";
    poundageString=@"0";
    combinedString=@"0";
    buyListString=@"0";
    redEnvelopeListString=@"0";
    RateCouponIdString=@"kong";
    redEnvelopeIDString=@"kong";
    [self configuration];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Envelope:) name:@"Envelope" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Red:) name:@"Red" object:nil];
    
    /*
     数据请求
     */
    [self DataRequest];
    
}
/*加息券*/
-(void)Envelope:(NSNotification *)noti
{
    
    NSLog(@"Envelope == %@",noti.object);
    RateCouponString=[NSString stringWithFormat:@"%@",[noti.object objectForKey:@"0"]];
    RateCouponIdString=[NSString stringWithFormat:@"%@",[noti.object objectForKey:@"1"]];
    
    
    
    [self.YFTableView reloadData];
    [self calculate];
    
}
/*红包*/
-(void)Red:(NSNotification *)noti
{
    
NSLog(@"Red == %@",noti.object);
    redEnvelopeString=[NSString stringWithFormat:@"%@",[noti.object objectForKey:@"0"]];
    redEnvelopeIDString=[NSString stringWithFormat:@"%@",[noti.object objectForKey:@"1"]];
    [self.YFTableView reloadData];
     [self calculate];
    
}


-(void)configuration
{
    
  [self.view sd_addSubviews:@[self.YFScrollerView,self.YFButton,self.footerView]];
    
    self.YFScrollerView.sd_layout
    .topEqualToView(self.view)
    .leftEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(HEIGHT-64-YF_H(49)-YF_H(100));
    
    [self.YFScrollerView sd_addSubviews:@[self.headerView,self.YFTableView]];
    

    
    self.headerView.sd_layout
    .topEqualToView(self.YFScrollerView)
    .leftEqualToView(self.YFScrollerView)
    .widthIs(WIDTH)
    .heightIs(YF_H(182));
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.YFScrollerView, YF_H(0))
    .leftSpaceToView(self.YFScrollerView, 0)
    .widthIs(WIDTH)
    .heightIs(YF_H(460)+YF_H(182));
    
    [self.YFTableView setTableHeaderView:self.headerView];
    
    self.footerView.sd_layout
    .bottomSpaceToView(self.view, YF_H(49))
    .leftEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(99));
    
    
    self.YFButton.sd_layout
    .bottomEqualToView(self.view)
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(YF_H(49));
    
    
     [self.headerView sd_addSubviews:@[self.totalLabel,self.totalNumberLabel,self.instructionsLabel,self.remainingLabel,self.ProgressView,self.whyLabel,self.topUpButton]];
    
    UIImageView *imageViewa = [[UIImageView alloc] init];
    imageViewa.backgroundColor=LIGHTGREYCOLOR;
    [self.headerView addSubview:imageViewa];
    
    imageViewa.sd_layout
    .topSpaceToView(self.headerView, YF_H(0))
    .leftSpaceToView(self.headerView, YF_W(0))
    .widthIs(WIDTH)
    .heightIs(YF_H(10));
    
    
    
    self.totalLabel.sd_layout
    .topSpaceToView(self.headerView, YF_H(17))
    .leftSpaceToView(self.headerView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(20));
    
    self.totalNumberLabel.sd_layout
    .topSpaceToView(self.headerView, YF_H(39))
    .leftSpaceToView(self.headerView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(28));
    
    
    UIImageView *imageViewaa = [[UIImageView alloc] init];
    imageViewaa.backgroundColor=LIGHTGREYCOLOR;
    [self.headerView addSubview:imageViewaa];
    
    imageViewaa.sd_layout
    .topSpaceToView(self.headerView, YF_H(82))
    .leftSpaceToView(self.headerView, YF_W(14))
    .widthIs(WIDTH-YF_W(28))
    .heightIs(YF_H(1));
    
    self.instructionsLabel.sd_layout
    .topSpaceToView(self.headerView, YF_H(98))
    .leftSpaceToView(self.headerView, YF_W(14))
    .widthIs(WIDTH- YF_W(28))
    .heightIs(YF_H(20));
    
    self.remainingLabel.sd_layout
    .topSpaceToView(self.headerView, YF_H(128))
    .leftSpaceToView(self.headerView, YF_W(14))
    .widthIs(WIDTH- YF_W(28))
    .heightIs(YF_H(17));
    
    self.ProgressView.sd_layout
    .topSpaceToView(self.headerView, YF_H(156))
    .leftSpaceToView(self.headerView, YF_W(14))
    .widthIs(WIDTH- YF_W(92))
    .heightIs(YF_H(2));
    
    self.whyLabel.sd_layout
    .topSpaceToView(self.headerView, YF_H(149))
    .rightSpaceToView(self.headerView, YF_W(14))
    .widthIs(YF_W(60))
    .heightIs(YF_H(17));
    
    UIImageView *imageViewthird = [[UIImageView alloc] init];
    imageViewthird.backgroundColor=LIGHTGREYCOLOR;
    [self.headerView addSubview:imageViewthird];
    
    imageViewthird.sd_layout
    .topSpaceToView(self.headerView, YF_H(181))
    .leftSpaceToView(self.headerView, YF_W(14))
    .widthIs(WIDTH - YF_W(28))
    .heightIs(YF_H(1));
    
    
    self.topUpButton.sd_layout
    .topSpaceToView(self.headerView, YF_H(29))
    .rightSpaceToView(self.headerView, YF_W(14))
    .widthIs(YF_W(35))
    .heightIs(YF_H(35));
    
    [self.footerView sd_addSubviews:@[self.footerImageView,self.footerTittleLabel]];
    
    self.footerImageView.sd_layout
    .topSpaceToView(self.footerView, YF_H(10))
    .centerXEqualToView(self.footerView)
    .widthIs( YF_W(17))
    .heightIs(YF_H(20));
    
    self.footerTittleLabel.sd_layout
    .topSpaceToView(self.footerView, YF_H(34))
    .rightSpaceToView(self.footerView, YF_W(14))
    .widthIs(WIDTH - YF_W(28))
    .heightIs(YF_H(55));
    
    
    
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


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row <=5) {
        return YF_H(50);
    }
   
    if (indexPath.row >5 &&indexPath.row <=9) {
        return YF_H(40);
    }
    else{
        return 0;
    }
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFIWantToInvestTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFIWantToInvestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    [cell setterIndex:indexPath.row investmentMinString:investmentMinString buyString:buyString RateCouponString:RateCouponString redEnvelopeString:redEnvelopeString earningsString:earningsString buyListString:buyListString poundageString:poundageString redEnvelopeListString:redEnvelopeListString combinedString:combinedString];
     [cell.YFTextField addTarget:self action:@selector(phoneClick:) forControlEvents:UIControlEventEditingChanged];
    cell.YFTextField.delegate=self;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.row==2) {
        TFMyRedPacketsViewController *TFMyRedPacketsVC=[[TFMyRedPacketsViewController alloc]init];
        TFMyRedPacketsVC.index=0;
        TFMyRedPacketsVC.selectType=1;
        TFMyRedPacketsVC.moneyString=self.listModel.investmentMin;
        [self.navigationController pushViewController:TFMyRedPacketsVC animated:YES];
    }
    if (indexPath.row==3) {
        TFMyRedPacketsViewController *TFMyRedPacketsVC=[[TFMyRedPacketsViewController alloc]init];
        TFMyRedPacketsVC.index=1;
        TFMyRedPacketsVC.selectType=1;
        TFMyRedPacketsVC.moneyString=self.listModel.investmentMin;
        [self.navigationController pushViewController:TFMyRedPacketsVC animated:YES];
    }
    
}

-(void)phoneClick:(UITextField *)sender
{
    NSLog(@"%@",sender.text);
    buyString=sender.text;
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [self calculate];
    
}

-(void)calculate
{
    if (buyString.length!=0 &&[buyString floatValue]>0) {
        
    [YFProgressHUD showWithStatus:nil];
        
    [YFHomePageRequest YFHomecalculate:self.listModel.id amountString:buyString couponIdString:RateCouponIdString couponlistIdString:redEnvelopeIDString success:^(id json) {
        
        NSLog(@"1111 == %@",json);
        
        if ([YFTool Nsdic:json]==1) {
            
            NSDictionary *dic=[json objectForKey:@"data"];
            buyListString=[NSString stringWithFormat:@"%@",[dic objectForKey:@"amount"]];
            earningsString=[NSString stringWithFormat:@"%@",[dic objectForKey:@"totalIncome"]];
            redEnvelopeListString=[NSString stringWithFormat:@"%@",[dic objectForKey:@"red"]];
            combinedString=[NSString stringWithFormat:@"%@",[dic objectForKey:@"total"]];
             poundageString=[NSString stringWithFormat:@"%@",[dic objectForKey:@"poundage"]];
            [self.YFTableView reloadData];
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
    } failure:^(NSError *error) {
        
    }];
    }
}

-(UIScrollView *)YFScrollerView
{
    if (!_YFScrollerView) {
        
        UIScrollView *scrollView=[[UIScrollView alloc] init];
        [scrollView setBounces:YES];
        [scrollView setContentSize:CGSizeMake(0, YF_H(460)+YF_H(182))];
        scrollView.userInteractionEnabled =YES;
        scrollView.backgroundColor = LIGHTGREYCOLOR;
        scrollView.showsVerticalScrollIndicator = NO;
        _YFScrollerView =scrollView;
    }
    return _YFScrollerView;
}

-(UIView *)headerView
{
    if (!_headerView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor=WHITECOLOR;
        view.userInteractionEnabled =YES;
        _headerView = view;
    }
    return _headerView;
}



-(UILabel *)totalLabel
{
    if (!_totalLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =[YFTool YFColorWithString:@"999999"];
        label.text =@"账户可用余额";
        _totalLabel = label;
    }
    return _totalLabel;
}


-(UILabel *)totalNumberLabel
{
    if (!_totalNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.textColor =ZHUTICOLOR;
        label.text =@"0.00";
        _totalNumberLabel = label;
    }
    return _totalNumberLabel;
}



-(UILabel *)instructionsLabel
{
    if (!_instructionsLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF333;
        label.text =self.listModel.projectName;
        _instructionsLabel = label;
    }
    return _instructionsLabel;
}

-(UILabel *)remainingLabel
{
    if (!_remainingLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =ZHUTICOLOR;
      
        NSString *string = [NSString stringWithFormat:@"剩余可投%.2f元",[self.listModel.residue doubleValue]];
        NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithString:string];
        [aString addAttribute:NSForegroundColorAttributeName value:[YFTool YFColorWithString:@"999999"] range:NSMakeRange(0, 4)];
        label.attributedText =aString;
        _remainingLabel = label;
    }
    return _remainingLabel;
}

-(YFProgressView *)ProgressView
{
    if (!_ProgressView) {
        YFProgressView *view = [[YFProgressView alloc] init];
        double count = 1-[self.listModel.residue doubleValue]/[self.listModel.projectSize doubleValue];
       
        [view setterFloat:count];
        _ProgressView = view;
    }
    return _ProgressView;
}

-(UILabel *)whyLabel
{
    if (!_whyLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textAlignment = NSTextAlignmentRight;
        label.textColor =[YFTool YFColorWithString:@"666666"];
        double count = 1- [self.listModel.residue doubleValue]/[self.listModel.projectSize doubleValue];
       
        label.text =[NSString stringWithFormat:@"已筹%.0f%%",count*100];
        _whyLabel = label;
    }
    return _whyLabel;
}


-(UIButton *)topUpButton
{
    if (!_topUpButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitle:@"充值" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.layer.cornerRadius = YF_W(35)/2;
        button.layer.masksToBounds = YES;
        button.titleLabel.font = YF_FONT(12);
        [button addTarget:self action:@selector(topUpClick) forControlEvents:UIControlEventTouchUpInside];
        _topUpButton = button;
        
    }
    return _topUpButton;
}


-(void)topUpClick
{
    YFTopUpViewController *YFTopUpVC=[[YFTopUpViewController alloc] init];
    [self.navigationController pushViewController:YFTopUpVC animated:YES];
}



-(UIView *)footerView
{
    if (!_footerView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor=LIGHTGREYCOLOR;
        view.userInteractionEnabled =YES;
        _footerView = view;
    }
    return _footerView;
}


-(UIImageView *)footerImageView
{
    if (!_footerImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image =[UIImage imageNamed:@"anquanImage"];
        _footerImageView = imageView;
    }
    return _footerImageView;
}


-(UILabel *)footerTittleLabel
{
    if (!_footerTittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textAlignment=NSTextAlignmentCenter;
        label.numberOfLines = 0;
        label.textColor =[YFTool YFColorWithString:@"999999"];
        label.text =@"出借资金全程由银行存管\n期待回报不代表实际利息回报承诺\n市场有风险，投资需谨慎";
        _footerTittleLabel = label;
    }
    return _footerTittleLabel;
}

-(UIButton *)YFButton
{
    if (!_YFButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitle:@"立即购买" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(17);
        [button addTarget:self action:@selector(openClick) forControlEvents:UIControlEventTouchUpInside];
        _YFButton = button;
        
    }
    return _YFButton;
}

-(void)openClick
{
    if ([[YFTool userDefaultsId:YFisDepository] integerValue]==0 ||[[YFTool userDefaultsId:YFisDepositoryB] integerValue]==0) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        _CustomOpenTheDepositoryView =[[YFCustomOpenTheDepositoryView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
        _CustomOpenTheDepositoryView.OpenTheDepositoryDelegate=self;
        [window addSubview:_CustomOpenTheDepositoryView];
        
        return;
    }
    
    if (![[YFTool userDefaultsId:YFInvestmentType] isEqualToString:@"进取型"] &&![[YFTool userDefaultsId:YFInvestmentType] isEqualToString:@"稳健型"]) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        _CustomPopoverView =[[YFCustomPopoverView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
        _CustomPopoverView.CustomPopoverDelegate=self;
        [window addSubview:_CustomPopoverView];
        
         return;
    }
    
   
    if ([buyString floatValue] <[self.listModel.investmentMin floatValue]) {
        [YFProgressHUD showInfoWithStatus:@"请输入正确的购买金额"];
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
    [YFHomePageRequest YFHomeInvestmentProjectId:self.listModel.id amountString:buyString couponIdString:RateCouponIdString couponlistIdString:redEnvelopeIDString srfString:srfStr success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            NSLog(@"1111 == %@",json);
            
            
            YFMineBnakCardAddWebViewController *YFOpenASavingsWebVC=[[YFMineBnakCardAddWebViewController alloc] init];
            YFOpenASavingsWebVC.urlString=[json objectForKey:@"data"];
            YFOpenASavingsWebVC.title=self.title;
            [self.navigationController pushViewController:YFOpenASavingsWebVC animated:YES];
            
            
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
    } failure:^(NSError *error) {
        
    }];
    
}

-(void)SuccessfulType:(NSInteger)type
{
    if (type ==0) {
        YFOpenASavingsAccountViewController *YFOpenASavingsAccountVC=[[YFOpenASavingsAccountViewController alloc] init];
        YFOpenASavingsAccountVC.OpenAnAccountDelegate=self;
        [self.navigationController pushViewController:YFOpenASavingsAccountVC animated:YES];
    }
    if (type ==1) {
        NSLog(@"暂不考虑");
    }
}
-(void)CustomPopoverSuccessfulType:(NSInteger)type
{
    if (type ==1) {
        YFCreditRiskRatingViewController *YFCreditRiskRatingVC=[[YFCreditRiskRatingViewController alloc]init];
        [self.navigationController pushViewController:YFCreditRiskRatingVC animated:YES];
    }
    if (type ==2) {
        NSLog(@"我先看看");
    }
}
/*
 开户成功代理
 */
-(void)OpenAnAccount
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    _CustomSuccessView =[[YFCustomSuccessView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    [window addSubview:_CustomSuccessView];
}

/*
 数据请求
 */
-(void)DataRequest
{
    [YFHomePageRequest YFHomegetData:self.listModel.id success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            NSLog(@"2222 == %@",json);
            NSDictionary *dataDic=[json objectForKey:@"data"];
            self.totalNumberLabel.text =[NSString stringWithFormat:@"%.2f",[[dataDic objectForKey:@"bal"] doubleValue]];
            
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
