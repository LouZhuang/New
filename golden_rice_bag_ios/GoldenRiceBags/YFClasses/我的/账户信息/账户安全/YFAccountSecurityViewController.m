//
//  YFAccountSecurityViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/19.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFAccountSecurityViewController.h"

@interface YFAccountSecurityViewController ()<UITableViewDelegate,UITableViewDataSource,YFCustomOpenTheDepositoryDelegate,YFOpenAnAccountDelegate>

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

@end

@implementation YFAccountSecurityViewController

static NSString *cellId = @"YFAccountSecurityTableViewCell";

-(void)viewWillAppear:(BOOL)animated
{
    [self.YFTableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"账户安全";
    [self configuration];
    // Do any additional setup after loading the view.
}

-(void)configuration
{
    [self.view sd_addSubviews:@[self.YFTableView]];
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, YF_H(0))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(HEIGHT -64);
    
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
    
    return 5;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFAccountSecurityTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFAccountSecurityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    
    NSString *phone = [YFTool userDefaultsId:YFPHONE];
    if (phone.length) {
         [cell setterIndex:indexPath.row certificationString:@"未认证" phoneString:[phone stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"]];
    }else{
        [cell setterIndex:indexPath.row certificationString:@"未认证" phoneString:@""];

    }
  
    
    [cell.changeButton addTarget:self action:@selector(changClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
    
}

-(void)changClick:(UIButton *)sener
{
    if (sener.tag ==1) {
        
        [YFSRFManager YFSrfSuccess:^(id json) {
            
            [self Verification:sener srfString:json];
            
        } failure:^(NSError *error) {
            
        }];
        
       
    }
    if (sener.tag ==2) {
        YFChangeLoginPasswordViewController *YFChangeLoginPasswordVC=[[YFChangeLoginPasswordViewController alloc]init];
        [self.navigationController pushViewController:YFChangeLoginPasswordVC animated:YES];
    }
    if (sener.tag ==3) {
        YFChangeThePaymentPasswordViewController *YFChangeThePaymentPasswordVC=[[YFChangeThePaymentPasswordViewController alloc] init];
        [self.navigationController pushViewController:YFChangeThePaymentPasswordVC animated:YES];
        
        
    }
}

-(void)Verification:(UIButton *)sender srfString:(NSString *)srfStr
{
    
    [YFLoginRequest YFPhoneString:[YFTool userDefaultsId:YFPHONE] keyCodeString:@"common" timeStampString:[YFTool getTimeNow] srfString:srfStr success:^(id json) {
        if ([YFTool Nsdic:json]==1) {
            [YFProgressHUD showSuccessWithStatus:json[@"message"]];
            
            YFModifyPhoneNumberViewController *YFModifyPhoneNumberVC=[[YFModifyPhoneNumberViewController alloc] init];
            YFModifyPhoneNumberVC.phoneString=[YFTool userDefaultsId:YFPHONE];
            [self.navigationController pushViewController:YFModifyPhoneNumberVC animated:YES];
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
    } failure:^(NSError *error) {
        
    }];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
 
    if (indexPath.row==0) {
        if ([[YFTool userDefaultsId:YFisDepository] integerValue]==0 || [[YFTool userDefaultsId:YFisDepositoryB] integerValue]==0) {
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            _CustomOpenTheDepositoryView =[[YFCustomOpenTheDepositoryView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
            _CustomOpenTheDepositoryView.OpenTheDepositoryDelegate=self;
            [window addSubview:_CustomOpenTheDepositoryView];
        }
        
    }
    
        if (indexPath.row==4) {
            
            YFAuthorizationViewController *YFAccountSecurityVC=[[YFAuthorizationViewController alloc]init];
            [self.navigationController pushViewController:YFAccountSecurityVC animated:YES];
        }
    

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
