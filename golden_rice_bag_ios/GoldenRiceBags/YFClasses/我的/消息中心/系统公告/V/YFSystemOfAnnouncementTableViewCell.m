//
//  YFSystemOfAnnouncementTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFSystemOfAnnouncementTableViewCell.h"

@implementation YFSystemOfAnnouncementTableViewCell

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
    [self.contentView sd_addSubviews:@[self.tittleLabel,self.contentLabel,self.timeLabel]];

    
    self.tittleLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(12))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH - YF_W(28))
    .heightIs(YF_H(20));
    
    self.contentLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(37))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH - YF_W(28))
    .heightIs(YF_H(132));
    
    self.timeLabel.sd_layout
    .bottomSpaceToView(self.contentView, YF_H(15))
    .rightSpaceToView(self.contentView, YF_W(17))
    .widthIs(YF_W(90))
    .heightIs(YF_H(34));
    
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
        label.font = YF_FONT(14);
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
        label.textColor =YF666;
        label.numberOfLines=0;
        label.textAlignment = NSTextAlignmentRight;
        _timeLabel = label;
    }
    return _timeLabel;
}

-(void)setterMessageModel:(YFMessageModel *)model
{
    self.tittleLabel.text=model.title;
    self.contentLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(37))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH - YF_W(28))
    .heightIs([YFTool lableHeight:model.content labelFont:YF_W(14) WD:WIDTH -YF_W(28) Bold:NO] +YF_H(20));
    self.contentLabel.text=model.content;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
