//
//  YFNormalFinancialView.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/21.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFNormalFinancialView.h"
#define YFMineTittle @[@"项目类型",@"还款方式",@"起息时间",@"最短持有期"]
@implementation YFNormalFinancialView


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
    
    
    [self sd_addSubviews:@[self.totalLabel,self.totalNumberLabel,self.instructionsLabel,self.ProgressView,self.whyLabel,self.stayStillLabel,self.stayStillNumberLabel,self.hasBeenCastLabel,self.hasBeenCastNumberLabel,self.cumulativeLabel,self.cumulativeNumberLabel,self.yuanimageView,self.fourLabel,self.typeLabel,self.wayLabel,self.timeLabel,self.shortestLabel]];
    
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
    
   
    self.instructionsLabel.sd_layout
    .topSpaceToView(self, YF_H(101))
    .rightSpaceToView(self, YF_W(14))
    .widthIs(WIDTH- YF_W(28))
    .heightIs(YF_H(17));
    
    self.ProgressView.sd_layout
    .topSpaceToView(self, YF_H(129))
    .leftSpaceToView(self, YF_W(14))
    .widthIs(WIDTH- YF_W(92))
    .heightIs(YF_H(2));
    
    self.whyLabel.sd_layout
    .topSpaceToView(self, YF_H(122))
    .rightSpaceToView(self, YF_W(14))
    .widthIs(YF_W(63))
    .heightIs(YF_H(17));
    
    
    self.stayStillLabel.sd_layout
    .topSpaceToView(self, YF_H(170))
    .leftSpaceToView(self, YF_W(14))
    .widthIs(YF_W(120))
    .heightIs(YF_H(17));
    
    self.stayStillNumberLabel.sd_layout
    .topSpaceToView(self, YF_H(190))
    .leftSpaceToView(self, YF_W(14))
    .widthIs(YF_W(120))
    .heightIs(YF_H(24));
    
    self.hasBeenCastLabel.sd_layout
    .topSpaceToView(self, YF_H(170))
    .leftSpaceToView(self, YF_W(14))
    .widthIs(WIDTH- YF_W(56))
    .heightIs(YF_H(17));
    
    self.hasBeenCastNumberLabel.sd_layout
    .topSpaceToView(self, YF_H(190))
    .leftSpaceToView(self, YF_W(14))
    .widthIs(WIDTH- YF_W(56))
    .heightIs(YF_H(24));
    
    self.cumulativeLabel.sd_layout
    .topSpaceToView(self, YF_H(170))
    .rightSpaceToView(self, YF_W(14))
    .widthIs(YF_W(120))
    .heightIs(YF_H(17));
    
    self.cumulativeNumberLabel.sd_layout
    .topSpaceToView(self, YF_H(190))
    .rightSpaceToView(self, YF_W(14))
    .widthIs(YF_W(120))
    .heightIs(YF_H(24));
    
    
    self.typeLabel.sd_layout
    .topSpaceToView(self, YF_H(239))
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
    .topSpaceToView(self, YF_H(154))
    .leftSpaceToView(self, YF_W(14))
    .widthIs(WIDTH-YF_W(28))
    .heightIs(YF_H(1));


    
    UIImageView *middleImageView = [[UIImageView alloc] init];
    middleImageView.backgroundColor=LIGHTGREYCOLOR;
    [self addSubview:middleImageView];
    
    middleImageView.sd_layout
    .topSpaceToView(self, YF_H(229))
    .leftSpaceToView(self, YF_W(0))
    .widthIs(WIDTH)
    .heightIs(YF_H(10));
    
    
    for (NSInteger i = 0; i <4; i++) {
        UIImageView *middleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(YF_W(14), YF_H(279) +YF_H(41)*i, WIDTH -YF_W(28), YF_H(1))];
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
        label.text =@"0.00";
        _cumulativeNumberLabel = label;
    }
    return _cumulativeNumberLabel;
}



-(UIImageView *)yuanimageView
{
    if (!_yuanimageView) {
        for (NSInteger i = 0; i < 4; i++) {
            
            UIImageView *imageView =[[UIImageView alloc] initWithFrame:CGRectMake(YF_W(14), YF_H(256) +i*YF_H(41), YF_W(6), YF_H(6))];
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
        for (NSInteger i = 0; i < 4; i++) {
            
            UILabel *label =[[UILabel alloc] initWithFrame:CGRectMake(YF_W(26), YF_H(239) +i*YF_H(41), YF_W(150), YF_H(41))];
            label.font = YF_FONT(14);
            label.textColor =YF666;
            label.text =[YFMineTittle objectAtIndex:i];
            _fourLabel = label;
            [self addSubview:_fourLabel];
        }
    }
    return _fourLabel;
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

-(void)setterHomePageModel:(YFHomePageModel *)model andDic:(NSDictionary *)dic
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
    self.whyLabel.text=[NSString stringWithFormat:@"已筹%.0f%%",count*100];
   
    
    self.stayStillNumberLabel.text=[NSString stringWithFormat:@"%.2f",[model.projectSize floatValue]];
    
    self.hasBeenCastNumberLabel.text=[NSString stringWithFormat:@"%@",model.limitDays];
    
    self.cumulativeNumberLabel.text=[NSString stringWithFormat:@"%.2f",[model.investmentMin floatValue]];
    
    self.typeLabel.text=model.type;
    self.wayLabel.text=model.repayType;
    
    self.timeLabel.text= dic[@"projectEntity"][@"rateStartType"]; // [YFTool timeWithTimeIntervalString:model.rateStart Format:@"yyyy-MM-dd HH:mm:ss"];//model.rateStart;
    self.shortestLabel.text=@"30天";
    
}




@end
