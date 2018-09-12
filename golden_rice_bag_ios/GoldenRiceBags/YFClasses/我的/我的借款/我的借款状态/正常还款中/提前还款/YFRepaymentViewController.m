//
//  YFRepaymentViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFRepaymentViewController.h"
#import "YFLoginRequest.h"
@interface YFRepaymentViewController ()<UITableViewDelegate,UITableViewDataSource>
/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;
@property (nonatomic, strong) NSDictionary *dataDic;
/*
 确定提前还款按钮
 */
@property(nonatomic,strong)UIButton *YFButton;

@end

@implementation YFRepaymentViewController
static NSString *cellId = @"YFPrepaymentTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"提前还款";
    [self configuration];
    // Do any additional setup after loading the view.
    [self requestData];
}

-(void)configuration
{
    [self.view sd_addSubviews:@[self.YFTableView,self.YFButton]];
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, 0)
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(HEIGHT -64);
    
    self.YFButton.sd_layout
    .bottomEqualToView(self.view)
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(YF_H(49));
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
    if (![self.dataDic allKeys].count) {
        return 0;
    }
    return 3;
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
    
    if (indexPath.section ==0) {
        
        return YF_H(80);
    }
    if (indexPath.section ==1) {
        
        return YF_H(45);
    }
    if (indexPath.section ==2) {
        
        return YF_H(45);
    }
    else{
        return 0;
    }
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==0) {
        return 1;
    }
    if (section ==1) {
        return 3;
    }
    if (section ==2) {
        return 2;
    }
    else{
        return 0;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFPrepaymentTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFPrepaymentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    if (indexPath.section==0) {
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell setterIndexRow:indexPath.row numberString:self.mineBorrowModel.loanAmount];
    }
    if (indexPath.section==1) {
        
        if (indexPath.row==0) {
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        [cell setterIndexRow:indexPath.row modelArray:@[[NSString stringWithFormat:@"%.2f",[self.dataDic[@"wait_interest"] floatValue]],[NSString stringWithFormat:@"%.2f",[self.dataDic[@"overdue"] floatValue]],[NSString stringWithFormat:@"%.2f",[self.dataDic[@"poundage"] floatValue]]]];
        
    }
    if (indexPath.section==2) {
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        [cell setterIndexRow:indexPath.row totalString:[NSString stringWithFormat:@"%.2f",[self.dataDic[@"total"] floatValue]]];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

-(UIButton *)YFButton
{
    if (!_YFButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitle:@"确认提前还款" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(17);
        [button addTarget:self action:@selector(closeClick) forControlEvents:UIControlEventTouchUpInside];
        _YFButton = button;
        
    }
    return _YFButton;
}

-(void)closeClick
{
    [YFLoginRequest YFSrfSuccess:^(id json) {
        [self submitData:json[@"data"][0][@"srf"]];
    } failure:^(NSError *error) {
        
    }];
   
    
}

- (void)submitData:(NSString *)srf
{
    [YFMineRequest YFAheadRepayUidString:self.mineBorrowModel.id andStr:srf success:^(id json) {
        if ([YFTool Nsdic:json]==1) {
            
            NSLog(@"23232 == %@",json);
            [YFProgressHUD showSuccessWithStatus:@"申请已提交，还款结果以通知为准"];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
    } failure:^(NSError *error) {
         [YFProgressHUD showSuccessWithStatus:@"申请提交失败，请重新提交"];
    }];
}
- (void)requestData
{
    [YFMineRequest YFGetAdvanceUidString:self.mineBorrowModel.id success:^(id json) {
        if ([YFTool Nsdic:json]==1) {
            
            NSLog(@"23232 == %@",json);
            self.dataDic = json[@"data"];
            [self.YFTableView reloadData];
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
    } failure:^(NSError *error) {
        
    }];
}
- (NSDictionary *)dataDic
{
    if (_dataDic == nil) {
        _dataDic = [NSDictionary dictionary];
    }
    return _dataDic;
}
@end
