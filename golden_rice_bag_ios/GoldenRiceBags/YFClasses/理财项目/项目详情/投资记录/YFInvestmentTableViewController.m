//
//  YFInvestmentTableViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/21.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFInvestmentTableViewController.h"
#define YFMineTittle @[@"投资人",@"投资份额(元)",@"投资时间"]
@interface YFInvestmentTableViewController ()
@property(nonatomic,strong)NSMutableArray *YFArray;
@end

@implementation YFInvestmentTableViewController
{
    NSString *money;//投资金额
    NSString *peopelNumber;//投资人数
    NSString *time;//投剩余时间
}

static NSString *cellId = @"YFInvestmentSection0TableViewCell";
static NSString *cellSectionId = @"YFInvestmentSection1TableViewCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    money=@"";
    peopelNumber=@"";
    time=@"";
    
    self.view.backgroundColor=WHITECOLOR;
    self.tableView.separatorColor = LIGHTGREYCOLOR;
    self.tableView.tableFooterView =[UIView new];

    /*
     数据请求
     */
    [self DataRequest];
}
-(NSMutableArray *)YFArray
{
    if (!_YFArray) {
        _YFArray=[NSMutableArray array];
    }
    return _YFArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
      return YF_H(0);
    }
    if (section==1) {
        return YF_H(30);
    }
    else{
      return YF_H(0);
    }
   
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImageView *view = [[UIImageView alloc] init];
    view.userInteractionEnabled = YES;
    view.backgroundColor = LIGHTGREYCOLOR;
    
    for (NSInteger i = 0; i < 3; i ++) {
        UILabel *label =[[UILabel alloc] init];
        label.frame = CGRectMake(i*WIDTH/3,0, WIDTH/3, YF_H(30));
        label.font = YF_FONT(11);
        label.textColor =YF666;
        label.textAlignment = NSTextAlignmentCenter;
        label.text =[YFMineTittle objectAtIndex:i];
        [view addSubview:label];
    }
    
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section==0) {
        return 3;
    }
    if (section==1) {
        return self.YFArray.count;
    }
    else{
     return 0;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return YF_H(40);
    }
    if (indexPath.section==1) {
        return YF_H(36);
    }
    else{
        return 0;
    }
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section==0) {
        YFInvestmentSection0TableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell == nil) {
            cell = [[YFInvestmentSection0TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell setterIndexPath:indexPath.row moneyString:money peopleString:peopelNumber timeString:time];
        
        return cell;
    }
    if (indexPath.section==1) {
        YFInvestmentSection1TableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell == nil) {
            cell = [[YFInvestmentSection1TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellSectionId];
            
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        YFCertificationModel *model=[self.YFArray objectAtIndex:indexPath.row];
        
        [cell settermoneyCertificationModel:model];
        
        return cell;
    }
    else{
        return nil;
    }
   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"点击middle-%d",(int)indexPath.row);
}



/*
 数据请求
 */
-(void)DataRequest
{
    [YFHomePageRequest YFHomePageProjectDetail:self.projectDetailId success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            
            NSLog(@"projectDetail == %@",json);
            
            NSDictionary *dic=[json objectForKey:@"data"];
            NSArray *loanInfoPictureEntityArr=[dic objectForKey:@"investmentEntities"];
            [self.YFArray removeAllObjects];

            for (NSDictionary *dic in loanInfoPictureEntityArr) {
                YFCertificationModel *model=[[YFCertificationModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.YFArray addObject:model];

            }
            
            peopelNumber=[NSString stringWithFormat:@"%@",[dic objectForKey:@"count"]];
            money=[NSString stringWithFormat:@"%@",[dic objectForKey:@"totalInvest"]];
            time=[dic objectForKey:@"remainderTime"];
            
            
            [self.tableView reloadData];

        
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
        
    } failure:^(NSError *error) {
        
    }];
    
    
}


@end
