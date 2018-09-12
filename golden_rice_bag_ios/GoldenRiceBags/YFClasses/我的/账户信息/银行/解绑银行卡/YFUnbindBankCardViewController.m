//
//  YFUnbindBankCardViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/25.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFUnbindBankCardViewController.h"

@interface YFUnbindBankCardViewController ()<UITableViewDelegate,UITableViewDataSource>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;
/*
 按钮
 */
@property(nonatomic,strong)UIButton *YFButton;

@end

@implementation YFUnbindBankCardViewController
{
    NSString *cardno;
}
static NSString *cellId = @"YFForgotPasswordTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"解绑银行卡";
    [self configuration];
    // Do any additional setup after loading the view.
}


-(void)configuration
{
    cardno=@"";
    [self.view sd_addSubviews:@[self.YFTableView,self.YFButton]];
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, YF_H(0))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(YF_H(210));
    
    self.YFButton.sd_layout
    .topSpaceToView(self.view, YF_H(223))
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
    
    return 3;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFUnbindBankCardTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFUnbindBankCardTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    [cell setterIndex:indexPath.row nameString:[YFTool nameString:[YFTool userDefaultsId:YFNICK]] idString:@"中华人民共和国身份证"];
    
    [cell.YFTextField addTarget:self action:@selector(textClick:) forControlEvents:UIControlEventEditingChanged];
  
    
    return cell;
    
}

-(void)textClick:(UITextField *)sener
{
    NSLog(@"22 == %@",sener.text);
    cardno=sener.text;
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
        [button setTitle:@"确认" forState:UIControlStateNormal];
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
    if (cardno.length==0 ) {
        [YFProgressHUD showInfoWithStatus:@"请输入正确的银行卡卡号"];
        return;
    }
    [YFProgressHUD showWithStatus:nil];
    [YFMineRequest YFValidIdCardcardnoString:cardno phoneString:[YFTool userDefaultsId:YFPHONE] success:^(id json) {
        
        NSLog(@"====%@",json);
        if ([YFTool Nsdic:json]==1) {
            

            
            /*
             解绑
             */
            [self UnBindCard];
         
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
    } failure:^(NSError *error) {
        
    }];
    
}

-(void)UnBindCard
{
    [YFMineRequest YFUnBindCardTypeString:[NSString stringWithFormat:@"%ld",_type] success:^(id json) {
       if ([YFTool Nsdic:json]==1) {
        NSLog(@"====%@",json);

//            YFUnbindBankCardWebViewController *YFOpenASavingsWebVC=[[YFUnbindBankCardWebViewController alloc] init];
//            YFOpenASavingsWebVC.urlString=[json objectForKey:@"data"];
//            YFOpenASavingsWebVC.title=self.title;
//            [self.navigationController pushViewController:YFOpenASavingsWebVC animated:YES];
        
           [self.navigationController popViewControllerAnimated:YES];
           [YFProgressHUD showSuccessWithStatus:@"解绑成功"];
           
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
