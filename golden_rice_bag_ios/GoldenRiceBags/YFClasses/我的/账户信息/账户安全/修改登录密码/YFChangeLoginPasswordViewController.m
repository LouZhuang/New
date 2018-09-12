//
//  YFChangeLoginPasswordViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFChangeLoginPasswordViewController.h"
#import "YFLoginManager.h"

@interface YFChangeLoginPasswordViewController ()<UITableViewDelegate,UITableViewDataSource>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;
/*
 确定修改按钮
 */
@property(nonatomic,strong)UIButton *YFButton;

@end

@implementation YFChangeLoginPasswordViewController

{
    NSString *oldPassWordString;
    NSString *newPassWordString;
}
static NSString *cellId = @"YFChangeLoginPasswordTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"修改登录密码";
    oldPassWordString=@"";
    newPassWordString=@"";
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
    
    [cell setterIndex:indexPath.row];
    
    [cell.YFTextField addTarget:self action:@selector(textClick:) forControlEvents:UIControlEventEditingChanged];
    
    return cell;
    
}

-(void)textClick:(UITextField *)sender
{
    if (sender.tag==0) {
        oldPassWordString=sender.text;
    }
    if (sender.tag==1) {
        newPassWordString=sender.text;
    }
    NSLog(@"22 == %@  33 == %@",oldPassWordString,newPassWordString);
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
    if (oldPassWordString.length==0) {
        [YFProgressHUD showInfoWithStatus:@"请输入原登录密码"];
        return;
    }
    if (newPassWordString.length==0) {
        [YFProgressHUD showInfoWithStatus:@"请输入新登录密码"];
        return;
    }
    if ([YFTool judgePassWordLegal:oldPassWordString]==NO) {
        [YFProgressHUD showInfoWithStatus:@"原登录密码格式错误"];
        return;
    }
    if ([YFTool judgePassWordLegal:newPassWordString]==NO) {
        [YFProgressHUD showInfoWithStatus:@"新登录密码格式错误"];
        return;
    }
    
    /*
     验证原登录密码
     */
    [YFProgressHUD showWithStatus:nil];
    [YFMineRequest YFPasswordString:oldPassWordString IdString:[YFTool userDefaultsId:YFID] success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            [YFProgressHUD showSuccessWithStatus:@"原登录密码验证成功"];
            /*
             替换新密码
             */
            [self ReplaceTheNewPassword];
           
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
    } failure:^(NSError *error) {
        
    }];
    
    
}

-(void)ReplaceTheNewPassword
{
    [YFProgressHUD showWithStatus:nil];
    [YFMineRequest YFPasswordString:oldPassWordString NewPasswordString:newPassWordString IdString:[YFTool userDefaultsId:YFID] success:^(id json) {
        if ([YFTool Nsdic:json]==1) {
            
            [YFProgressHUD showSuccessWithStatus:@"新登录密码修改成功"];
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                [self.navigationController popViewControllerAnimated:YES];
//            });
            
             [YFLoginManager showLogViewVC];
            
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

