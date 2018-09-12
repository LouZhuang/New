//
//  YFTheRemittancePlanTableViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFTheRemittancePlanTableViewController.h"
#import "NSString+NSDateForStr.h"


#define YFMineTittle @[@"还款日期",@"投资份额(元)",@"还款金额(元)",@"还款状态"]
@interface YFTheRemittancePlanTableViewController ()

@end

@implementation YFTheRemittancePlanTableViewController
static NSString *cellId = @"YFTheRemittancePlanTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=WHITECOLOR;
    self.tableView.separatorColor = LIGHTGREYCOLOR;
    self.tableView.tableFooterView =[UIView new];
    
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
     return YF_H(30);
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImageView *view = [[UIImageView alloc] init];
    view.userInteractionEnabled = YES;
    view.backgroundColor = LIGHTGREYCOLOR;
    
    for (NSInteger i = 0; i < 4; i ++) {
        UILabel *label =[[UILabel alloc] init];
        label.frame = CGRectMake(i*WIDTH/4,0, WIDTH/4, YF_H(30));
        label.font = YF_FONT(11);
        label.textColor =YF666;
        label.textAlignment = NSTextAlignmentCenter;
        label.text =[YFMineTittle objectAtIndex:i];
        [view addSubview:label];
    }
    
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArr.count;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YF_H(36);

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YFTheRemittancePlanTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFTheRemittancePlanTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    NSDictionary *dic = self.dataArr[indexPath.row];
    NSString *state = @"";
    switch ([dic[@"status"] integerValue]) {
        case  0:
        {
            state = @"待还款";
        }
            break;
        case  1:
        {
            state = @"正常还款";
        }
            break;
        case  2:
        {
            state = @"逾期中";
        }
            break;
        case  3:
        {
            state = @"逾期已还款";
        }
            break;
        case  4:
        {
            state = @"扣款失败提醒";
        }
            break;
        case  5:
        {
            state = @"提前还款";
        }
            break;
            
        default:
            break;
    }
    NSString *timeStr = [[NSString stringWithFormat:@"%lld",[dic[@"repayDate"] longLongValue]] getTimeFromTimestamp];
    [cell setterTimeString:timeStr tittleString:dic[@"reserve1"] contentString:dic[@"reserve2"] stateString:state];
    
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
-  (void)setDataArr:(NSArray *)dataArr
{
    _dataArr = dataArr;
    [self.tableView reloadData];
}
@end
