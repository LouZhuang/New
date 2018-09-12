//
//  YFFirstViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFFirstViewController.h"

@interface YFFirstViewController ()<UITableViewDelegate,UITableViewDataSource>
/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;
/*
 data
 */
@property(nonatomic,strong)NSMutableArray *YFDataArray;
@end

@implementation YFFirstViewController
static NSString *cellId = @"YFReimbursementMeansTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=WHITECOLOR;
    [self configuration];
    /*
     数据请求
     */
    [self DataRequest];
    // Do any additional setup after loading the view.
}

-(NSMutableArray *)YFDataArray
{
    if (!_YFDataArray) {
        _YFDataArray=[NSMutableArray array];
    }
    return _YFDataArray;
}

-(void)configuration
{
    [self.view sd_addSubviews:@[self.YFTableView]];
    
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, YF_H(0))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(HEIGHT - 64 - YF_H(293)-YF_H(49));
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YF_H(69);
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.YFDataArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YFReimbursementMeansTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFReimbursementMeansTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    YFReimbursementMeansModel *model=[self.YFDataArray objectAtIndex:indexPath.row];
    
    [cell setterReimbursementMeansModel:model];
    
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
    
    [YFBorrowingRequest YFPageSizeString:self.sizeString principalString:self.principalString repayTypeString:@"2" success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            
            NSLog(@"444 == %@",json);
            NSDictionary *dataDic=[json objectForKey:@"data"];
            NSArray *detailArr=[dataDic objectForKey:@"detail"];
            
            [self.YFDataArray removeAllObjects];
            for (NSDictionary *dic in detailArr) {
                YFReimbursementMeansModel *model=[[YFReimbursementMeansModel alloc]init];
                [model setValuesForKeysWithDictionary:dic];
                [self.YFDataArray addObject:model];
            }
            
            [_YFTableView reloadData];
            /**  请求成功后将共还款年利率返回至首页  */
            [[NSNotificationCenter defaultCenter] postNotificationName:@"PaymentType" object:dataDic];
            
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
