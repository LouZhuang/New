//
//  YFToRaiseSuccessfulViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFToRaiseSuccessfulViewController.h"

@interface YFToRaiseSuccessfulViewController ()<UITableViewDelegate,UITableViewDataSource>

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
 YFProgressView
 */
@property(nonatomic,strong)YFProgressView *ProgressView;


/*
 未通过原因lable
 */
@property(nonatomic,strong)UILabel *whyLabel;

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;


/*
 footer
 */
@property(nonatomic,strong)UIView *footerView;

/*
 footertittle
 */
@property(nonatomic,strong)UILabel *footerTittleLabel;


@property (nonatomic, strong) NSDictionary *dataDic;
@end

@implementation YFToRaiseSuccessfulViewController
static NSString *cellId = @"YFMineBorrowTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"募集成功";
//    [self configuration];
    // Do any additional setup after loading the view.
    [self DataRequest];
}


-(void)configuration
{
    [self.view sd_addSubviews:@[self.headerView,self.footerView]];
    
    self.headerView.sd_layout
    .topEqualToView(self.view)
    .leftEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(164));
    
    self.footerView.sd_layout
    .topSpaceToView(self.view, YF_H(384))
    .leftEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(60));
    
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
    .heightIs(YF_H(144));
    
    
    [self.headerView sd_addSubviews:@[self.totalLabel,self.totalNumberLabel,self.instructionsLabel,self.ProgressView,self.whyLabel]];
    
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
    
    self.ProgressView.sd_layout
    .topSpaceToView(self.headerView, YF_H(129))
    .leftSpaceToView(self.headerView, YF_W(14))
    .widthIs(WIDTH- YF_W(92))
    .heightIs(YF_H(2));
    
    self.whyLabel.sd_layout
    .topSpaceToView(self.headerView, YF_H(122))
    .rightSpaceToView(self.headerView, YF_W(14))
    .widthIs(YF_W(60))
    .heightIs(YF_H(17));
    
    
    
    UIImageView *imageViewthird = [[UIImageView alloc] init];
    imageViewthird.backgroundColor=LIGHTGREYCOLOR;
    [self.headerView addSubview:imageViewthird];
    
    imageViewthird.sd_layout
    .topSpaceToView(self.headerView, YF_H(90))
    .leftSpaceToView(self.headerView, YF_W(14))
    .widthIs(WIDTH - YF_W(28))
    .heightIs(YF_H(1));
    
    
    [self.footerView sd_addSubviews:@[self.footerTittleLabel]];
    
    self.footerTittleLabel.sd_layout
    .topSpaceToView(self.footerView, YF_H(10))
    .rightSpaceToView(self.footerView, YF_W(14))
    .widthIs(WIDTH - YF_W(28))
    .heightIs(YF_H(17));
    
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
-(UIView *)footerView
{
    if (!_footerView) {
        UIView *view = [[UIView alloc] init];
        view.userInteractionEnabled =YES;
        _footerView = view;
    }
    return _footerView;
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
//        label.text =@"90,000.00";
        _totalNumberLabel = label;
    }
    return _totalNumberLabel;
}

-(UILabel *)instructionsLabel
{
    if (!_instructionsLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =ZHUTICOLOR;
        NSString *string = @"距离目标0.00元";
        NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithString:string];
        [aString addAttribute:NSForegroundColorAttributeName value:[YFTool YFColorWithString:@"999999"] range:NSMakeRange(0, 4)];
        label.attributedText =aString;
        _instructionsLabel = label;
    }
    return _instructionsLabel;
}

-(YFProgressView *)ProgressView
{
    if (!_ProgressView) {
        YFProgressView *view = [[YFProgressView alloc] init];
        [view setterFloat:1.0];
        _ProgressView = view;
    }
    return _ProgressView;
}

-(UILabel *)whyLabel
{
    if (!_whyLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textAlignment = NSTextAlignmentRight;
        label.textColor =[YFTool YFColorWithString:@"666666"];
        label.text =@"已筹满";
        _whyLabel = label;
    }
    return _whyLabel;
}

-(UILabel *)footerTittleLabel
{
    if (!_footerTittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.numberOfLines = 0;
        label.textColor =[YFTool YFColorWithString:@"999999"];
        label.text =@"住：标的已募集成功，即将放款";
        _footerTittleLabel = label;
    }
    return _footerTittleLabel;
}


-(YFBaseTableView *)YFTableView
{
    if (!_YFTableView) {
        YFBaseTableView *tableView= [[YFBaseTableView alloc] init];
        tableView.separatorColor = LIGHTGREYCOLOR;
        tableView.tableFooterView = [UIView new];
        [tableView setTableHeaderView:self.headerView];
        tableView.scrollEnabled=NO;
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
    if (self.dataDic == nil) {
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
    [cell setterIndexRow:indexPath.row modelArray:@[self.dataDic[@"loanDetail"][@"loanNo"], [NSString stringWithFormat:@"%d个月",[self.dataDic[@"loanDetail"][@"loanDays"] intValue]],str, [NSString stringWithFormat:@"%.2f%%",[self.dataDic[@"loanDetail"][@"rateOfYear"] floatValue]],@"查看"]];
    
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
