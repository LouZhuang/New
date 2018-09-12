//
//  YFCapitalSubsidiaryTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/24.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFCapitalSubsidiaryTableViewCell.h"

@implementation YFCapitalSubsidiaryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
//        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self configuration];
    }
    return self;
}

-(void)configuration
{
    [self.contentView sd_addSubviews:@[self.rightImageView,self.tittleLabel,self.contentLabel,self.timeLabel]];
    
    self.rightImageView.sd_layout
    .topSpaceToView(self.contentView, YF_H(67))
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(5))
    .heightIs(YF_H(9));
    
    self.tittleLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(15))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH - YF_W(28))
    .heightIs(YF_H(20));
    
    self.contentLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(61))
    .rightSpaceToView(self.contentView, YF_W(31))
    .widthIs(YF_W(200))
    .heightIs(YF_H(20));
    
    self.timeLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(37))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH - YF_W(28))
    .heightIs(YF_H(20));
    
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

-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF666;
        label.adjustsFontSizeToFitWidth = YES;
        _tittleLabel = label;
    }
    return _tittleLabel;
}

-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF333;
        label.textAlignment = NSTextAlignmentRight;
        _contentLabel = label;
    }
    return _contentLabel;
}

-(UILabel *)timeLabel
{
    if (!_timeLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF999;
        
        _timeLabel = label;
    }
    return _timeLabel;
}

-(void)setterCapitalSubsidiaryModel:(YFCapitalSubsidiaryModel *)model
{
    self.tittleLabel.text=[NSString stringWithFormat:@"%@-订单编号%@",model.title,model.tradeNo];
    self.contentLabel.text=[NSString stringWithFormat:@"%@元",model.changeValue];
    self.timeLabel.text =[YFTool timeWithTimeIntervalString:model.createTime Format:@"YYYY-MM-dd HH:mm:ss"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
