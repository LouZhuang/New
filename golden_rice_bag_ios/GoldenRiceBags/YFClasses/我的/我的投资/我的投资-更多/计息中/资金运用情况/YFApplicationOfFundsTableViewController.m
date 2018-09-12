//
//  YFApplicationOfFundsTableViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFApplicationOfFundsTableViewController.h"

@interface YFApplicationOfFundsTableViewController ()
@property (nonatomic, strong) NSArray *dataArr;
@end

@implementation YFApplicationOfFundsTableViewController
static NSString *cellId = @"YFApplicationOfFundsTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=WHITECOLOR;
    self.tableView.separatorColor = LIGHTGREYCOLOR;
    self.tableView.tableFooterView =[UIView new];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return YF_H(0);
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArr.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YF_H(61);
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YFApplicationOfFundsTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFApplicationOfFundsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//    [cell indexPath:indexPath.row];
    [cell setDataDic:self.dataArr[indexPath.row] andIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"点击middle-%d",(int)indexPath.row);
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)setDataDic:(NSDictionary *)dataDic
{
    _dataDic = dataDic;
    if ([dataDic allKeys].count) {
        NSString *overdueStr = @"无";
        if (![dataDic[@"overdueStatus"] isKindOfClass:[NSNull class]]) {
            overdueStr = [dataDic[@"overdueStatus"] integerValue] == 0 ? @"无逾期情况":@"逾期";

        }
        NSString *usageStatus = @"无";//@"借已经款人未提现/存管行受理提现，借款人承诺借款用于约定用途";
         NSString *financeStatus = @"无";
         NSString *repayStatus = @"无";
         NSString *appealStatus = @"无";
         NSString *punishStatus = @"无";
        if (![dataDic[@"usageStatus"] isKindOfClass:[NSNull class]]) {
            usageStatus = dataDic[@"usageStatus"];
        }
        if (![dataDic[@"financeStatus"] isKindOfClass:[NSNull class]]) {
            financeStatus = dataDic[@"financeStatus"];
        }
        if (![dataDic[@"repayStatus"] isKindOfClass:[NSNull class]]) {
            repayStatus = dataDic[@"repayStatus"];
        }
        if (![dataDic[@"appealStatus"] isKindOfClass:[NSNull class]]) {
            appealStatus = dataDic[@"appealStatus"];
        }
        if (![dataDic[@"punishStatus"] isKindOfClass:[NSNull class]]) {
            punishStatus = dataDic[@"punishStatus"];
        }
//        self.dataArr = @[@"无",@"无",@"无",@"无",@"无",@"无"];
        
         self.dataArr = @[usageStatus ,financeStatus,repayStatus,overdueStr,appealStatus,punishStatus];

    }
}
- (NSArray *)dataArr
{
    if (_dataArr == nil) {
        _dataArr = [NSArray array];
    }
    return _dataArr;
}
@end
