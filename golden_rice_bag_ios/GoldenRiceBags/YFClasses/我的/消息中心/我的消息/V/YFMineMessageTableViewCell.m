//
//  YFMineMessageTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFMineMessageTableViewCell.h"

@implementation YFMineMessageTableViewCell

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
    [self.contentView sd_addSubviews:@[self.tittleLabel,self.contentLabel,self.timeLabel,self.checkDetailsButton]];
    
    
    self.tittleLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(15))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH /2)
    .heightIs(YF_H(20));
    
    self.contentLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(41))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH - YF_W(28))
    .maxHeightIs(YF_H(51));
    
    self.timeLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(15))
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(120))
    .heightIs(YF_H(17));
    
//    self.checkDetailsButton.sd_layout
//    .bottomSpaceToView(self.contentView, YF_H(10))
//    .rightSpaceToView(self.contentView, YF_W(0))
//    .widthIs(YF_W(76))
//    .heightIs(YF_H(27));
    
}



-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF333;
        _tittleLabel = label;
    }
    return _tittleLabel;
}

-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF666;
        label.numberOfLines=0;
        _contentLabel = label;
    }
    return _contentLabel;
}

-(UILabel *)timeLabel
{
    if (!_timeLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF999;
        label.textAlignment = NSTextAlignmentRight;
        _timeLabel = label;
    }
    return _timeLabel;
}

-(UIButton *)checkDetailsButton
{
    if (!_checkDetailsButton) {
        UIButton *button =[[UIButton alloc] init];
        [button setTitle:@"查看详情" forState:UIControlStateNormal];
        [button setTitleColor:YF999 forState:UIControlStateNormal];
        button.titleLabel.font=YF_FONT(12);
        _checkDetailsButton = button;
    }
    return _checkDetailsButton;
}



-(void)setterMessageModel:(YFMessageModel *)model
{
    self.tittleLabel.text=model.title;
    self.contentLabel.text=model.content;
    self.timeLabel.text =[YFTool timeWithTimeIntervalString:model.createTime Format:@"yyyy-MM-dd HH:mm"];
    
//    self.checkDetailsButton.tag = row;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
