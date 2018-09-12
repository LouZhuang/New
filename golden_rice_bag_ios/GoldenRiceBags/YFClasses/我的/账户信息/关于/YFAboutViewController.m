//
//  YFAboutViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/19.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFAboutViewController.h"

@interface YFAboutViewController ()<UITableViewDelegate,UITableViewDataSource>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;


@end

@implementation YFAboutViewController
{
    NSString *telString;
    NSString *homeString;
    NSString *businessString;
}
static NSString *cellId = @"YFAboutTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"关于";
    telString=@"";
    homeString=@"";
    businessString=@"";
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
    
    /*
     数据请求
     */
    [self DataRequest];
    
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
    return 2;
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
        return YF_H(70);
    }
    if (indexPath.section==1) {
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
        return 4;
    }
    else{
        return 0;
    }
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFAboutTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFAboutTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    if (indexPath.section==0) {
        [cell Icon];
    }
    
    if (indexPath.section==1) {
        
        [cell setterIndexPath:indexPath.row phoneString:telString urlString:homeString cooperationString:businessString];
    }
   
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

}

/*
 数据请求
 */
-(void)DataRequest
{
    [YFMineRequest YFAboutSuccess:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            NSLog(@"about == %@",json);
            NSDictionary *dic=[json objectForKey:@"data"];
            telString=[dic objectForKey:@"tel"];
            homeString=[dic objectForKey:@"home"];
            businessString=[dic objectForKey:@"business"];
            
            [_YFTableView reloadData];
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
