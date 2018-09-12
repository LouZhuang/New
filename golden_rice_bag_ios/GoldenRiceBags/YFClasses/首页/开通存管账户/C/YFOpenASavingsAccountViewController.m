//
//  YFOpenASavingsAccountViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/14.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFOpenASavingsAccountViewController.h"

@interface YFOpenASavingsAccountViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

/*
 底部scrollerView
 */
@property(nonatomic,strong)UIScrollView *YFScrollerView;

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

/*
 downView
 */
@property(nonatomic,strong)UIView *downView;

/*
 密码说明
 */
@property(nonatomic,strong)UILabel *passwordLabel;

/*
 协议
 */
@property(nonatomic,strong)UIButton *agreementButton;

/*
 签收协议
 */
@property(nonatomic,strong)UIButton *determineButton;

/*
 温馨提示
 */
@property(nonatomic,strong)UILabel *promptLabel;


@property (nonatomic, strong) UIButton *btn;
@end

@implementation YFOpenASavingsAccountViewController
{
    NSString *realName;
    NSString *idCardNo;
    NSString *bankcardNo;
    NSString *mobile;
    NSString *avalible;
    NSString *userRole;
}
static NSString *cellId = @"YFOpenASavingsAccountTableViewCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"开通存管账户";
    realName=@"";
    idCardNo=@"";
    bankcardNo=@"";
    avalible=@"";
    mobile=@"";
    
    [self configuration];
    
    // Do any additional setup after loading the view.
}

-(void)configuration
{
    [self.view sd_addSubviews:@[self.YFScrollerView]];
    
    self.YFScrollerView.sd_layout
    .topEqualToView(self.view)
    .leftEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(HEIGHT-64);
    
    [self.YFScrollerView sd_addSubviews:@[self.YFTableView,self.downView,self.promptLabel]];
    
    self.YFTableView.sd_layout
    .topEqualToView(self.YFScrollerView)
    .leftEqualToView(self.YFScrollerView)
    .widthIs(WIDTH)
    .heightIs(YF_H(344));
    
    self.downView.sd_layout
    .topSpaceToView(self.YFTableView, YF_H(10))
    .leftEqualToView(self.YFScrollerView)
    .widthIs(WIDTH)
    .heightIs(YF_H(168));
    
    self.promptLabel.sd_layout
    .topSpaceToView(self.downView, YF_H(0))
    .leftSpaceToView(self.YFScrollerView, YF_W(14))
    .widthIs(WIDTH-YF_W(28))
    .heightIs(YF_H(60));
    
    
    [self.downView sd_addSubviews:@[self.determineButton]];
    //     [self.downView sd_addSubviews:@[self.passwordLabel,self.agreementButton,self.determineButton]];
    
    self.passwordLabel.sd_layout
    .topSpaceToView(self.downView, YF_H(10))
    .leftSpaceToView(self.downView, YF_W(14))
    .widthIs(WIDTH-YF_W(28))
    .heightIs(YF_H(17));
    
    self.agreementButton.sd_layout
    .topSpaceToView(self.passwordLabel, YF_H(15))
    .leftSpaceToView(self.downView, YF_W(14))
    .widthIs(WIDTH-YF_W(28))
    .heightIs(YF_H(17));
    
    self.determineButton.sd_layout
    .topSpaceToView(self.agreementButton, YF_H(30))
    .leftSpaceToView(self.downView, YF_W(68))
    .widthIs(WIDTH-YF_W(136))
    .heightIs(YF_H(49));
    
}

#pragma mark - lazy

-(UIScrollView *)YFScrollerView
{
    if (!_YFScrollerView) {
        
        UIScrollView *scrollView=[[UIScrollView alloc] init];
        [scrollView setBounces:YES];
        [scrollView setContentSize:CGSizeMake(0, HEIGHT)];
        scrollView.userInteractionEnabled =YES;
        scrollView.backgroundColor = LIGHTGREYCOLOR;
        scrollView.showsVerticalScrollIndicator = NO;
        _YFScrollerView =scrollView;
    }
    return _YFScrollerView;
}

-(UILabel *)promptLabel
{
    if (!_promptLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.text =@"温馨提示：金城银行不负责审核平台所提供融资人和融资项目的真实性和合法性，不保障融资人和融资项目必然还款，也不保障投资人能够获得融资项目的本金和预期收入。";
        label.numberOfLines=0;
        label.textColor =[YFTool YFColorWithString:@"FF8421"];
        _promptLabel = label;
    }
    return _promptLabel;
}

-(YFBaseTableView *)YFTableView
{
    if (!_YFTableView) {
        YFBaseTableView *tableView= [[YFBaseTableView alloc] init];
        tableView.separatorColor = LIGHTGREYCOLOR;
        tableView.tableFooterView =[UIView new];
        tableView.scrollEnabled=NO;
        tableView.delegate = self;
        tableView.dataSource =self;
        _YFTableView =tableView;
    }
    return _YFTableView;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //    return 5;
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
    if (indexPath.section ==0)
    {
        return YF_H(64);
    }
    if (indexPath.section ==1)
    {
        return YF_H(50);
    }
    if (indexPath.section ==2)
    {
        
        //        if (indexPath.row <=2) {
        return YF_H(50);
        //        }
        //        if (indexPath.row ==3) {
        //            return YF_H(42);
        //        }
        //        else{
        //            return 0;
        //        }
        
    }
    //    if (indexPath.section ==3)
    //    {
    //        if (indexPath.row ==0 ||indexPath.row ==2 ||indexPath.row ==3 ) {
    //            return YF_H(50);
    //        }
    //        if (indexPath.row ==1 ||indexPath.row ==4 ) {
    //            return YF_H(42);
    //        }
    //        else{
    //            return 0;
    //        }
    //
    //    }
    //    if (indexPath.section ==4) {
    //        return YF_H(50);
    //    }
    else{
        return YF_H(0);
    }
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==0)
    {
        return 1;
    }
    if (section ==1)
    {
        return 3;
    }
    if (section ==2)
    {
        
        //       return 4;
        return 2;
        
    }
    //    if (section ==3)
    //    {
    //        return 5;
    //
    //    }
    //    if (section ==4) {
    //        return 2;
    //    }
    else{
        return YF_H(0);
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFOpenASavingsAccountTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFOpenASavingsAccountTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    [cell setterSection:indexPath.section indexPath:indexPath.row];
    [cell.YFtextField addTarget:self action:@selector(textfiledClick:) forControlEvents:UIControlEventEditingChanged];
    [cell.timeButton addTarget:self action:@selector(codeBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}


-(void)textfiledClick:(UITextField *)sender
{
    /*
     section1
     */
    if (sender.tag <10) {
        
        if (sender.tag==0) {
            realName=sender.text;
            
        }
        if (sender.tag==2) {
            idCardNo=sender.text;
        }
        
    }
    /*
     section2
     */
    if (sender.tag>=10 && sender.tag <20) {
        
        if (sender.tag==10) {
            bankcardNo=sender.text;
            
        }
        if (sender.tag==11) {
            mobile=sender.text;
        }
        if (sender.tag==12) {
            avalible=sender.text;
            //            userRole=@"INVESTOR";
        }
    }
    /*
     section3
     */
    if (sender.tag>=20 && sender.tag <30) {
        //        NSLog(@"3333 == %@",sender.text);
    }
    /*
     section4
     */
    if (sender.tag>=30 && sender.tag <40) {
        //        NSLog(@"444 == %@",sender.text);
    }
    NSLog(@"realName == %@  idCardNo==%@  bankcardNo==%@  mobile==%@  avalible==%@",realName,idCardNo,bankcardNo,mobile,avalible);
}

-(void)codeBtn:(TimeButton *)sender
{
    if (realName.length==0) {
        [YFProgressHUD showInfoWithStatus:@"请填写正确的真实姓名"];
        return;
    }
    if ([YFTool IsIdentityCard:idCardNo]==NO) {
        [YFProgressHUD showInfoWithStatus:@"请填写正确的证件号码"];
        return;
    }
    if (bankcardNo.length==0||[YFTool inputShouldNumber:bankcardNo]==NO) {
        [YFProgressHUD showInfoWithStatus:@"请填写正确的银行卡号"];
        return;
    }
    if ([YFTool isValidateMobile:mobile]==NO) {
        [YFProgressHUD showInfoWithStatus:@"请填写正确的预留手机号"];
        return;
    }
    
    sender.userInteractionEnabled=NO;
    [YFSRFManager YFSrfSuccess:^(id json) {
        
        [self Verification:sender srfString:json];
        
    } failure:^(NSError *error) {
        
    }];
    
    
    
    
}

-(void)Verification:(TimeButton *)sender srfString:(NSString *)srfStr
{
    /*
     获取短信验证码
     */
    [YFProgressHUD showWithStatus:nil];
    [YFLoginRequest YFPhoneString:mobile keyCodeString:@"common" timeStampString:[YFTool getTimeNow] srfString:srfStr success:^(id json) {
        if ([YFTool Nsdic:json]==1) {
            NSLog(@"6666 == %@",json);
             [YFProgressHUD showSuccessWithStatus:json[@"message"]];
            [sender timeFailBeginFrom:60];
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
    } failure:^(NSError *error) {
        
    }];
}

-(UIView *)downView
{
    if (!_downView) {
        UIView *view=[[UIView alloc] init];
        view.userInteractionEnabled =YES;
        view.backgroundColor =WHITECOLOR;
        _downView =view;
    }
    return _downView;
}


-(UILabel *)passwordLabel
{
    if (!_passwordLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.text = @"密码由8-16位大小写字母、数字和特殊符号组合，不支持空格";
        label.textColor =[YFTool YFColorWithString:@"999999"];
        _passwordLabel = label;
    }
    return _passwordLabel;
}


-(UIButton *)agreementButton
{
    if (!_agreementButton) {
        UIButton *button=[[UIButton alloc] init];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        button.titleLabel.font = YF_FONT(12);
        NSString *string = @"请确认信息准确后,去签署《金城银行银商存管三方协议》";
        NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithString:string];
        [aString addAttribute:NSForegroundColorAttributeName value:[YFTool YFColorWithString:@"999999"] range:NSMakeRange(0, 12)];
        [aString addAttribute:NSForegroundColorAttributeName value:[YFTool YFColorWithString:@"3987FF"] range:NSMakeRange(12, string.length-12)];
        [button setAttributedTitle:aString forState:UIControlStateNormal];
        [button addTarget:self action:@selector(agreementClick) forControlEvents:UIControlEventTouchUpInside];
        _agreementButton = button;
        
    }
    return _agreementButton;
}

-(void)agreementClick
{
    YFAgreementViewController *YFAgreementVC = [[YFAgreementViewController alloc] init];
    [self.navigationController pushViewController:YFAgreementVC animated:YES];
}


-(UIButton *)determineButton
{
    if (!_determineButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitle:@"去签署协议" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.layer.cornerRadius = YF_W(25);
        button.layer.masksToBounds = YES;
        button.titleLabel.font = YF_FONT(17);
        [button addTarget:self action:@selector(determineClick) forControlEvents:UIControlEventTouchUpInside];
        _determineButton = button;
        
    }
    return _determineButton;
}

-(void)determineClick
{
    if (realName.length==0) {
        [YFProgressHUD showInfoWithStatus:@"请填写真实姓名"];
        return;
    }
    if ([YFTool IsIdentityCard:idCardNo]==NO) {
        [YFProgressHUD showInfoWithStatus:@"请填写证件号码"];
        return;
    }
    if (bankcardNo.length==0) {
        [YFProgressHUD showInfoWithStatus:@"请填写银行卡号"];
        return;
    }
    if ([YFTool isValidateMobile:mobile]==NO) {
        [YFProgressHUD showInfoWithStatus:@"请填写预留手机号"];
        return;
    }
    
    [self open];
    
    
    //    [self.navigationController popViewControllerAnimated:YES];
    //
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        /*
    //         成功
    //         */
    //       [self.OpenAnAccountDelegate OpenAnAccount];
    //
    //    });
    
}


-(void)open
{
    
    
    
    if ([[YFTool userDefaultsId:YFisDepository] integerValue]==1) {
        
        [YFHomePageRequest YFHomeRealNameString:realName idCardNoString:idCardNo bankcardNoString:bankcardNo mobileString:mobile userRoleString:@"BORROWERS" success:^(id json) {
            
            
            
            if ([YFTool Nsdic:json]==1) {
                NSLog(@"222= = %@",json);
                
                YFOpenASavingsWebViewController *YFOpenASavingsWebVC=[[YFOpenASavingsWebViewController alloc] init];
                YFOpenASavingsWebVC.urlString=[json objectForKey:@"data"];
                
                [self.navigationController pushViewController:YFOpenASavingsWebVC animated:YES];
                
                
                
            }
            else{
                [YFProgressHUD showInfoWithStatus:MESSAGE];
            }
            
        } failure:^(NSError *error) {
            
        }];
        
        return;
    }
    
    [YFHomePageRequest YFHomeRealNameString:realName idCardNoString:idCardNo bankcardNoString:bankcardNo mobileString:mobile userRoleString:@"INVESTOR" success:^(id json) {
        
        [YFProgressHUD showWithStatus:nil];
        if ([YFTool Nsdic:json]==1) {
            NSLog(@"222= = %@",[json objectForKey:@"data"]);
            
            YFOpenASavingsWebViewController *YFOpenASavingsWebVC=[[YFOpenASavingsWebViewController alloc] init];
            YFOpenASavingsWebVC.urlString=[json objectForKey:@"data"];
            YFOpenASavingsWebVC.realNameString=realName;
            YFOpenASavingsWebVC.idCardNoString=idCardNo;
            YFOpenASavingsWebVC.bankcardNoString=bankcardNo;
            YFOpenASavingsWebVC.mobileString=mobile;
            [self.navigationController pushViewController:YFOpenASavingsWebVC animated:YES];
            
            
            
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
- (UIButton *)btn
{
    if (_btn == nil) {
        UIButton *button=[[UIButton alloc] init];
        button.titleLabel.font = YF_FONT(12);
        [button setTitle:@"" forState:UIControlStateNormal];
  
        [button setTitleColor:[YFTool YFColorWithString:@"3987FF"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(agreementClick) forControlEvents:UIControlEventTouchUpInside];
        [button sizeToFit];
        _btn = button;
    }
    return _btn;
}

@end

