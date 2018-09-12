//
//  YFReimbursementMeansTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFReimbursementMeansTableViewCell.h"

@implementation YFReimbursementMeansTableViewCell

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
    [self.contentView sd_addSubviews:@[self.timeLabel,self.yuanLabel,self.totalLabel,self.detailLabel]];
    
    self.timeLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(15))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(100))
    .heightIs(YF_H(20));
    
    self.yuanLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(21))
    .leftSpaceToView(self.contentView, YF_W(63))
    .widthIs(YF_W(8))
    .heightIs(YF_H(8));
    
    self.totalLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(15))
    .leftSpaceToView(self.contentView, YF_W(77))
    .widthIs(YF_W(100))
    .heightIs(YF_H(20));
    
    self.detailLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(37))
    .leftSpaceToView(self.contentView, YF_W(77))
    .widthIs(WIDTH - YF_W(77)-YF_W(14))
    .heightIs(YF_H(17));
    
    
}


-(UILabel *)timeLabel
{
    if (!_timeLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF666;
        label.text =@"";
        _timeLabel = label;
    }
    return _timeLabel;
}


-(UILabel *)yuanLabel
{
    if (!_yuanLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.layer.cornerRadius=YF_W(8)/2;
        label.layer.masksToBounds=YES;
        label.backgroundColor =ZHUTICOLOR;
        _yuanLabel = label;
    }
    return _yuanLabel;
}


-(UILabel *)totalLabel
{
    if (!_totalLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF333;
        label.text =@"";
        _totalLabel = label;
    }
    return _totalLabel;
}


-(UILabel *)detailLabel
{
    if (!_detailLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF999;
        label.text =@"";
        _detailLabel = label;
    }
    return _detailLabel;
}

-(void)setterReimbursementMeansModel:(YFReimbursementMeansModel *)model
{
    
    self.timeLabel.text=[YFTool timeWithTimeIntervalString:[NSString stringWithFormat:@"%@",model.repayDay] Format:@"MM.dd"];
    
    self.totalLabel.text=[NSString stringWithFormat:@"%.2f",[model.totalAmt floatValue]];
    
    self.detailLabel.text=[NSString stringWithFormat:@"本金%.2f+利息%.2f+手续费%.2f",[model.principal floatValue],[model.interest floatValue],[model.poundage floatValue]];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
