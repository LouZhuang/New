//
//  YFAccountInformationViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/19.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFAccountInformationViewController.h"
#import <UMPush/UMessage.h>             // Push组件
@interface YFAccountInformationViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate,YFCustomPopoverDelegate>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

@end

@implementation YFAccountInformationViewController
{
    NSString *versionSting;//版本
}
static NSString *cellId = @"YFAccountInformationTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"账户信息";
    
    versionSting=APP_VERSION;
    
    [self configuration];
    /*
     版本数据请求
     */
    [self DataRequest];
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
    return 4;
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
    
    if (indexPath.section==0) {
        return YF_H(80);
    }
    if (indexPath.section==1) {
        return YF_H(50);
    }
    if (indexPath.section==2) {
        return YF_H(50);
    }
    if (indexPath.section==3) {
        return YF_H(50);
    }
    else{
        return YF_H(0);
    }
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section==0) {
        return 1;
    }
    if (section==1) {
        return 3;
    }
    if (section==2) {
        return 2;
    }
    if (section==3) {
        return 1;
    }
    else{
        return 0;
    }
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFAccountInformationTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFAccountInformationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    if (indexPath.section==0) {
        [cell nickNameString:[YFTool userDefaultsId:YFMEMBERNO]];
    }
    
    if (indexPath.section==1) {
        [cell indexPath:indexPath.row measurementString:[YFTool userDefaultsId:YFInvestmentType]];
       
    }
    if (indexPath.section==2) {
        
        [cell indexPath:indexPath.row versionString:versionSting];
    }

    if (indexPath.section==3) {
        [cell indexPath:indexPath.row loginOutString:@"退出登录"];
    }
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section==1) {
        if (indexPath.row==0&&![[YFTool userDefaultsId:YFInvestmentType] isEqualToString:@"进取型"] &&![[YFTool userDefaultsId:YFInvestmentType] isEqualToString:@"稳健型"]) {
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            _CustomPopoverView =[[YFCustomPopoverView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
            _CustomPopoverView.CustomPopoverDelegate=self;
            [window addSubview:_CustomPopoverView];
        }
        if (indexPath.row==1) {
            YFMineBnakCardAllViewController *YFMineBnakCardAllVC=[[YFMineBnakCardAllViewController alloc]init];
            [self.navigationController pushViewController:YFMineBnakCardAllVC animated:YES];
            
        }
        if (indexPath.row==2) {
            
            YFAccountSecurityViewController *YFAccountSecurityVC=[[YFAccountSecurityViewController alloc]init];
            [self.navigationController pushViewController:YFAccountSecurityVC animated:YES];
        }
    }
    
    if (indexPath.section==2) {
        if (indexPath.row==1) {
            YFAboutViewController *YFAboutVC=[[YFAboutViewController alloc] init];
            [self.navigationController pushViewController:YFAboutVC animated:YES];
        }
    }
    
     if (indexPath.section==3) {
    
         /*
          退出登录
          */
         [self LoginOutClick];
     }
    
}



-(void)LoginOutClick
{
    //退出登录
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确认退出登录？" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *active = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"退出登录");
        
        /*
         改变登录状态
         
         
         */
         [YFTool setObject:@"0" key:YFLOGIN];
        //跳转
        [self.tabBarController setSelectedIndex:0];
        
    
        [UMessage removeAlias:[YFTool userDefaultsId:YFID] type:@"UMENGPUSH" response:nil];
        [self.navigationController popToRootViewControllerAnimated:NO];
        
        
    }];
    
    [alertController addAction: active];
    UIAlertAction *notice = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:notice];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


-(void)CustomPopoverSuccessfulType:(NSInteger)type
{
    if (type ==1) {
        YFCreditRiskRatingViewController *YFCreditRiskRatingVC=[[YFCreditRiskRatingViewController alloc]init];
        [self.navigationController pushViewController:YFCreditRiskRatingVC animated:YES];
    }
    if (type ==2) {
        NSLog(@"我先看看");
    }
}


/*
 数据请求
 */
-(void)DataRequest
{
    [YFMineRequest YFPlatformSuccess:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            NSLog(@"ver == %@",json);
            NSDictionary *versionDic=[json objectForKey:@"data"];
            if ([[versionDic objectForKey:@"maxVersion"] floatValue]==[APP_VERSION floatValue]) {
                versionSting=@"已是最高版本";
            }
            if ([[versionDic objectForKey:@"maxVersion"] floatValue]>[APP_VERSION floatValue]) {
                versionSting=[versionDic objectForKey:@"maxVersion"];
            }
            
            [self.YFTableView reloadData];
            
            
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
