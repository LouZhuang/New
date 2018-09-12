//
//  YFFinancialDetailsHeaderView.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/21.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFFinancialDetailsHeaderView.h"
#define YFMineTittle @[@"转让人",@"发起时间",@"项目类型",@"还款方式",@"起息时间",@"最短持有期"]
@implementation YFFinancialDetailsHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    
    if (self) {
     
         [self configuration];
        
    }
    return self;
}

-(void)configuration
{
    
    UIImageView *upImageView = [[UIImageView alloc] init];
    upImageView.backgroundColor=LIGHTGREYCOLOR;
    [self addSubview:upImageView];
    
    upImageView.sd_layout
    .topSpaceToView(self, YF_H(0))
    .leftSpaceToView(self, YF_W(0))
    .widthIs(WIDTH)
    .heightIs(YF_H(10));
    
    
    [self sd_addSubviews:@[self.totalLabel,self.totalNumberLabel,self.moneyLabel,self.moneyNumberLabel,self.instructionsLabel,self.ProgressView,self.whyLabel,self.stayStillLabel,self.stayStillNumberLabel,self.hasBeenCastLabel,self.hasBeenCastNumberLabel,self.cumulativeLabel,self.cumulativeNumberLabel,self.yuanimageView,self.fourLabel,self.peopleLabel,self.faqiLabel,self.typeLabel,self.wayLabel,self.timeLabel,self.shortestLabel,self.checkButton,self.rightImageView]];
    
    self.totalLabel.sd_layout
    .topSpaceToView(self, YF_H(25))
    .leftSpaceToView(self, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(20));
    
    self.totalNumberLabel.sd_layout
    .topSpaceToView(self, YF_H(47))
    .leftSpaceToView(self, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(28));
    
    self.moneyLabel.sd_layout
    .topSpaceToView(self, YF_H(106))
    .leftSpaceToView(self, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(20));
    
    self.moneyNumberLabel.sd_layout
    .topSpaceToView(self, YF_H(128))
    .leftSpaceToView(self, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(28));
    
    self.instructionsLabel.sd_layout
    .topSpaceToView(self, YF_H(182))
    .rightSpaceToView(self, YF_W(14))
    .widthIs(WIDTH- YF_W(28))
    .heightIs(YF_H(17));
    
    self.ProgressView.sd_layout
    .topSpaceToView(self, YF_H(210))
    .leftSpaceToView(self, YF_W(14))
    .widthIs(WIDTH- YF_W(92))
    .heightIs(YF_H(2));
    
    self.whyLabel.sd_layout
    .topSpaceToView(self, YF_H(203))
    .rightSpaceToView(self, YF_W(14))
    .widthIs(YF_W(60))
    .heightIs(YF_H(17));
    
    
    self.stayStillLabel.sd_layout
    .topSpaceToView(self, YF_H(251))
    .leftSpaceToView(self, YF_W(14))
    .widthIs(YF_W(120))
    .heightIs(YF_H(17));
    
    self.stayStillNumberLabel.sd_layout
    .topSpaceToView(self, YF_H(271))
    .leftSpaceToView(self, YF_W(14))
    .widthIs(YF_W(120))
    .heightIs(YF_H(24));
    
    self.hasBeenCastLabel.sd_layout
    .topSpaceToView(self, YF_H(251))
    .leftSpaceToView(self, YF_W(14))
    .widthIs(WIDTH- YF_W(56))
    .heightIs(YF_H(17));
    
    self.hasBeenCastNumberLabel.sd_layout
    .topSpaceToView(self, YF_H(271))
    .leftSpaceToView(self, YF_W(14))
    .widthIs(WIDTH- YF_W(56))
    .heightIs(YF_H(24));
    
    self.cumulativeLabel.sd_layout
    .topSpaceToView(self, YF_H(251))
    .rightSpaceToView(self, YF_W(14))
    .widthIs(YF_W(120))
    .heightIs(YF_H(17));
    
    self.cumulativeNumberLabel.sd_layout
    .topSpaceToView(self, YF_H(271))
    .rightSpaceToView(self, YF_W(14))
    .widthIs(YF_W(120))
    .heightIs(YF_H(24));
    
    self.peopleLabel.sd_layout
    .topSpaceToView(self, YF_H(320))
    .rightSpaceToView(self, YF_W(14))
    .widthIs(YF_W(200))
    .heightIs(YF_H(41));
    
    self.faqiLabel.sd_layout
    .topSpaceToView(self.peopleLabel, YF_H(0))
    .rightSpaceToView(self, YF_W(14))
    .widthIs(YF_W(200))
    .heightIs(YF_H(41));
    
    
    self.typeLabel.sd_layout
    .topSpaceToView(self.faqiLabel, YF_H(0))
    .rightSpaceToView(self, YF_W(14))
    .widthIs(YF_W(200))
    .heightIs(YF_H(41));
    
    self.wayLabel.sd_layout
    .topSpaceToView(self.typeLabel, YF_H(0))
    .rightSpaceToView(self, YF_W(14))
    .widthIs(YF_W(200))
    .heightIs(YF_H(41));
    
    self.timeLabel.sd_layout
    .topSpaceToView(self.wayLabel, YF_H(0))
    .rightSpaceToView(self, YF_W(14))
    .widthIs(YF_W(200))
    .heightIs(YF_H(41));
    
    self.shortestLabel.sd_layout
    .topSpaceToView(self.timeLabel, YF_H(0))
    .rightSpaceToView(self, YF_W(14))
    .widthIs(YF_W(200))
    .heightIs(YF_H(41));
    
    self.checkButton.sd_layout
    .bottomSpaceToView(self, YF_H(10))
    .rightSpaceToView(self, YF_W(0))
    .widthIs(WIDTH)
    .heightIs(YF_H(50));
    
    self.rightImageView.sd_layout
    .bottomSpaceToView(self, YF_H(30))
    .rightSpaceToView(self, YF_W(18))
    .widthIs(YF_W(5))
    .heightIs(YF_H(9));

    
    
    
    UIImageView *imageViewa = [[UIImageView alloc] init];
    imageViewa.backgroundColor=LIGHTGREYCOLOR;
    [self addSubview:imageViewa];
    
    imageViewa.sd_layout
    .topSpaceToView(self, YF_H(90))
    .leftSpaceToView(self, YF_W(14))
    .widthIs(WIDTH-YF_W(28))
    .heightIs(YF_H(1));
    
    UIImageView *imageViewaa = [[UIImageView alloc] init];
    imageViewaa.backgroundColor=LIGHTGREYCOLOR;
    [self addSubview:imageViewaa];
    
    imageViewaa.sd_layout
    .topSpaceToView(self, YF_H(171))
    .leftSpaceToView(self, YF_W(14))
    .widthIs(WIDTH-YF_W(28))
    .heightIs(YF_H(1));
    
    UIImageView *imageViewb = [[UIImageView alloc] init];
    imageViewb.backgroundColor=LIGHTGREYCOLOR;
    [self addSubview:imageViewb];
    
    imageViewb.sd_layout
    .topSpaceToView(self, YF_H(235))
    .leftSpaceToView(self, YF_W(14))
    .widthIs(WIDTH-YF_W(28))
    .heightIs(YF_H(1));
    
    
    
    UIImageView *middleImageView = [[UIImageView alloc] init];
    middleImageView.backgroundColor=LIGHTGREYCOLOR;
    [self addSubview:middleImageView];
    
    middleImageView.sd_layout
    .topSpaceToView(self, YF_H(310))
    .leftSpaceToView(self, YF_W(0))
    .widthIs(WIDTH)
    .heightIs(YF_H(10));
    
    
    for (NSInteger i = 0; i <6; i++) {
        UIImageView *middleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(YF_W(14), YF_H(360) +YF_H(41)*i, WIDTH -YF_W(28), YF_H(1))];
        middleImageView.backgroundColor=LIGHTGREYCOLOR;
        [self addSubview:middleImageView];
    }
    
    
    
    UIImageView *downImageView = [[UIImageView alloc] init];
    downImageView.backgroundColor=LIGHTGREYCOLOR;
    [self addSubview:downImageView];
    
    downImageView.sd_layout
    .bottomSpaceToView(self, YF_H(0))
    .leftSpaceToView(self, YF_W(0))
    .widthIs(WIDTH)
    .heightIs(YF_H(10));
    
}


-(UILabel *)totalLabel
{
    if (!_totalLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =[YFTool YFColorWithString:@"999999"];
        label.text =@"2017年历史年化";
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
        label.text =@"";
        _totalNumberLabel = label;
    }
    return _totalNumberLabel;
}


-(UILabel *)moneyLabel
{
    if (!_moneyLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =[YFTool YFColorWithString:@"999999"];
        label.text =@"转让价格";
        _moneyLabel = label;
    }
    return _moneyLabel;
}


-(UILabel *)moneyNumberLabel
{
    if (!_moneyNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.textColor =ZHUTICOLOR;
//        label.text =@"没有数据元";
        _moneyNumberLabel = label;
    }
    return _moneyNumberLabel;
}


-(UILabel *)instructionsLabel
{
    if (!_instructionsLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =ZHUTICOLOR;
        _instructionsLabel = label;
    }
    return _instructionsLabel;
}

-(YFProgressView *)ProgressView
{
    if (!_ProgressView) {
        YFProgressView *view = [[YFProgressView alloc] init];
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
        label.text =@"";
        _whyLabel = label;
    }
    return _whyLabel;
}




-(UILabel *)stayStillLabel
{
    if (!_stayStillLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =[YFTool YFColorWithString:@"999999"];
        label.text =@"项目规模(元)";
        _stayStillLabel = label;
    }
    return _stayStillLabel;
}


-(UILabel *)stayStillNumberLabel
{
    if (!_stayStillNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textColor =ZHUTICOLOR;
        label.text =@"";
        _stayStillNumberLabel = label;
    }
    return _stayStillNumberLabel;
}



-(UILabel *)hasBeenCastLabel
{
    if (!_hasBeenCastLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textAlignment= NSTextAlignmentCenter;
        label.textColor =[YFTool YFColorWithString:@"999999"];
        label.text =@"锁定期限(月)";
        _hasBeenCastLabel = label;
    }
    return _hasBeenCastLabel;
}


-(UILabel *)hasBeenCastNumberLabel
{
    if (!_hasBeenCastNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textAlignment= NSTextAlignmentCenter;
        label.textColor =ZHUTICOLOR;
        label.text =@"";
        _hasBeenCastNumberLabel = label;
    }
    return _hasBeenCastNumberLabel;
}



-(UILabel *)cumulativeLabel
{
    if (!_cumulativeLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =[YFTool YFColorWithString:@"999999"];
        label.text =@"最低出借金额(元)";
        label.textAlignment=NSTextAlignmentRight;
        _cumulativeLabel = label;
    }
    return _cumulativeLabel;
}


-(UILabel *)cumulativeNumberLabel
{
    if (!_cumulativeNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textColor =ZHUTICOLOR;
        label.textAlignment=NSTextAlignmentRight;
        label.text =@"";
        _cumulativeNumberLabel = label;
    }
    return _cumulativeNumberLabel;
}



-(UIImageView *)yuanimageView
{
    if (!_yuanimageView) {
        for (NSInteger i = 0; i < 6; i++) {
            
        UIImageView *imageView =[[UIImageView alloc] initWithFrame:CGRectMake(YF_W(14), YF_H(337) +i*YF_H(41), YF_W(6), YF_H(6))];
        imageView.backgroundColor=ZHUTICOLOR;
        imageView.layer.cornerRadius=YF_W(6)/2;
        imageView.layer.masksToBounds=YES;
        _yuanimageView = imageView;
        [self addSubview:_yuanimageView];
        }
    }
    return _yuanimageView;
}

-(UILabel *)fourLabel
{
    if (!_fourLabel) {
         for (NSInteger i = 0; i < 6; i++) {
             
             UILabel *label =[[UILabel alloc] initWithFrame:CGRectMake(YF_W(26), YF_H(320) +i*YF_H(41), YF_W(150), YF_H(41))];
             label.font = YF_FONT(14);
             label.textColor =YF666;
             label.text =[YFMineTittle objectAtIndex:i];
             _fourLabel = label;
             [self addSubview:_fourLabel];
         }
    }
    return _fourLabel;
}


-(UILabel *)peopleLabel
{
    if (!_peopleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF333;
        label.textAlignment=NSTextAlignmentRight;
        label.text =@"";
        _peopleLabel = label;
    }
    return _peopleLabel;
}

-(UILabel *)faqiLabel
{
    if (!_faqiLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF333;
        label.textAlignment=NSTextAlignmentRight;
        label.text =@"";
        _faqiLabel = label;
    }
    return _faqiLabel;
}

-(UILabel *)typeLabel
{
    if (!_typeLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF333;
        label.textAlignment=NSTextAlignmentRight;
        label.text =@"";
        _typeLabel = label;
    }
    return _typeLabel;
}



-(UILabel *)wayLabel
{
    if (!_wayLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF333;
        label.textAlignment=NSTextAlignmentRight;
        label.text =@"";
        _wayLabel = label;
    }
    return _wayLabel;
}



-(UILabel *)timeLabel
{
    if (!_timeLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF333;
        label.textAlignment=NSTextAlignmentRight;
        label.text =@"";
        _timeLabel = label;
    }
    return _timeLabel;
}



-(UILabel *)shortestLabel
{
    if (!_shortestLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF333;
        label.textAlignment=NSTextAlignmentRight;
        label.text =@"";
        _shortestLabel = label;
    }
    return _shortestLabel;
}



-(UIImageView *)rightImageView
{
    if (!_rightImageView) {
        UIImageView *imageView =[[UIImageView alloc] init];
        imageView.image=[UIImage imageNamed:@"rightImage"];
        _rightImageView = imageView;
    }
    return _rightImageView;
}

-(UIButton *)checkButton
{
    if (!_checkButton) {
        
        UIButton *button =[[UIButton alloc] init];
        button.titleLabel.font = YF_FONT(14);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.titleEdgeInsets =UIEdgeInsetsMake(0,YF_W(14),0,0);
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button setTitleColor:YF333 forState:UIControlStateNormal];
        [button setTitle:@"查看原借款标" forState:UIControlStateNormal];
        _checkButton = button;
    }
    return _checkButton;
}

-(void)setterHomePageModel:(YFHomePageModel *)model
{
    self.totalNumberLabel.text=[NSString stringWithFormat:@"%@%%",model.rateOfYear];
    NSString *string =[NSString stringWithFormat:@"剩余可投%.2f元",[model.residue floatValue]];
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithString:string];
    [aString addAttribute:NSForegroundColorAttributeName value:[YFTool YFColorWithString:@"999999"] range:NSMakeRange(0, 4)];
    self.instructionsLabel.attributedText =aString;
    
    double count = 1 - [model.residue floatValue]/[model.projectSize floatValue];
     [self.ProgressView setterFloat:count];
    if ([model.residue floatValue] == 0) {
        count = 1;
    }
    self.whyLabel.text=[NSString stringWithFormat:@"已筹%.2f%%",count*100];
   
    self.stayStillNumberLabel.text=[NSString stringWithFormat:@"%.2f",[model.projectSize floatValue]];
    self.hasBeenCastNumberLabel.text=[NSString stringWithFormat:@"%@",model.limitDays];
    self.cumulativeNumberLabel.text=[NSString stringWithFormat:@"%.2f",[model.investmentMin floatValue]];
    self.typeLabel.text=model.type;
    self.wayLabel.text=model.repayType;
    self.timeLabel.text=  model.rateStartType; //[YFTool timeWithTimeIntervalString:model.rateStart Format:@"yyyy-MM-dd HH:mm:ss"];  //model.rateStart;
    self.shortestLabel.text=@"30天";
    self.moneyNumberLabel.text = model.projectSize;
    if (model.transfer != nil) {
        NSMutableString * safeBase64Str = [[NSMutableString alloc]initWithString:model.transfer];
        safeBase64Str = (NSMutableString * )[safeBase64Str stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
        safeBase64Str = (NSMutableString * )[safeBase64Str stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
        NSInteger mod4 = safeBase64Str.length % 4;
        if(mod4 > 0)
        {
            [safeBase64Str appendString:[@"====" substringToIndex:(4-mod4)]];
        }
        self.peopleLabel.text= [safeBase64Str aci_decryptWithAES];
    }else{
       self.peopleLabel.text= @"无";
    }
   
    self.faqiLabel.text=[YFTool timeWithTimeIntervalString:model.createTime Format:@"YYYY-MM-dd"];
    
}






@end
