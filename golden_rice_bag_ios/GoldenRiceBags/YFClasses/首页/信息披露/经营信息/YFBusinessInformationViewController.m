//
//  YFBusinessInformationViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/19.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBusinessInformationViewController.h"

@interface YFBusinessInformationViewController ()<UITableViewDelegate,UITableViewDataSource>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

@end

@implementation YFBusinessInformationViewController
static NSString *cellId = @"YFBusinessInformationTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor greenColor];
    self.view.backgroundColor=WHITECOLOR;
    
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
    .heightIs(HEIGHT - 64-YF_H(50));
    
    
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
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return YF_H(0);
    }
    else{
        return YF_H(10);
    }
    
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
        return YF_H(82);
    }
    if (indexPath.section==1) {
        return YF_H(49);
    }
    if (indexPath.section==2) {
        return YF_H(82);
    }
    if (indexPath.section==3) {
        return YF_H(49);
    }
    else{
        return YF_H(40);
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
    if (section==2) {
        return 1;
    }
    if (section==3) {
        return 4;
    }
    else{
       return 1;
    }
   
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFBusinessInformationTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFBusinessInformationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    [cell setterBusinessInformationIndex:indexPath.section IndexPath:indexPath.row];
    
    return cell;
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    
    
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
