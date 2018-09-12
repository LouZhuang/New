//
//  YFChangeThePaymentPasswordOneViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/10.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFChangeThePaymentPasswordOneViewController.h"

@interface YFChangeThePaymentPasswordOneViewController ()<UITableViewDelegate,UITableViewDataSource>
/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;
@end

@implementation YFChangeThePaymentPasswordOneViewController
static NSString *cellId = @"YFChangeThePaymentPasswordTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=WHITECOLOR;
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
    .heightIs(YF_H(100));
}

-(YFBaseTableView *)YFTableView
{
    if (!_YFTableView) {
        YFBaseTableView *tableView= [[YFBaseTableView alloc] init];
        tableView.separatorColor = LIGHTGREYCOLOR;
        tableView.backgroundColor=WHITECOLOR;
        tableView.tableFooterView = [UIView new];
        tableView.delegate = self;
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
  
    return YF_H(1);

    
    
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
    
    YFChangeThePaymentPasswordTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFChangeThePaymentPasswordTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    [cell setterIndexRow:indexPath.row];

    return cell;
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.row==0) {
        
       [self statusString:@"1"];
        
    }
    if (indexPath.row==1) {
        
       
        [self statusString:@"0"];
    }
    
}


-(void)statusString:(NSString *)status
{
    [YFProgressHUD showWithStatus:nil];
    [YFMineRequest YFModifyTradePasswordTypeString:@"1" statusString:status success:^(id json) {
        if ([YFTool Nsdic:json]==1) {
            NSLog(@"====%@",json);
                
                YFUnbindBankCardWebViewController *YFOpenASavingsWebVC=[[YFUnbindBankCardWebViewController alloc] init];
                YFOpenASavingsWebVC.urlString=[json objectForKey:@"data"];
                YFOpenASavingsWebVC.title=@"修改存管交易密码";
                YFOpenASavingsWebVC.changePassWordType=6;
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

@end
