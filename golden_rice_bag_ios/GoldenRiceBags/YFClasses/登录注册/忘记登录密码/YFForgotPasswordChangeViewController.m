//
//  YFForgotPasswordChangeViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFForgotPasswordChangeViewController.h"

@interface YFForgotPasswordChangeViewController ()<UITableViewDelegate,UITableViewDataSource>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;
/*
 确定修改按钮
 */
@property(nonatomic,strong)UIButton *YFButton;

@end

@implementation YFForgotPasswordChangeViewController
{
    NSString *newPassWord;
    NSString *again;
}
static NSString *cellId = @"YFChangeLoginPasswordTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad]; self.title=@"忘记登录密码";
    newPassWord=@"";
    again=@"";
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
    .heightIs(YF_H(110));
    
    self.YFButton.sd_layout
    .topSpaceToView(self.view, YF_H(172))
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
    
    return 2;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFChangeLoginPasswordTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFChangeLoginPasswordTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    [cell setterForgotPasswordChangeIndex:indexPath.row];
    
    [cell.YFTextField addTarget:self action:@selector(textClick:) forControlEvents:UIControlEventEditingChanged];
    
    return cell;
    
}

-(void)textClick:(UITextField *)sener
{
    if (sener.tag==0) {
        newPassWord=sener.text;
    }
    if (sener.tag==1) {
        again=sener.text;
    }
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
        [button setTitle:@"确认修改" forState:UIControlStateNormal];
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
    
    if ([YFTool judgePassWordLegal:newPassWord]==NO) {
        [YFProgressHUD showInfoWithStatus:@"请输入正确的新密码"];
        return;
    }
    if ([YFTool judgePassWordLegal:again]==NO) {
        [YFProgressHUD showInfoWithStatus:@"请输入正确的确认密码"];
        return;
    }
    if (![newPassWord isEqualToString:again]) {
        [YFProgressHUD showInfoWithStatus:@"两次密码输入不同"];
        return;
    }
    NSRange range = [again rangeOfString:_phoneString];
    if (range.location!=NSNotFound) {
        [YFProgressHUD showInfoWithStatus:@"密码中不能包含手机号"];
        
        return;
    }
    
    [YFProgressHUD showWithStatus:nil];
    
    NSString *idCard=@"";
    if (_nameString.length!=0) {
        idCard=_idCardString;
    }
    
    [YFLoginRequest YFForgetPasswordUsernameString:_phoneString realNameString:_nameString idcardString:idCard newPasswordString:again success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            
            [YFProgressHUD showSuccessWithStatus:@"密码设置成功"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                for (UIViewController *controller in self.navigationController.viewControllers) {
                    if ([controller isKindOfClass:[YFLoginViewController class]]) {
                        
                        [self.navigationController popToViewController:controller animated:YES];
                        
                    } }
            });
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
