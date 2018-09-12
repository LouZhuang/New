//
//  YFOnScheduleViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFOnScheduleViewController.h"

@interface YFOnScheduleViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate>
/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

/*
 头部image
 */
@property(nonatomic,strong)UIImageView *imageView;

/*
 back
 */
@property(nonatomic,strong)UIButton *backButton;

/*
tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 subit
 */
@property(nonatomic,strong)UILabel *subitLabel;

/*
 number
 */
@property(nonatomic,strong)UILabel *numberLabel;


/*
 shuoming
 */
@property(nonatomic,strong)UILabel *pleaseLabel;



@end

@implementation YFOnScheduleViewController
static NSString *cellId = @"YFOnScheduleTableViewCell";

/*
 视图将要显示
 */
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
     [self configuration];
    // Do any additional setup after loading the view.
//    OnScheduleImage

}


-(void)configuration
{
    [self.view sd_addSubviews:@[self.imageView,self.YFTableView]];
    
    self.imageView.sd_layout
    .topSpaceToView(self.view, YF_H(0))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(YF_H(182));
    
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, YF_H(182))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(HEIGHT -YF_H(182));
    
    [self.imageView sd_addSubviews:@[self.backButton,self.tittleLabel,self.subitLabel,self.numberLabel,self.pleaseLabel]];
    
    self.backButton.sd_layout
    .topSpaceToView(self.imageView, YF_H(36))
    .leftSpaceToView(self.imageView, YF_W(14))
    .widthIs(YF_W(7))
    .heightIs(YF_H(12));
    
    self.tittleLabel.sd_layout
    .topSpaceToView(self.imageView, YF_H(30))
    .centerXEqualToView(self.imageView)
    .widthIs(90)
    .heightIs(YF_H(24));
    
    self.subitLabel.sd_layout
    .topSpaceToView(self.imageView, YF_H(84))
    .centerXEqualToView(self.imageView)
    .widthIs(WIDTH)
    .heightIs(YF_H(20));
    
    self.numberLabel.sd_layout
    .topSpaceToView(self.imageView, YF_H(108))
    .centerXEqualToView(self.imageView)
    .widthIs(WIDTH)
    .heightIs(YF_H(33));
    
    self.pleaseLabel.sd_layout
    .topSpaceToView(self.imageView, YF_H(145))
    .centerXEqualToView(self.imageView)
    .widthIs(WIDTH)
    .heightIs(YF_H(17));
    
    
}

-(UIImageView *)imageView
{
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image=[UIImage imageNamed:@"OnScheduleImage"];
        imageView.userInteractionEnabled =YES;
        _imageView = imageView;
    }
    return _imageView;
}

-(UIButton *)backButton
{
    if (!_backButton) {
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"backbaiImage"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        [button setEnlargeEdge:YF_W(60)];
        _backButton = button;
    }
    return _backButton;
}
-(void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textColor =WHITECOLOR;
        label.textAlignment=NSTextAlignmentCenter;
        label.text =@"按期还款";
        _tittleLabel = label;
    }
    return _tittleLabel;
}


-(UILabel *)subitLabel
{
    if (!_subitLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =WHITECOLOR;
        label.textAlignment=NSTextAlignmentCenter;
        label.text =@"还款日自动还款";
        _subitLabel = label;
    }
    return _subitLabel;
}


-(UILabel *)numberLabel
{
    if (!_numberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(24);
        label.textColor =WHITECOLOR;
        label.textAlignment=NSTextAlignmentCenter;
//        label.text =@"10,000.00";
        _numberLabel = label;
    }
    return _numberLabel;
}

-(UILabel *)pleaseLabel
{
    if (!_pleaseLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =WHITECOLOR;
        label.textAlignment=NSTextAlignmentCenter;
        label.text =@"请保持默认扣款账户资金充足";
        _pleaseLabel = label;
    }
    return _pleaseLabel;
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
    
    return YF_H(90);
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFOnScheduleTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFOnScheduleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    [cell indexPath:indexPath.row andDic:self.dataArr[indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

}



/*
 视图将要消失
 */
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    
}


- (void)setDataArr:(NSArray *)dataArr
{
    _dataArr = dataArr;
    [self.YFTableView reloadData];
}
- (void)setTotalMoney:(NSString *)totalMoney
{
    _totalMoney = totalMoney;
    self.numberLabel.text = totalMoney;
}
@end
