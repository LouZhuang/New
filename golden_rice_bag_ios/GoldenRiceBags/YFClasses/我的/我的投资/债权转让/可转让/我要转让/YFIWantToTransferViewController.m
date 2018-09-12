//
//  YFIWantToTransferViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFIWantToTransferViewController.h"

@interface YFIWantToTransferViewController ()<UITableViewDelegate,UITableViewDataSource>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;


/*
 同意政策勾选按钮
 */
@property(nonatomic,strong)UIButton *agreedButton;

/*
 我已同意并签署《债权转让协议》
 */
@property(nonatomic,strong)UIButton *agreementButton;

/*
 发布转让
 */
@property(nonatomic,strong)UIButton *YFButton;


@end

@implementation YFIWantToTransferViewController
static NSString *cellId = @"YFCreditorsRightsTransferCanTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我要转让";
    self.view.backgroundColor=WHITECOLOR;
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
    
    [self.view sd_addSubviews:@[self.YFTableView,self.agreedButton,self.agreementButton,self.YFButton]];
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, YF_H(0))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(HEIGHT - 64);
    
    self.agreedButton.sd_layout
    .leftSpaceToView(self.view, YF_W(14))
    .topSpaceToView(self.view, YF_H(367))
    .widthIs(YF_W(16))
    .heightIs(YF_H(16));
    
    self.agreementButton.sd_layout
    .leftSpaceToView(self.agreedButton, YF_W(6))
    .topSpaceToView(self.view, YF_H(366))
    .widthIs(YF_W(200))
    .heightIs(YF_H(17));
    
    self.YFButton.sd_layout
    .bottomEqualToView(self.view)
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(YF_H(49));
}

-(void)rulesClick
{
//    [YFProgressHUD showInfoWithStatus:@"规则说明"];
//    if (![self.dataDic[@"baseDetail"][@"reserve3"] isEqualToString:@"NOSIGN"]) {
//        RHWebViewController *vc = [[RHWebViewController alloc]init];
//        vc.webUrl = self.dataDic[@"baseDetail"][@"reserve3"];
//        vc.title = @"金米袋网借款协议";
//        [self.navigationController pushViewController:vc animated:YES];
//    }else{
//        [YFProgressHUD showInfoWithStatus:@"未签署借款合同"];
//    }
    RHWebViewController *vc = [[RHWebViewController alloc]init];
    vc.isWord = YES;
    vc.pathUrl = [[NSBundle mainBundle]pathForResource:@"债转规则" ofType:@"docx"];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)agreementClick
{
//    [YFProgressHUD showInfoWithStatus:@"债权转让"];
    RHWebViewController *vc = [[RHWebViewController alloc]init];
    vc.isWord = YES;
    vc.pathUrl = [[NSBundle mainBundle]pathForResource:@"债权转让合同-平台投资人" ofType:@"docx"];
    [self.navigationController pushViewController:vc animated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return YF_H(10);
    
    
    
}

-(YFBaseTableView *)YFTableView
{
    if (!_YFTableView) {
        YFBaseTableView *tableView= [[YFBaseTableView alloc] init];
        tableView.separatorColor = LIGHTGREYCOLOR;
        tableView.tableFooterView = [UIView new];
        tableView.scrollEnabled=NO;
        tableView.delegate = self;
        tableView.dataSource =self;
        _YFTableView =tableView;
    }
    return _YFTableView;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return YF_H(50);
    }
    else{
        return YF_H(37);
    }
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 9;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFCreditorsRightsTransferCanTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFCreditorsRightsTransferCanTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    [cell setterWantToTransferIndex:indexPath.row IndexSection:indexPath.section CreditorsRightsTransferModel:self.model];
    
    
    
    return cell;
    
}

-(void)canClick:(UIButton *)sender
{
    YFIWantToTransferViewController *YFIWantToTransferVC=[[YFIWantToTransferViewController alloc]init];
    [self.navigationController pushViewController:YFIWantToTransferVC animated:YES];
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}


-(UIButton *)agreedButton
{
    if (!_agreedButton) {
        UIButton *button=[[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"loginAgreedNoSelectImage"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"loginAgreedSelectImage"] forState:UIControlStateSelected];
        [button setEnlargeEdge:YF_W(21)];
        [button addTarget:self action:@selector(agreedClick:) forControlEvents:UIControlEventTouchUpInside];
        _agreedButton = button;
        
    }
    return _agreedButton;
}

-(void)agreedClick:(UIButton *)sender
{
    sender.selected = !sender.selected;

}

-(UIButton *)agreementButton
{
    if (!_agreementButton) {
        UIButton *button=[[UIButton alloc] init];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        button.titleLabel.font = YF_FONT(12);
        NSString *string = @"我已同意并签署《债权转让协议》";
        NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithString:string];
        [aString addAttribute:NSForegroundColorAttributeName value:[YFTool YFColorWithString:@"999999"] range:NSMakeRange(0, 7)];
        [aString addAttribute:NSForegroundColorAttributeName value:[YFTool YFColorWithString:@"3987FF"] range:NSMakeRange(7, string.length-7)];
        [button setAttributedTitle:aString forState:UIControlStateNormal];
        [button addTarget:self action:@selector(agreementClick) forControlEvents:UIControlEventTouchUpInside];
        _agreementButton = button;
        
    }
    return _agreementButton;
}


-(UIButton *)YFButton
{
    if (!_YFButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitle:@"发布转让" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(17);
        [button addTarget:self action:@selector(closeClick) forControlEvents:UIControlEventTouchUpInside];
        _YFButton = button;
        
    }
    return _YFButton;
}

-(void)closeClick
{
    if (self.agreedButton.selected ==NO) {
        [YFProgressHUD showInfoWithStatus:@"请签署债权转让协议"];
        return;
    }
    
    [YFProgressHUD showWithStatus:nil];
    
    [YFSRFManager YFSrfSuccess:^(id json) {
        
        [self verificationsrfString:json];
        
    } failure:^(NSError *error) {
        
    }];
   
    
}



-(void)verificationsrfString:(NSString *)srfStr
{
    /*
     获取短信验证码
     */
    [YFMineRequest YFInvestmentTransferDeliveryString:self.model.id andSrf:srfStr  success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            [YFProgressHUD showSuccessWithStatus:@"转让成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
    } failure:^(NSError *error) {
        
    }];
 
    
    
}



/*
 数据请求
 */
-(void)DataRequest
{
    
    [YFMineRequest YFInvestmentTransferDataIdString:self.model.id success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            
            NSLog(@"323232 == %@",json);
            
            NSDictionary *dataDic=[json objectForKey:@"data"];
            [self.model setValuesForKeysWithDictionary:dataDic];

            [self.YFTableView reloadData];
            
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
