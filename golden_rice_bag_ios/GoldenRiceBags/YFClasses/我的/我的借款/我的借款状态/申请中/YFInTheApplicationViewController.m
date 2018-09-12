//
//  YFInTheApplicationViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFInTheApplicationViewController.h"

@interface YFInTheApplicationViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSDictionary *dataDic;
@end

@implementation YFInTheApplicationViewController
static NSString *cellId = @"YFMineBorrowTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"申请中";
     [self configuration];
    // Do any additional setup after loading the view.
    [self DataRequest];
}

-(void)configuration
{
    [self.view sd_addSubviews:@[self.headerView]];
    
    self.headerView.sd_layout
    .topEqualToView(self.view)
    .leftEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(143));
    
    [self.view sd_addSubviews:@[self.YFTableView]];
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, 0)
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(HEIGHT -64);
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.backgroundColor=WHITECOLOR;
    [self.headerView addSubview:imageView];
    
    imageView.sd_layout
    .topSpaceToView(self.headerView, YF_H(10))
    .leftSpaceToView(self.headerView, YF_W(0))
    .widthIs(WIDTH )
    .heightIs(YF_H(123));
    
    
    [self.headerView sd_addSubviews:@[self.totalLabel,self.totalNumberLabel,self.instructionsLabel]];
    
    self.totalLabel.sd_layout
    .topSpaceToView(self.headerView, YF_H(25))
    .leftSpaceToView(self.headerView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(20));
    
    self.totalNumberLabel.sd_layout
    .topSpaceToView(self.headerView, YF_H(47))
    .leftSpaceToView(self.headerView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(28));
    
    self.instructionsLabel.sd_layout
    .topSpaceToView(self.headerView, YF_H(101))
    .rightSpaceToView(self.headerView, YF_W(14))
    .widthIs(WIDTH- YF_W(28))
    .heightIs(YF_H(17));
    
   
    
    UIImageView *imageViewthird = [[UIImageView alloc] init];
    imageViewthird.backgroundColor=LIGHTGREYCOLOR;
    [self.headerView addSubview:imageViewthird];
    
    imageViewthird.sd_layout
    .topSpaceToView(self.headerView, YF_H(90))
    .leftSpaceToView(self.headerView, YF_W(14))
    .widthIs(WIDTH - YF_W(28))
    .heightIs(YF_H(1));
    
}


#pragma mark - lazy

-(UIView *)headerView
{
    if (!_headerView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = LIGHTGREYCOLOR;
        view.userInteractionEnabled =YES;
        _headerView = view;
    }
    return _headerView;
}


-(UILabel *)totalLabel
{
    if (!_totalLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =[YFTool YFColorWithString:@"999999"];
        label.text =@"借款金额";
        _totalLabel = label;
    }
    return _totalLabel;
}


-(UILabel *)totalNumberLabel
{
    if (!_totalNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.textColor =ZHUTICOLOR;
        label.text =[NSString stringWithFormat:@"%.2f",[_mineBorrowModel.loanAmount floatValue]];
        _totalNumberLabel = label;
    }
    return _totalNumberLabel;
}

-(UILabel *)instructionsLabel
{
    if (!_instructionsLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =[YFTool YFColorWithString:@"999999"];
        label.text =@"审核将在1-2个工作日内完成，请耐心等待！";
        _instructionsLabel = label;
    }
    return _instructionsLabel;
}



-(YFBaseTableView *)YFTableView
{
    if (!_YFTableView) {
        YFBaseTableView *tableView= [[YFBaseTableView alloc] init];
        tableView.separatorColor = LIGHTGREYCOLOR;
        tableView.tableFooterView =[UIView new];
        [tableView setTableHeaderView:self.headerView];
        tableView.delegate = self;
        tableView.dataSource =self;
        _YFTableView =tableView;
    }
    return _YFTableView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return YF_H(45);
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFInTheApplicationTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFInTheApplicationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    NSString *str = @"";
    switch ([self.mineBorrowModel.returnType integerValue]) {
        case 1:
        {
            str =@"等额本息";
        }
            break;
            
        case 2:
        {
            str =@"先息后本";
        }
            break;
        case 3:
        {
            str =@"一次性还本付息";
        }
            break;
        default:
            break;
    }
    [cell setterIndexRow:indexPath.row modelArray:@[_mineBorrowModel.loanNo,[NSString stringWithFormat:@"%@个月",_mineBorrowModel.loanDays],str,[NSString stringWithFormat:@"%@%%",_mineBorrowModel.rateOfYear],@"查看"]];
    
    if (indexPath.row == 4) {
        [cell.toViewButton addTarget:self action:@selector(toViewClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return cell;
}

-(void)toViewClick
{
//    [YFProgressHUD showInfoWithStatus:@"查看"];
    if (![self.dataDic[@"loanDetail"][@"contract"] isEqualToString:@"NOSIGN"]) {
        RHWebViewController *vc = [[RHWebViewController alloc]init];
        vc.webUrl = self.dataDic[@"loanDetail"][@"contract"];
        vc.title = @"金米袋网借款协议";
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        [YFProgressHUD showInfoWithStatus:@"未签署借款合同"];
    }
}

/*
 数据请求
 */
-(void)DataRequest
{
    
    [YFMineRequest YFUidString:self.mineBorrowModel.id success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            
            NSLog(@"23232 == %@",json);
            self.dataDic = json[@"data"];
            self.totalNumberLabel.text = self.dataDic[@"loanDetail"][@"loanAmount"];
            [self configuration];
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
