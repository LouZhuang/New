//
//  YFMineBnakCardNoViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/25.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFMineBnakCardNoViewController.h"

@interface YFMineBnakCardNoViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate,YFCustomOpenTheDepositoryDelegate,YFOpenAnAccountDelegate>

@property(nonatomic,strong)UIView *footerView;

@property(nonatomic,strong)UILabel *footerLabel;

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;
/*
 开通弹窗
 */

@property (nonatomic,strong)YFCustomOpenTheDepositoryView *CustomOpenTheDepositoryView;


/*
 成功弹窗
 */
@property (nonatomic,strong)YFCustomSuccessView *CustomSuccessView;
@property(nonatomic,strong)YFMineBnakCardModel *model;
/*
 Down
 */
@property(nonatomic,strong)UIImageView *fgImageView;

@property(nonatomic,strong)UILabel *tittleLabel;

/*
 添加
 */
@property(nonatomic,strong)UIButton *YFButton;
/*
 
 */
@property(nonatomic,strong)UIButton *aboutButton;


/*
 Down
 */
@property(nonatomic,strong)UIImageView *DownImageView;
@end

@implementation YFMineBnakCardNoViewController
{
    NSInteger total;
}
static NSString *cellId = @"YFMineBnakCardTableViewCell";
-(void)viewWillAppear:(BOOL)animated
{
    /*
     数据请求
     */
    [self DataRequest];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"银行卡";
    self.view.backgroundColor=WHITECOLOR;
    [self configuration];
    
    
    // Do any additional setup after loading the view.
}

-(void)configuration
{
    total=0;
    [self.view sd_addSubviews:@[self.fgImageView,self.DownImageView,self.tittleLabel,self.YFButton,self.aboutButton,self.YFTableView,self.footerView]];

    self.DownImageView.sd_layout
    .topSpaceToView(self.view, YF_H(0))
    .centerXEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(10));
    
    self.DownImageView.sd_layout
    .topSpaceToView(self.view, YF_H(55))
    .centerXEqualToView(self.view)
    .widthIs(YF_W(120))
    .heightIs(YF_H(73));
    
    self.tittleLabel.sd_layout
    .topSpaceToView(self.view, YF_H(136))
    .leftSpaceToView(self.view, YF_W(14))
    .widthIs(WIDTH-YF_W(28))
    .heightIs(YF_H(20));
    
    self.YFButton.sd_layout
    .topSpaceToView(self.view, YF_H(206))
    .leftSpaceToView(self.view, YF_W(68))
    .widthIs(WIDTH-YF_W(136))
    .heightIs(YF_H(49));
    
    self.aboutButton.sd_layout
    .topSpaceToView(self.view, YF_H(260))
    .leftSpaceToView(self.view, YF_W(68))
    .widthIs(WIDTH-YF_W(136))
    .heightIs(YF_H(37));
    
    
    self.footerView.sd_layout
    .bottomEqualToView(self.view)
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(YF_H(110));
    
    [self.footerView sd_addSubviews:@[self.footerLabel]];
    
    self.footerLabel.sd_layout
    .centerYEqualToView(self.footerView)
    .leftSpaceToView(self.footerView, YF_W(14))
    .widthIs(WIDTH-YF_W(28))
    .heightIs(YF_H(80));
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, YF_H(0))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(YF_H(400));
    
    
}

-(YFBaseTableView *)YFTableView
{
    if (!_YFTableView) {
        YFBaseTableView *tableView= [[YFBaseTableView alloc] init];
        tableView.separatorColor = LIGHTGREYCOLOR;
        tableView.backgroundColor=WHITECOLOR;
        tableView.tableFooterView = [UIView new];
        tableView.delegate = self;
        tableView.hidden=YES;
        tableView.dataSource =self;
        tableView.scrollEnabled=NO;
        _YFTableView =tableView;
    }
    return _YFTableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        
        return YF_H(1);
    }
    else{
        return YF_H(0);
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
    if (indexPath.section==0) {
        return YF_H(156);
    }
    else{
        return YF_H(0);
    }
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFMineBnakCardTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFMineBnakCardTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    if (total==1) {
        
        [cell setterSction:indexPath.section MineBnakCardModel:self.model];
    }
    
    return cell;
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section==0) {
        //创建actionSheet对象
        UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"解绑",@"更改银行预留手机号", nil];
        //actionSheet样式
        sheet.actionSheetStyle = UIActionSheetStyleAutomatic;
        //显示
        [sheet showInView:self.view];
        sheet.delegate = self;
        
        
    }
//    if (indexPath.section==1) {
//
//    YFMineBnakCardAddViewController *YFMineBnakCardAddVC=[[YFMineBnakCardAddViewController alloc] init];
//    YFMineBnakCardAddVC.type=1;
//    YFMineBnakCardAddVC.title=@"更换银行卡";
//    [self.navigationController pushViewController:YFMineBnakCardAddVC animated:YES];
//
//    }
    
}


//actionSheet代理方法
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        YFUnbindBankCardViewController *YFUnbindBankCardVC=[[YFUnbindBankCardViewController alloc] init];
        YFUnbindBankCardVC.type=1;
        [self.navigationController pushViewController:YFUnbindBankCardVC animated:YES];
    }
    if (buttonIndex == 1) {
        /*
         更换预留手机号
         */
        [self UnBindCard];
    }
    if (buttonIndex == 2) {
        NSLog(@"点击取消");
    }
}

-(void)UnBindCard
{
    [YFMineRequest YFSwitchPrePhoneTypeString:@"1" success:^(id json) {
        if ([YFTool Nsdic:json]==1) {
            NSLog(@"====%@",json);
                
                YFUnbindBankCardWebViewController *YFOpenASavingsWebVC=[[YFUnbindBankCardWebViewController alloc] init];
                YFOpenASavingsWebVC.urlString=[json objectForKey:@"data"];
                YFOpenASavingsWebVC.title=@"更换预留手机号";
                [self.navigationController pushViewController:YFOpenASavingsWebVC animated:YES];
            
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
    } failure:^(NSError *error) {
        
    }];
}



-(UIImageView *)fgImageView
{
    if (!_fgImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor=LIGHTGREYCOLOR;
         imageView.hidden=YES;
        _fgImageView = imageView;
    }
    return _fgImageView;
}

-(UIImageView *)DownImageView
{
    if (!_DownImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image=[UIImage imageNamed:@"nobankcardImage"];
        imageView.userInteractionEnabled =YES;
        imageView.hidden=YES;
        _DownImageView = imageView;
    }
    return _DownImageView;
}


-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF666;
        label.hidden=YES;
        label.textAlignment=NSTextAlignmentCenter;;
        label.text=@"您还没有添加银行卡哦";
        _tittleLabel = label;
    }
    return _tittleLabel;
}


-(UIButton *)YFButton
{
    if (!_YFButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitle:@"添加银行卡" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.layer.cornerRadius = YF_W(25);
        button.layer.masksToBounds = YES;
        button.hidden=YES;
        button.titleLabel.font = YF_FONT(17);
        [button addTarget:self action:@selector(theNextStepClick) forControlEvents:UIControlEventTouchUpInside];
        _YFButton = button;
        
    }
    return _YFButton;
}

-(void)theNextStepClick
{
    
    if ([[YFTool userDefaultsId:YFisDepository] integerValue]==0 ||[[YFTool userDefaultsId:YFisDepositoryB] integerValue]==0) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        _CustomOpenTheDepositoryView =[[YFCustomOpenTheDepositoryView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
        _CustomOpenTheDepositoryView.OpenTheDepositoryDelegate=self;
        [window addSubview:_CustomOpenTheDepositoryView];
        
        return;
    }

    YFMineBnakCardAddViewController *YFMineBnakCardAddVC=[[YFMineBnakCardAddViewController alloc] init];
    YFMineBnakCardAddVC.type=1;
    YFMineBnakCardAddVC.title=@"添加银行卡";
    [self.navigationController pushViewController:YFMineBnakCardAddVC animated:YES];
 
    
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
/*
 开户成功代理
 */
-(void)OpenAnAccount
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    _CustomSuccessView =[[YFCustomSuccessView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    [window addSubview:_CustomSuccessView];
}


-(UIButton *)aboutButton
{
    if (!_aboutButton) {
        UIButton *button=[[UIButton alloc] init];
        [button setTitle:@"支持银行卡及限额说明《银行限额》" forState:UIControlStateNormal];
        [button setTitleColor:[YFTool YFColorWithString:@"3987FF"] forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(12);
        button.hidden=YES;
        [button addTarget:self action:@selector(aboutClick) forControlEvents:UIControlEventTouchUpInside];
        _aboutButton = button;
        
    }
    return _aboutButton;
}

-(void)aboutClick
{
//    [YFProgressHUD showSuccessWithStatus:@"支持银行及限额说明"];
    
    RHWebViewController *vc = [[RHWebViewController alloc]init];
    vc.title = @"支持银行卡及限额说明";
    vc.pathUrl = [[NSBundle mainBundle]pathForResource:@"银行限额" ofType:@"html"];
    [self.navigationController pushViewController:vc animated:YES];
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



-(UILabel *)footerLabel
{
    if (!_footerLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF999;
        label.numberOfLines=0;
        label.text=@"温馨提示：\n为增强账户安全，每个用户仅能绑定一张银行卡；\n有提现处理中交易时不允许删除银行卡；\n 如有疑问，请联系客服：400-000-0663(工作日9:00-18:00)";
        _footerLabel = label;
    }
    return _footerLabel;
}


/*
 数据请求
 */
-(void)DataRequest
{
    [YFMineRequest YFBankCardTypeString:@"1" success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
           
            NSLog(@"bankCard == %@",json);
            
            NSDictionary *dataDic=[json objectForKey:@"data"];
            total=[[NSString stringWithFormat:@"%@",[dataDic objectForKey:@"total"]] integerValue];
            if (total==0) {
                
                self.fgImageView.hidden=NO;
                self.DownImageView.hidden=NO;
                self.tittleLabel.hidden=NO;
                self.YFButton.hidden=NO;
                self.aboutButton.hidden=NO;
                
                self.YFTableView.hidden=YES;
                
            }
            if (total==1) {
                
                self.fgImageView.hidden=YES;
                self.DownImageView.hidden=YES;
                self.tittleLabel.hidden=YES;
                self.YFButton.hidden=YES;
                self.aboutButton.hidden=YES;
                
                self.YFTableView.hidden=NO;
                
                NSDictionary *bankDic=[dataDic objectForKey:@"bank"];
                self.model=[[YFMineBnakCardModel alloc]init];
                [self.model setValuesForKeysWithDictionary:bankDic];
                
                [self.YFTableView reloadData];
                
            }
            
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
