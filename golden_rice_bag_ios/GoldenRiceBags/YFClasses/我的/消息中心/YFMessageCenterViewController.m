//
//  YFMessageCenterViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFMessageCenterViewController.h"

@interface YFMessageCenterViewController ()<UITableViewDelegate,UITableViewDataSource>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

/*
 系统消息数组
 */
@property(nonatomic,strong)NSMutableArray *YFSystemArray;

/*
 我的消息数组
 */
@property(nonatomic,strong)NSMutableArray *YFMessageArray;

/*
 优选活动数组
 */
@property(nonatomic,strong)NSMutableArray *YFActivityArray;

@end

@implementation YFMessageCenterViewController
static NSString *cellId = @"YFMessageCenterTableViewCell";

/*
 视图将要显示
 */
-(void)viewWillAppear:(BOOL)animated
{
    
    /*
     数据请求
     */
    [self DataRequest];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"消息中心";
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
    .heightIs(HEIGHT - 64);
    

}

-(NSMutableArray *)YFSystemArray
{
    if (!_YFSystemArray) {
        _YFSystemArray=[NSMutableArray array];
    }
    return _YFSystemArray;
}


-(NSMutableArray *)YFMessageArray
{
    if (!_YFMessageArray) {
        _YFMessageArray=[NSMutableArray array];
    }
    return _YFMessageArray;
}


-(NSMutableArray *)YFActivityArray
{
    if (!_YFActivityArray) {
        _YFActivityArray=[NSMutableArray array];
    }
    return _YFActivityArray;
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
    
    return YF_H(69);
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 3;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFMessageCenterTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFMessageCenterTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }

    
    [cell setterIndexPath:indexPath.row contentString:@"" timeString:@""];
    
    if (indexPath.row==0) {
        if (self.YFSystemArray.count>0) {
        YFMessageModel *systemModel=[self.YFSystemArray objectAtIndex:0];
        [cell setterIndexPath:indexPath.row contentString:systemModel.content timeString:[YFTool timeWithTimeIntervalString:systemModel.createTime Format:@"yyyy-MM-dd"]];
        }
    }
    if (indexPath.row==1) {

        if (self.YFMessageArray.count>0) {
            YFMessageModel *messageModel=[self.YFMessageArray objectAtIndex:0];
            [cell setterIndexPath:indexPath.row contentString:messageModel.content timeString:[YFTool timeWithTimeIntervalString:messageModel.createTime Format:@"yyyy-MM-dd"]];
        }
    }
    if (indexPath.row==2) {

        if (self.YFActivityArray.count>0) {
            YFMessageModel *activityModel=[self.YFActivityArray objectAtIndex:0];
            [cell setterIndexPath:indexPath.row contentString:activityModel.content timeString:[YFTool timeWithTimeIntervalString:activityModel.createTime Format:@"yyyy-MM-dd"]];
        }
    }
    
    
    return cell;
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.row==0) {
        YFSystemOfAnnouncementViewController *YFSystemOfAnnouncementVC=[[YFSystemOfAnnouncementViewController alloc]init];
        [self.navigationController pushViewController:YFSystemOfAnnouncementVC animated:YES];
    }
    if (indexPath.row==1) {
        YFMineMessageViewController *YFMineMessageVC=[[YFMineMessageViewController alloc]init];
        [self.navigationController pushViewController:YFMineMessageVC animated:YES];
    }
    if (indexPath.row==2) {
        YFOptimizingActivitiesViewController *YFOptimizingActivitiesVC=[[YFOptimizingActivitiesViewController alloc]init];
        [self.navigationController pushViewController:YFOptimizingActivitiesVC animated:YES];
    }
}


/*
 数据请求
 */
-(void)DataRequest
{
    [YFMineRequest YFMessageSuccess:^(id json) {
       
        if ([YFTool Nsdic:json]==1) {
            NSLog(@"2222 == %@",json);
            NSDictionary *dic=[json objectForKey:@"data"];
            NSArray *systemArr=[dic objectForKey:@"system"];
            NSArray *messageArr=[dic objectForKey:@"message"];
            NSArray *activityArr=[dic objectForKey:@"activity"];
            
            [self.YFSystemArray removeAllObjects];
             [self.YFMessageArray removeAllObjects];
             [self.YFActivityArray removeAllObjects];
            
            for (NSDictionary *dic in systemArr) {
                YFMessageModel *model=[[YFMessageModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.YFSystemArray addObject:model];
                
            }
            for (NSDictionary *dic in messageArr) {
                YFMessageModel *model=[[YFMessageModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.YFMessageArray addObject:model];
                
            }
            for (NSDictionary *dic in activityArr) {
                YFMessageModel *model=[[YFMessageModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.YFActivityArray addObject:model];
                
            }
            
            [_YFTableView reloadData];
            
            
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
