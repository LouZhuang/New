//
//  YFForgotPasswordViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFForgotPasswordViewController.h"

@interface YFForgotPasswordViewController ()<UITableViewDelegate,UITableViewDataSource>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;
/*
 按钮
 */
@property(nonatomic,strong)UIButton *YFButton;

@end

@implementation YFForgotPasswordViewController
{
    NSString *idCard;
    NSString *valid;
}
static NSString *cellId = @"YFForgotPasswordTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"忘记登录密码";
    idCard=@"";
    valid=@"";
    [self configuration];
    // Do any additional setup after loading the view.
}


-(void)configuration
{
    [self.view sd_addSubviews:@[self.YFTableView,self.YFButton]];
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, YF_H(0))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(YF_H(210));
    
    self.YFButton.sd_layout
    .topSpaceToView(self.view, YF_H(274))
    .leftSpaceToView(self.view, YF_W(68))
    .widthIs(WIDTH-YF_W(136))
    .heightIs(YF_H(49));
    
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
    return 1;
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
    
    return YF_H(50);
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 4;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFForgotPasswordTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFForgotPasswordTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    [cell setterIndex:indexPath.row nameString:_nameString idString:@"中华人民共和国身份证"];
    
    [cell.YFTextField addTarget:self action:@selector(textClick:) forControlEvents:UIControlEventEditingChanged];
    [cell.timeButton addTarget:self action:@selector(codeBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
    
}

-(void)textClick:(UITextField *)sener
{
    if (sener.tag==2) {
        idCard=sener.text;
    }
    if (sener.tag==3) {
        valid=sener.text;
    }
    
    NSLog(@"111 == %@ 222 == %@",idCard,valid);
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
        [button setTitle:@"下一步" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.layer.cornerRadius = YF_W(25);
        button.layer.masksToBounds = YES;
        button.titleLabel.font = YF_FONT(17);
        [button addTarget:self action:@selector(theNextStepClick) forControlEvents:UIControlEventTouchUpInside];
        _YFButton = button;
        
    }
    return _YFButton;
}

-(void)theNextStepClick
{
    if (idCard.length==0) {
        [YFProgressHUD showInfoWithStatus:@"请输入正确的身份证号"];
        return;
    }
    if (valid.length==0) {
        [YFProgressHUD showInfoWithStatus:@"请输入正确的验证码"];
        return;
    }
    
    /*
     验证码验证
     */
    [YFProgressHUD showWithStatus:nil];
    [YFLoginRequest YFPhoneString:_phoneString keyCodeString:@"common" smsCodeString:valid success:^(id json) {
        if ([YFTool Nsdic:json]==1) {
            
            [YFProgressHUD showSuccessWithStatus:MESSAGE];
            /*
             验证身份证号
             */
            [self verifyIdCard];
            
        }
        else{
            
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
    } failure:^(NSError *error) {
        
    }];
    
   
    
}

-(void)verifyIdCard
{
    [YFProgressHUD showWithStatus:nil];
    [YFMineRequest YFValidIdCardcardnoString:idCard phoneString:_phoneString success:^(id json) {
        
        NSLog(@"====%@",json);
        if ([YFTool Nsdic:json]==1) {
            
            YFForgotPasswordChangeViewController *YFForgotPasswordChangeVC=[[YFForgotPasswordChangeViewController alloc] init];
            YFForgotPasswordChangeVC.nameString=_nameString;
            YFForgotPasswordChangeVC.phoneString=_phoneString;
            YFForgotPasswordChangeVC.idCardString=idCard;
            [self.navigationController pushViewController:YFForgotPasswordChangeVC animated:YES];
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

-(void)codeBtn:(TimeButton *)sender
{
    
    
    [YFSRFManager YFSrfSuccess:^(id json) {
        
        [self Verification:sender srfString:json];
        
    } failure:^(NSError *error) {
        
    }];
    
   
   
}


-(void)Verification:(TimeButton *)sender srfString:(NSString *)srfStr
{
    [YFProgressHUD showWithStatus:nil];
    [YFLoginRequest YFPhoneString:_phoneString keyCodeString:@"common" timeStampString:[YFTool getTimeNow] srfString:srfStr success:^(id json) {
        if ([YFTool Nsdic:json]==1) {
             [YFProgressHUD showSuccessWithStatus:json[@"message"]];
            [sender timeFailBeginFrom:60];
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
