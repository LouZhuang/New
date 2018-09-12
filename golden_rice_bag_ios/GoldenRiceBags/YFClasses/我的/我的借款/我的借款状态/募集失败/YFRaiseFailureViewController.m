//
//  YFRaiseFailureViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFRaiseFailureViewController.h"
#import "YFBorrowingInformationViewController.h"
@interface YFRaiseFailureViewController ()<UITableViewDelegate,UITableViewDataSource>

/*
 头部视图
 */
@property(nonatomic,strong)UIView *headerView;


/*
 当前借款总金额(元)lable
 */
@property(nonatomic,strong)UILabel *totalLabel;

/*
 当前借款总金额(元)lable
 */
@property(nonatomic,strong)UILabel *totalNumberLabel;

/*
 说明lable
 */
@property(nonatomic,strong)UILabel *instructionsLabel;

/*
 未通过原因lable
 */
@property(nonatomic,strong)UILabel *whyLabel;

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

/*
 重新申请按钮
 */
@property(nonatomic,strong)UIButton *YFButton;
@property (nonatomic, strong) NSDictionary *dataDic;
@end

@implementation YFRaiseFailureViewController

static NSString *cellId = @"YFMineBorrowTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"募集失败";
//    [self configuration];
    
    /*
     数据请求
     */
    [self DataRequest];
    
    // Do any additional setup after loading the view.
}



-(void)configuration
{
    [self.view sd_addSubviews:@[self.headerView]];
    
    self.headerView.sd_layout
    .topEqualToView(self.view)
    .leftEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(164));
    
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
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.backgroundColor=WHITECOLOR;
    [self.headerView addSubview:imageView];
    
    imageView.sd_layout
    .topSpaceToView(self.headerView, YF_H(10))
    .leftSpaceToView(self.headerView, YF_W(0))
    .widthIs(WIDTH )
    .heightIs(YF_H(144));
    
    
    [self.headerView sd_addSubviews:@[self.totalLabel,self.totalNumberLabel,self.instructionsLabel,self.whyLabel]];
    
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
    
    self.whyLabel.sd_layout
    .topSpaceToView(self.headerView, YF_H(122))
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
        label.text =@"募集期内未筹集到目标金额";
        _instructionsLabel = label;
    }
    return _instructionsLabel;
}

-(UILabel *)whyLabel
{
    if (!_whyLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =[YFTool YFColorWithString:@"999999"];
        label.text =_mineBorrowModel.reserve3;
        _whyLabel = label;
    }
    return _whyLabel;
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
    if (self.dataDic== nil) {
        return 0;
    }
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
    switch ([self.dataDic[@"loanDetail"][@"returnType"] integerValue]) {
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
    [cell setterIndexRow:indexPath.row modelArray:@[self.dataDic[@"loanDetail"][@"loanNo"],
                                                    [NSString stringWithFormat:@"%d个月",[self.dataDic[@"loanDetail"][@"loanDays"] intValue]],
                                                    str,
                                                    [NSString stringWithFormat:@"%.2f%%",[self.dataDic[@"loanDetail"][@"rateOfYear"] floatValue]],@"查看"]];
    
//    [cell setterIndexRow:indexPath.row modelArray:@[@"CZ000123000",@"83天",@"一次性还本付息",@"9.3%",@"查看"]];
    
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



-(UIButton *)YFButton
{
    if (!_YFButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitle:@"重新申请" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(17);
        [button addTarget:self action:@selector(closeClick) forControlEvents:UIControlEventTouchUpInside];
        _YFButton = button;
        
    }
    return _YFButton;
}

-(void)closeClick
{
//    [YFProgressHUD showInfoWithStatus:@"重新申请"];
    YFBorrowingInformationViewController *YFBorrowingInformationVC=[[YFBorrowingInformationViewController alloc]init];
    [self.navigationController pushViewController:YFBorrowingInformationVC animated:YES];
    
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
