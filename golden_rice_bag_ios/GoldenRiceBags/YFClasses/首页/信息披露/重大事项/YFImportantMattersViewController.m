//
//  YFImportantMattersViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/19.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFImportantMattersViewController.h"

@interface YFImportantMattersViewController ()<UITableViewDelegate,UITableViewDataSource>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

@end

@implementation YFImportantMattersViewController
static NSString *cellId = @"YFBusinessInformationTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
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
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  
    return YF_H(55);
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImageView *view = [[UIImageView alloc] init];
    view.userInteractionEnabled = YES;
    view.backgroundColor = WHITECOLOR;
    
    UILabel *label =[[UILabel alloc] init];
    label.font = YF_FONT(14);
    label.textColor =[YFTool YFColorWithString:@"a67817"];
    label.text=@"事项内容";
    [view addSubview:label];
    
    label.sd_layout
    .leftSpaceToView(view, YF_W(14))
    .widthIs(YF_W(310) - YF_W(28))
    .heightIs(YF_H(55))
    .centerYEqualToView(view);
    
    UILabel *nowLabel =[[UILabel alloc] init];
    nowLabel.font = YF_FONT(14);
    nowLabel.textColor =[YFTool YFColorWithString:@"a67817"];
    nowLabel.textAlignment=NSTextAlignmentRight;
    nowLabel.text=@"现状";
    [view addSubview:nowLabel];
    
    nowLabel.sd_layout
    .rightSpaceToView(view, YF_W(14))
    .widthIs(YF_W(310) - YF_W(28))
    .heightIs(YF_H(55))
    .centerYEqualToView(view);
    
    
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return YF_H(55);
    }
    if (indexPath.row==1) {
        return YF_H(55);
    }
    if (indexPath.row==2) {
        return YF_H(55);
    }
    if (indexPath.row==3) {
        return YF_H(73);
    }
    if (indexPath.row==4) {
        return YF_H(112);
    }
    if (indexPath.row==5) {
        return YF_H(55);
    }
    if (indexPath.row==6) {
        return YF_H(73);
    }
    else{
      return YF_H(0);
    }
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 7;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFBusinessInformationTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFBusinessInformationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    [cell setterImportantMattersIndex:indexPath.row];
    
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
