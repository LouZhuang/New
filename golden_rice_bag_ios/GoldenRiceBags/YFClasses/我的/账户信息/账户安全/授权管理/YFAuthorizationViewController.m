//
//  YFAuthorizationViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFAuthorizationViewController.h"
#import "YFOpenASavingsWebViewController.h"
@interface YFAuthorizationViewController ()<UITableViewDelegate,UITableViewDataSource>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

@end

@implementation YFAuthorizationViewController
{
    NSInteger Balance;//自动投标 0不开启 1开启
    NSInteger redEnvelope;//自动还款 0不用 1用
    NSInteger creditAssignment;//自动债权认购 0不用 1用
}
static NSString *cellId = @"YFAuthorizationTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"授权管理";
    self.view.backgroundColor=WHITECOLOR;
    Balance=0;
    redEnvelope=0;
    /*
     数据请求
     */
    [self DataRequest];
    
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
    
    YFAuthorizationTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFAuthorizationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    [cell setterindexPath:indexPath.row SwitchButtonFirst:Balance SwitchButtonSecond:redEnvelope switchcReitAssignment:creditAssignment];
    [cell.SwitchButton addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell.SwitchButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside | UIControlEventAllTouchEvents];
    return cell;
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
#warning 取消button点击高亮效果

- (void)btnClick:(UIButton *)btn {
    btn.highlighted = NO;
}
-(void)switchAction:(UIButton *)sender
{
    sender.selected = !sender.selected;
     NSString  *isOpen = sender.selected ?@"1":@"0";
    switch (sender.tag) {
        case 0:
        {
           
            [self statesType:@"tender" logoString:isOpen];
        }
            break;
        case 1:
        {
             [self statesType:@"repayment" logoString:isOpen];
        }
            break;
        case 2:
        {
             [self statesType:@"creditAssignment" logoString:isOpen];
        }
            break;
            
        default:
            break;
    }
}

/*
 数据请求
 */
-(void)DataRequest
{
    [YFMineRequest YFAuthSuccess:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            
            NSDictionary *dataDic=json[@"data"];
            Balance=[[NSString stringWithFormat:@"%@",[dataDic objectForKey:@"tender"]] integerValue];
            redEnvelope=[[NSString stringWithFormat:@"%@",[dataDic objectForKey:@"repayment"]] integerValue];
            creditAssignment = [[NSString stringWithFormat:@"%@",[dataDic objectForKey:@"creditAssignment"]] integerValue];
            [self.YFTableView reloadData];
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
    } failure:^(NSError *error) {
        
    }];
}


/*
 开启和关闭自动
 */
-(void)statesType:(NSString *)type logoString:(NSString *)isOpen
{

        
        [YFProgressHUD showWithStatus:nil];
    if ([isOpen isEqualToString:@"1"]) {
        [YFMineRequest YFSettingAuthString:isOpen tittleString:type success:^(id json) {
            
            if ([YFTool Nsdic:json]==1) {
                
                NSLog(@"2222 == %@",json);
                YFOpenASavingsWebViewController *YFOpenASavingsWebVC=[[YFOpenASavingsWebViewController alloc] init];
                YFOpenASavingsWebVC.urlString=[json objectForKey:@"data"];
                
                [self.navigationController pushViewController:YFOpenASavingsWebVC animated:YES];
                /*
                 自动投标
                 */
//                if ([type isEqualToString:@"tender"]) {
//                    [YFProgressHUD showSuccessWithStatus:@"开启自动投标成功"];
//                }else if ([type isEqualToString:@"repayment"]){
//                    [YFProgressHUD showSuccessWithStatus:@"开启自动还款成功"];
//                }else if ([type isEqualToString:@"creditAssignment"]){
//                    [YFProgressHUD showSuccessWithStatus:@"开启自动还款成功"];
//                }
            }
            else{
                [YFProgressHUD showInfoWithStatus:MESSAGE];
                [self DataRequest];
            }
            
        } failure:^(NSError *error) {
            [self DataRequest];
        }];
    }else{
        [YFMineRequest YFCancelAuthString:isOpen tittleString:type success:^(id json) {
            
            if ([YFTool Nsdic:json]==1) {
                
                NSLog(@"2222 == %@",json);
                /*
                 自动投标
                 */
                if ([type isEqualToString:@"tender"]) {
                    [YFProgressHUD showSuccessWithStatus:@"关闭自动投标成功"];
                }else if ([type isEqualToString:@"repayment"]){
                    [YFProgressHUD showSuccessWithStatus:@"关闭自动还款成功"];
                }else if ([type isEqualToString:@"creditAssignment"]){
                    [YFProgressHUD showSuccessWithStatus:@"关闭自动还款成功"];
                }
            }
            else{
                [YFProgressHUD showInfoWithStatus:MESSAGE];
                [self DataRequest];
            }
            
        } failure:^(NSError *error) {
            [self DataRequest];
        }];
    }
    
    
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

