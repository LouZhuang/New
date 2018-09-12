//
//  YFHomePageFooterTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/19.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFHomePageFooterTableViewCell.h"
#define YFMineTittle1 @[@"基本信息",@"备案信息",@"审核信息",@"经营信息",@"重大事项",@"法律法规",@"消费者咨询\n及投诉渠道",@"去年公示",@"法人代表\n承诺书"]
#define YFMineTittle2 @[@"homeImage0",@"homeImage1",@"homeImage2"]
#define YFMineTittle22 @[@"homedownImage0",@"homedownImage1",@"homedownImage2"]
#define YFMineTittle3 @[@"关于金米袋",@"运营报告",@"投资者教育"]
#define YFMineTittle4 @[@"金城银行\n资金存管",@"多重手段\n数据保护",@"资本背书\n严控风险"]
@implementation YFHomePageFooterTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self configuration];
        
    }
    return self;
}

-(void)configuration
{
    
    [self.contentView sd_addSubviews:@[self.turnoverNumberLabel,self.turnoverLabel,self.registeredNumberLabel,self.registeredLabel,self.aboutView,self.YFScrollerView,self.threeView]];
    
    self.turnoverNumberLabel.sd_layout
    .topSpaceToView(self.contentView, YF_W(4))
    .leftSpaceToView(self.contentView, YF_W(0))
    .widthIs(WIDTH/2)
    .heightIs(YF_H(28));
    
    self.turnoverLabel.sd_layout
    .topSpaceToView(self.turnoverNumberLabel, YF_W(2))
    .leftSpaceToView(self.contentView, YF_W(0))
    .widthIs(WIDTH/2)
    .heightIs(YF_H(17));
    
    self.registeredNumberLabel.sd_layout
    .topSpaceToView(self.contentView, YF_W(4))
    .rightSpaceToView(self.contentView, YF_W(0))
    .widthIs(WIDTH/2)
    .heightIs(YF_H(28));
    
    self.registeredLabel.sd_layout
    .topSpaceToView(self.registeredNumberLabel, YF_W(2))
    .rightSpaceToView(self.contentView, YF_W(0))
    .widthIs(WIDTH/2)
    .heightIs(YF_H(17));
    
    
    self.aboutView.sd_layout
    .topSpaceToView(self.contentView, YF_H(172))
    .rightSpaceToView(self.contentView, YF_W(0))
    .widthIs(WIDTH)
    .heightIs(YF_H(58));
    
    [self.aboutView sd_addSubviews:@[self.aboutThreeLabel,self.aboutButton]];
    
    
    
    
    self.YFScrollerView.sd_layout
    .topSpaceToView(self.contentView, YF_W(66.6))
    .rightSpaceToView(self.contentView, YF_W(0))
    .widthIs(WIDTH)
    .heightIs(YF_H(84.9));
    
    
    [self.YFScrollerView sd_addSubviews:@[self.scrollerButton]];
    
    self.threeView.sd_layout
    .bottomEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(0))
    .widthIs(WIDTH)
    .heightIs(YF_H(102));
    
    [self.threeView sd_addSubviews:@[self.downThreeLabel,self.downButton]];
    
}


-(UILabel *)turnoverNumberLabel
{
    if (!_turnoverNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.textColor =ZHUTICOLOR;
        label.text =@"500亿";
        label.textAlignment =NSTextAlignmentCenter;
        _turnoverNumberLabel = label;
    }
    return _turnoverNumberLabel;
}

-(UILabel *)turnoverLabel
{
    if (!_turnoverLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF999;
        label.text =@"累计成交额(元)";
        label.textAlignment =NSTextAlignmentCenter;
        _turnoverLabel = label;
    }
    return _turnoverLabel;
}


-(UILabel *)registeredNumberLabel
{
    if (!_registeredNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.textColor =ZHUTICOLOR;
        label.text =@"700万";
        label.textAlignment =NSTextAlignmentCenter;
        _registeredNumberLabel = label;
    }
    return _registeredNumberLabel;
}


-(UILabel *)registeredLabel
{
    if (!_registeredLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF999;
        label.text =@"累计注册人数";
        label.textAlignment =NSTextAlignmentCenter;
        _registeredLabel = label;
    }
    return _registeredLabel;
}

-(UIScrollView *)YFScrollerView
{
    if (!_YFScrollerView) {
        UIScrollView *scrollerView=[[UIScrollView alloc] init];
        scrollerView.showsHorizontalScrollIndicator=NO;
        [scrollerView setContentSize:CGSizeMake(YF_W(1144), 0)];
        _YFScrollerView=scrollerView;
        
    }
    return _YFScrollerView;
}

-(UIButton *)scrollerButton
{
    if (!_scrollerButton) {
        
        for (NSInteger i =0; i < 9; i ++)
        {
            UIButton *button =[[UIButton alloc] init];
            button.frame = CGRectMake(10*(i+1)+i * YF_W(116), YF_H(0), YF_W(116), YF_H(84.9));
            [button setBackgroundImage:[UIImage imageNamed:@"kuaikuaiImage"] forState:UIControlStateNormal];
            button.titleLabel.font = YF_FONT(14);
            button.titleLabel.numberOfLines=2;
            button.titleLabel.textAlignment = NSTextAlignmentCenter;
            [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
            [button setTitle:[YFMineTittle1 objectAtIndex:i] forState:UIControlStateNormal];
            button.tag=i;
            [button addTarget:self action:@selector(InformationDisclosureClick:) forControlEvents:UIControlEventTouchUpInside];
            _scrollerButton = button;
            [self.YFScrollerView addSubview:_scrollerButton];
        }
    }
    return _scrollerButton;
}
-(void)InformationDisclosureClick:(UIButton *)sender
{
    YFInformationDisclosureViewController *YFInformationDisclosureVC=[[YFInformationDisclosureViewController alloc]init];
    YFInformationDisclosureVC.index=sender.tag;
    [[YFTool getCurrentVC].navigationController pushViewController:YFInformationDisclosureVC animated:YES];
}



-(UIView *)aboutView
{
    if (!_aboutView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = WHITECOLOR;
        view.userInteractionEnabled =YES;
        _aboutView = view;
    }
    return _aboutView;
}

-(UIView *)threeView
{
    if (!_threeView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = LIGHTGREYCOLOR;
        view.userInteractionEnabled =YES;
        _threeView = view;
    }
    return _threeView;
}

-(UILabel *)downThreeLabel
{
    if (!_downThreeLabel) {
        
        for (NSInteger i =0; i < 3; i ++)
        {
            UILabel *label =[[UILabel alloc] init];
            label.frame = CGRectMake(i* WIDTH/3, YF_H(53), WIDTH/3, YF_H(34));
            label.font = YF_FONT(12);
            label.numberOfLines =0;
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor =YF999;
            label.text =[YFMineTittle4 objectAtIndex:i];
            _downThreeLabel = label;
            [_threeView addSubview:_downThreeLabel];
        }
    }
    return _downThreeLabel;
}

-(UILabel *)aboutThreeLabel
{
    if (!_aboutThreeLabel) {
        
        for (NSInteger i =0; i < 3; i ++)
        {
            UILabel *label =[[UILabel alloc] init];
            label.frame = CGRectMake(i* WIDTH/3, YF_H(38), WIDTH/3, YF_H(20));
            label.font = YF_FONT(14);
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor =YF666;
            label.text =[YFMineTittle3 objectAtIndex:i];
            _aboutThreeLabel = label;
            [_aboutView addSubview:_aboutThreeLabel];
        }
    }
    return _aboutThreeLabel;
}

-(UIButton *)aboutButton
{
    if (!_aboutButton) {
        
        for (NSInteger i =0; i < 3; i ++)
        {
            UIButton *button =[[UIButton alloc] init];
            if (i==0) {
                button.frame = CGRectMake((WIDTH /3 -YF_W(32))/2, YF_H(0), YF_W(32), YF_H(30));
            }
            if (i==1) {
                button.frame = CGRectMake(WIDTH /3 +(WIDTH /3 -YF_W(23))/2, YF_H(0),YF_W(23), YF_H(30));
            }
            if (i==2) {
                button.frame = CGRectMake(WIDTH /3 *2 + (WIDTH /3 -YF_W(30))/2, YF_H(0), YF_W(30), YF_H(30));
            }
            button.tag= i;
            [button setBackgroundImage:[UIImage imageNamed:[YFMineTittle2 objectAtIndex:i]] forState:UIControlStateNormal];
            _aboutButton = button;
            [button addTarget:self action:@selector(aboutClick:) forControlEvents:UIControlEventTouchUpInside];
            [_aboutView addSubview:_aboutButton];
        }
    }
    return _aboutButton;
}

-(void)aboutClick:(UIButton *)sender
{
    if (sender.tag==0) {
        [YFProgressHUD showInfoWithStatus:@"关于金米袋"];
    }
    if (sender.tag==1) {
        [YFProgressHUD showInfoWithStatus:@"运营报告"];
    }
    if (sender.tag==2) {
        [YFProgressHUD showInfoWithStatus:@"投资者教育"];
    }
}

-(UIButton *)downButton
{
    if (!_downButton) {
        
        for (NSInteger i =0; i < 3; i ++)
        {
            UIButton *button =[[UIButton alloc] init];
            if (i==0) {
                button.frame = CGRectMake((WIDTH /3 -YF_W(33))/2, YF_H(15), YF_W(33), YF_H(33));
            }
            if (i==1) {
                button.frame = CGRectMake(WIDTH /3 +(WIDTH /3 -YF_W(32))/2, YF_H(15),YF_W(32), YF_H(30));
            }
            if (i==2) {
                button.frame = CGRectMake(WIDTH /3 *2 + (WIDTH /3 -YF_W(31))/2, YF_H(15), YF_W(31), YF_H(30));
            }
            button.tag= i;
            button.userInteractionEnabled=NO;
            [button setBackgroundImage:[UIImage imageNamed:[YFMineTittle22 objectAtIndex:i]] forState:UIControlStateNormal];
            _downButton = button;
            [_threeView addSubview:_downButton];
        }
    }
    return _downButton;
}

-(void)setterSetionTwo
{
   
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
