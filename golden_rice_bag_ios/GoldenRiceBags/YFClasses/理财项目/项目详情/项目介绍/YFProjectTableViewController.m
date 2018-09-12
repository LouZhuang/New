//
//  YFProjectTableViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/21.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFProjectTableViewController.h"
#define YFMineTittle @[@"项目信息",@"借款人信息"]
@interface YFProjectTableViewController ()

@property(nonatomic,strong)NSDictionary *loanInfoEntityDic;//借款信息data

@property(nonatomic,strong)NSDictionary *projectEntityDic;//项目信息data
@end

@implementation YFProjectTableViewController
{
    NSString *loaner;
    NSString *loanerIdCard;
    NSString *projectNr;//项目内容
}
static NSString *cellId = @"YFProjectTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=WHITECOLOR;
    self.tableView.separatorColor = LIGHTGREYCOLOR;
    self.tableView.tableFooterView =[UIView new];
    
    /*
     数据请求
     */
    [self DataRequest];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
     return YF_H(50);
    }
    if (section==1) {
        return YF_H(50);
    }
    else{
        return 0;
    }
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImageView *view = [[UIImageView alloc] init];
    view.userInteractionEnabled = YES;
    view.backgroundColor = WHITECOLOR;
    
    UILabel *label =[[UILabel alloc] init];
    label.frame = CGRectMake(YF_W(32),0, WIDTH/3, YF_H(50));
    label.font = YF_FONT(14);
    label.textColor =YF333;
    label.text =[YFMineTittle objectAtIndex:section];
    [view addSubview:label];
    
    UIImageView *imageView=[[UIImageView alloc] init];
    imageView.image=[UIImage imageNamed:@"zhuangshidianImage"];
    [view addSubview:imageView];
    
    imageView.sd_layout
    .leftSpaceToView(view, YF_W(14))
    .widthIs(YF_W(12))
    .heightIs(YF_H(8))
    .centerYEqualToView(view);

    
    UIView *upView=[[UIView alloc] init];
    upView.backgroundColor=LIGHTGREYCOLOR;
    [view addSubview:upView];
    
    upView.sd_layout
    .topEqualToView(view)
    .leftSpaceToView(view, YF_W(14))
    .widthIs(WIDTH -YF_W(14))
    .heightIs(YF_H(1));
    
    UIView *downView=[[UIView alloc] init];
    downView.backgroundColor=LIGHTGREYCOLOR;
    [view addSubview:downView];
    
    downView.sd_layout
    .bottomEqualToView(view)
    .leftSpaceToView(view, YF_W(14))
    .widthIs(WIDTH -YF_W(14))
    .heightIs(YF_H(1));
    
    
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section==0) {
        return 6;
    }
    if (section==1) {
        return 5;
    }
    if (section==2) {
        return 4;
    }
    else{
        return 0;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        
        if (indexPath.row==0) {
            
            return YF_H(90);
        }
        if (indexPath.row==1 ||indexPath.row==2 ||indexPath.row==3 ||indexPath.row==5 ) {
            
            return YF_H(71);
        }
        if (indexPath.row==4) {
           return YF_H(109);
        }
        else{
          return YF_H(0);
        }
        
    }
    if (indexPath.section==1) {
        return YF_H(40);
    }
    if (indexPath.section==2) {
        if (indexPath.row==0||indexPath.row==2) {
            
            return YF_H(109);
        }
        if (indexPath.row==1 ) {
            
            return YF_H(71);
        }
        if (indexPath.row==3) {
            return YF_H(50);
        }
        else{
            return YF_H(0);
        }
    }
    else{
        return 0;
    }
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YFProjectTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFProjectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell setterIndexSection:indexPath.section indexRow:indexPath.row loanInfoEntityDic:self.loanInfoEntityDic projectEntityDic:self.projectEntityDic loanerString:loaner loanerIdCardString:loanerIdCard andNr:projectNr];
    
    return cell;

    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"点击middle-%d",(int)indexPath.row);
    if (indexPath.section == 2 && indexPath.row == 3) {
        RHWebViewController *vc = [[RHWebViewController alloc]init];
        vc.title = @"金米袋平台在线服务协议";
//        vc.isWord = YES;
        vc.pathUrl = [[NSBundle mainBundle]pathForResource:@"金米袋平台在线服务协议" ofType:@"html"];
//        [self.navigationController pushViewController:vc animated:YES];
        [[YFTool getCurrentVC].navigationController pushViewController:vc animated:YES];

    }
}


/*
 数据请求
 */
-(void)DataRequest
{
    [YFHomePageRequest YFHomePageProjectDetail:self.projectDetailId success:^(id json) {
        
         NSLog(@"ProjectDetail == %@",json);
        if ([YFTool Nsdic:json]==1) {
           
            
            NSDictionary *dic=[json objectForKey:@"data"];
            self.loanInfoEntityDic = [dic objectForKey:@"loanInfoEntity"];
            self.projectEntityDic = [dic objectForKey:@"projectEntity"];
            loaner=[dic objectForKey:@"loaner"];
            loanerIdCard=[dic objectForKey:@"loanerIdCard"];
            if (![dic[@"pjInfoEntity"] isKindOfClass:[NSNull class]] && ![dic[@"pjInfoEntity"][@"reserve1"] isKindOfClass:[NSNull class]]) {
                projectNr = dic[@"pjInfoEntity"][@"reserve1"];
            }else{
                projectNr = @"无";
            }
            [self.tableView reloadData];
            
            
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
        
    } failure:^(NSError *error) {
        
    }];
    
    
}


@end
