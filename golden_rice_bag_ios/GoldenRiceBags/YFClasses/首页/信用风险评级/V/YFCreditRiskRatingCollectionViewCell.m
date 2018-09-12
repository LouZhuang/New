//
//  YFCreditRiskRatingCollectionViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/15.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFCreditRiskRatingCollectionViewCell.h"

#define YFTittle @[@[@"A.固定职业，收入稳定，变化不大",@"B.固定职业，以佣金收入为主",@"C.创业者或企业主",@"E.自由职业"],@[@"A.高中及以下",@"B.中专或大专",@"C.本科",@"D.硕士",@"E.博士及以上"],@[@"A.1-3个月",@"B.3-6个月",@"C.6-12个月"],@[@"A.小于10%",@"B.10%至25%",@"C.25%至50%"],@[@"A.资产保值，我不愿意承担任何投资风险",@"B.资产在保值的基础上，有小幅增长，我可以承担较低的投资风险",@"C.资产稳健增长，我可以承担一定的投资风险",@"D.资产迅速增长，我愿意承担很大的投资风险",@"E.大于50%"],@[@"A.理财产品无风险，类似存款",@"B.理财产品应当保本，但收益不确定",@"C.理财产品本金可能产生少量损失",@"D.理财产品可能大幅亏损，应当仔细选择"],@[@"A.10万元以下",@"B.10-50万元",@"C.50-100万元",@"D.100-500万元",@"E.500万元以上"],@[@"A.基本没有金融产品相关知识，除存款、国债外，我几乎不投资其他金融产品",@"B.对金融产品有初步认识，除投资于存款、国债外，偶尔投资于股票、基金等产品",@"C.对金融产品有一定的理解，投资过存款、国债、银行理财产品、信托产品、股票、基金等产品",@"D.对金融产品充分理解，主要投资于股票、基金、外汇、金融衍生品、海外投资产品等产品",@"E.金融专业人士，长期投资于证券、期货等产品"],@[@"A.全部投资于收益较小且风险较小的A",@"B.同时投资于A和B，但大部分资金投资于收益较小且风险较小的A",@"C.同时投资于A和B，但大部分资金投资于收益较大且风险较大的B",@"D.全部投资于收益较大且风险较大的B"],@[@"A.没有经验",@"B.少于2年",@"C.2至5年",@"D.5至10年",@"E.10年以上"],@[@"A.本金无损失，但收益未达预期",@"B.出现轻微本金损失",@"C.本金10％以内的损失",@"D.本金20-50％的损失",@"E.本金50％以上损失 "],@[@"A.风险就是损失",@"B.风险代表不确定性,可能会带来收益,也可能带来损失",@"C.风险代表机会,可能带来收益",@"D.风险代表巨大的额外收益机会"]]

@implementation YFCreditRiskRatingCollectionViewCell
{
    NSInteger selctRow;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _selectType =10;
        [self configuration];
        
        
    }
    
    return self;
}


-(void)configuration
{
    
    [self.contentView sd_addSubviews:@[self.headerView,self.YFTableView,self.footerView]];
    
    self.headerView.sd_layout
    .topEqualToView(self.contentView)
    .leftEqualToView(self.contentView)
    .widthIs(WIDTH)
    .heightIs(YF_H(30));
    
     [self.headerView sd_addSubviews:@[self.headerTittle]];

    self.YFTableView.sd_layout
    .topSpaceToView(self.headerView, YF_H(0))
    .leftEqualToView(self.contentView)
    .widthIs(WIDTH)
    .heightIs(YF_H(150));
    
    
    self.footerView.sd_layout
    .topSpaceToView(self.YFTableView, YF_H(0))
    .leftEqualToView(self.contentView)
    .widthIs(WIDTH)
    .heightIs(YF_H(300));
    
    [self.footerView sd_addSubviews:@[self.OnATopicButton,self.NextQuestionButton]];
    
    self.OnATopicButton.sd_layout
    .topSpaceToView(self.footerView, YF_H(50))
    .leftSpaceToView(self.footerView, YF_W(68))
    .widthIs(WIDTH -YF_W(136))
    .heightIs(YF_H(49));
    
    self.NextQuestionButton.sd_layout
    .topSpaceToView(self.OnATopicButton, YF_H(20))
    .leftSpaceToView(self.footerView, YF_W(68))
    .widthIs(WIDTH -YF_W(136))
    .heightIs(YF_H(49));
    

  
}

#pragma mark - lazy

-(UIView *)headerView
{
    if (!_headerView) {
        UIView *view =[[UIView alloc] init];
        view.backgroundColor = WHITECOLOR;
        _headerView=view;
    }

    return _headerView;
}

-(UIView *)footerView
{
    if (!_footerView) {
        UIView *view =[[UIView alloc] init];
        view.backgroundColor = WHITECOLOR;
        _footerView=view;
    }
    
    return _footerView;
}


-(UILabel *)headerTittle
{
    if (!_headerTittle) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.numberOfLines =0;
        label.textColor =[YFTool YFColorWithString:@"666666"];
        _headerTittle = label;
    }
    return _headerTittle;
}


-(UIButton *)OnATopicButton
{
    if (!_OnATopicButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitle:@"上一题" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.layer.cornerRadius = YF_W(25);
        button.layer.masksToBounds = YES;
        button.titleLabel.font = YF_FONT(17);
//        [button addTarget:self action:@selector(OnATopicClick) forControlEvents:UIControlEventTouchUpInside];
        _OnATopicButton = button;
        
    }
    return _OnATopicButton;
}


-(UIButton *)NextQuestionButton
{
    if (!_NextQuestionButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor = [YFTool YFColorWithString:@"DDDDDD"];
        [button setTitle:@"下一题" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.layer.cornerRadius = YF_W(25);
        button.layer.masksToBounds = YES;
        button.userInteractionEnabled=NO;
        button.titleLabel.font = YF_FONT(17);
//        [button addTarget:self action:@selector(OnATopicClick) forControlEvents:UIControlEventTouchUpInside];
        _NextQuestionButton = button;
        
    }
    return _NextQuestionButton;
}




-(YFBaseTableView *)YFTableView
{
    if (!_YFTableView) {
        YFBaseTableView *tableView= [[YFBaseTableView alloc] init];
        tableView.separatorColor = LIGHTGREYCOLOR;
        tableView.tableFooterView =[UIView new];
        tableView.scrollEnabled=NO;
        tableView.delegate = self;
        tableView.dataSource =self;
        _YFTableView =tableView;
    }
    return _YFTableView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YF_H(30) +[YFTool lableHeight:[[YFTittle objectAtIndex:selctRow] objectAtIndex:indexPath.row] labelFont:YF_W(14) WD:YF_W(320) Bold:NO];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[YFTittle objectAtIndex:selctRow] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"YFCreditRiskRatingTableViewCell";
    YFCreditRiskRatingTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFCreditRiskRatingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    cell.backgroundColor = WHITECOLOR;
    
    
    [cell setterSelectRow:_selectType indexPath:indexPath.row contentArray:[YFTittle objectAtIndex:selctRow]];

    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    /*
     投资类型
     */
  
    if (selctRow==4&&indexPath.row==0) {

        [YFTool setObject:@"稳健性" key:@"Types"];
        
    }
    if (selctRow==4&&indexPath.row!=0) {
        
         [YFTool setObject:@"进取型" key:@"Types"];
        
    }
    
    _selectType =indexPath.row;
    [_YFTableView reloadData];
    self.NextQuestionButton.backgroundColor =ZHUTICOLOR;
     self.NextQuestionButton.userInteractionEnabled=YES;
}


-(void)setterHeaderString:(NSString *)header indexPathRow:(NSInteger)row
{
    
    selctRow=row;
    CGFloat tableViewHeight=0;
    
    for (NSInteger i = 0; i <[[YFTittle objectAtIndex:selctRow] count]; i++) {
        tableViewHeight=tableViewHeight + YF_H(30) +[YFTool lableHeight:[[YFTittle objectAtIndex:selctRow] objectAtIndex:i] labelFont:YF_W(14) WD:YF_W(320) Bold:NO];
    }
    
    
    
    CGSize Size = [header boundingRectWithSize:CGSizeMake(WIDTH - YF_W(28), MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:YF_W(14)]} context:nil].size;

    self.headerView.sd_resetLayout
    .topEqualToView(self.contentView)
    .leftEqualToView(self.contentView)
    .widthIs(WIDTH)
    .heightIs(Size.height +YF_H(30));
    
    self.headerTittle.sd_layout
    .topSpaceToView(self.headerView, YF_H(15))
    .leftSpaceToView(self.headerView, YF_W(14))
    .widthIs(WIDTH -YF_W(28))
    .heightIs(Size.height+YF_H(15));
    
    /*
     题目赋值
     */
    self.headerTittle.text =header;
    

    self.YFTableView.sd_resetLayout
    .topSpaceToView(self.headerView, YF_H(0))
    .leftEqualToView(self.contentView)
    .widthIs(WIDTH)
    .heightIs(tableViewHeight);

    self.footerView.sd_resetLayout
    .topSpaceToView(self.YFTableView, YF_H(0))
    .leftEqualToView(self.contentView)
    .widthIs(WIDTH)
    .heightIs(YF_H(300));

    
    self.OnATopicButton.tag = row;
    self.NextQuestionButton.tag = row;
    
    
    
    if (row ==0) {

        self.OnATopicButton.hidden = YES;
        self.NextQuestionButton.sd_resetLayout
        .topSpaceToView(self.footerView, YF_H(50))
        .leftSpaceToView(self.footerView, YF_W(68))
        .widthIs(WIDTH -YF_W(136))
        .heightIs(YF_H(49));
        
    }
    
    
}





















@end
