//
//  TFMyRedPacketsFailureTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/24.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "TFMyRedPacketsFailureTableViewCell.h"

@implementation TFMyRedPacketsFailureTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self configuration];
    }
    return self;
}

-(void)configuration
{
    [self.contentView sd_addSubviews:@[self.leftDownView,self.rightDownView]];
    
    self.leftDownView.sd_layout
    .topSpaceToView(self.contentView, YF_H(15))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(222))
    .heightIs(YF_H(112));
    
    
    [self.leftDownView sd_addSubviews:@[self.numericalLabel,self.usingRangeLabel,self.DottedImageView,self.periodLabel,self.instructionsLabel,self.upLabel]];
    
    self.numericalLabel.sd_layout
    .topSpaceToView(self.leftDownView, YF_H(8))
    .leftSpaceToView(self.leftDownView, YF_W(12))
    .widthIs(YF_W(90))
    .heightIs(YF_H(28));
    
    self.usingRangeLabel.sd_layout
    .topSpaceToView(self.leftDownView, YF_H(10))
    .rightSpaceToView(self.leftDownView, YF_W(0))
    .widthIs(YF_W(126))
    .heightIs(YF_H(20));
    
    self.DottedImageView.sd_layout
    .topSpaceToView(self.leftDownView, YF_H(38))
    .rightSpaceToView(self.leftDownView, YF_W(0))
    .widthIs(YF_W(209))
    .heightIs(YF_H(1));
    
    self.periodLabel.sd_layout
    .topSpaceToView(self.leftDownView, YF_H(45))
    .leftSpaceToView(self.leftDownView, YF_W(12))
    .widthIs(YF_W(190))
    .heightIs(YF_H(17));
    
    self.instructionsLabel.sd_layout
    .topSpaceToView(self.leftDownView, YF_H(66))
    .leftSpaceToView(self.leftDownView, YF_W(12))
    .widthIs(YF_W(190))
    .heightIs(YF_H(17));
    
    self.upLabel.sd_layout
    .topSpaceToView(self.leftDownView, YF_H(87))
    .leftSpaceToView(self.leftDownView, YF_W(12))
    .widthIs(YF_W(190))
    .heightIs(YF_H(17));
    
    
    self.rightDownView.sd_layout
    .topSpaceToView(self.contentView, YF_H(15))
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(111))
    .heightIs(YF_H(112));
    
    [self.rightDownView sd_addSubviews:@[self.nameLabel,self.timeLabel,self.tittleLabel,self.timeOneLabel]];
    
    
    self.tittleLabel.sd_layout
    .topSpaceToView(self.rightDownView, YF_H(7))
    .centerXEqualToView(self.rightDownView)
    .widthIs(YF_W(111))
    .heightIs(YF_H(17));
    
    self.timeOneLabel.sd_layout
    .topSpaceToView(self.rightDownView, YF_H(26))
    .centerXEqualToView(self.rightDownView)
    .widthIs(YF_W(111))
    .heightIs(YF_H(34));
    
    self.timeLabel.sd_layout
    .topSpaceToView(self.rightDownView, YF_H(64))
    .centerXEqualToView(self.rightDownView)
    .widthIs(YF_W(90))
    .heightIs(YF_H(21));
    
    self.nameLabel.sd_layout
    .topSpaceToView(self.rightDownView, YF_H(89))
    .centerXEqualToView(self.rightDownView)
    .widthIs(YF_W(111))
    .heightIs(YF_H(17));
    
    
    
}



-(UIView *)leftDownView
{
    if (!_leftDownView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor=[YFTool YFColorWithString:@"DDDDDD"];
        view.layer.cornerRadius = YF_W(6);
        view.layer.masksToBounds = YES;
        view.userInteractionEnabled=YES;
        _leftDownView = view;
    }
    return _leftDownView;
}


-(UIView *)rightDownView
{
    if (!_rightDownView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor=[YFTool YFColorWithString:@"DDDDDD"];
        view.layer.cornerRadius = YF_W(6);
        view.layer.masksToBounds = YES;
        view.userInteractionEnabled=YES;
        _rightDownView = view;
    }
    return _rightDownView;
}


-(UIImageView *)DottedImageView
{
    if (!_DottedImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image=[UIImage imageNamed:@"shootxuxianImage"];
        _DottedImageView = imageView;
    }
    return _DottedImageView;
}


-(UILabel *)numericalLabel
{
    if (!_numericalLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.text=@"";
        label.textColor =WHITECOLOR;
        _numericalLabel = label;
    }
    return _numericalLabel;
}


-(UILabel *)usingRangeLabel
{
    if (!_usingRangeLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(10);
        label.layer.cornerRadius=YF_W(4);
        label.layer.masksToBounds=YES;
        label.text=@"";
        label.backgroundColor=[YFTool YFColorWithString:@"BBBBBB"];
        label.textAlignment=NSTextAlignmentCenter;
        label.textColor =WHITECOLOR;
        _usingRangeLabel = label;
    }
    return _usingRangeLabel;
}


-(UILabel *)periodLabel
{
    if (!_periodLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.text=@"";
        label.textColor =WHITECOLOR;
        _periodLabel = label;
    }
    return _periodLabel;
}


-(UILabel *)instructionsLabel
{
    if (!_instructionsLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =WHITECOLOR;
        label.text=@"";
        _instructionsLabel = label;
    }
    return _instructionsLabel;
}

-(UILabel *)upLabel
{
    if (!_upLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =WHITECOLOR;
        label.text=@"";
        _upLabel = label;
    }
    return _upLabel;
}

-(UILabel *)nameLabel
{
    if (!_nameLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF999;
        label.text=@"";
        label.textAlignment=NSTextAlignmentCenter;
        _nameLabel = label;
    }
    return _nameLabel;
}


-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =WHITECOLOR;
        label.text=@"";
        label.textAlignment=NSTextAlignmentCenter;
        _tittleLabel = label;
    }
    return _tittleLabel;
}

-(UILabel *)timeOneLabel
{
    if (!_timeOneLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF333;
        label.text=@"";
        label.numberOfLines=0;
        label.textAlignment=NSTextAlignmentCenter;
        _timeOneLabel = label;
    }
    return _timeOneLabel;
}




-(UILabel *)timeLabel
{
    if (!_timeLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.backgroundColor=[YFTool YFColorWithString:@"BBBBBB"];
        label.layer.cornerRadius=YF_W(4);
        label.layer.masksToBounds=YES;
        label.textColor =WHITECOLOR;
        label.text=@"";
        label.textAlignment=NSTextAlignmentCenter;
        _timeLabel = label;
    }
    return _timeLabel;
}



-(void)setterMyRedPacketsModel:(YFMyRedPacketsModel *)model
{
    self.numericalLabel.text=[NSString stringWithFormat:@"%@%%",model.rate];
    self.usingRangeLabel.text=[NSString stringWithFormat:@"%@",model.content];
    self.periodLabel.text=[NSString stringWithFormat:@"加息期限:%@天",model.couponDays];
    self.instructionsLabel.text=[NSString stringWithFormat:@"起投金额:%.2f元",[model.investmentStandard floatValue]];
    self.upLabel.text=[NSString stringWithFormat:@"加息上限:%@元",model.couponLimit];
    self.nameLabel.text=[NSString stringWithFormat:@"%@",model.title];
    self.timeOneLabel.text=[NSString stringWithFormat:@"%@\n%@",[YFTool timeWithTimeIntervalString:model.end Format:@"yyyy-MM-dd"],[YFTool timeWithTimeIntervalString:model.end Format:@"HH-mm-ss"]];
    self.timeLabel.text=@"已过期";
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
