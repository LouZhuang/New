//
//  YFTheRemittancePlanTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFTheRemittancePlanTableViewCell.h"

@implementation YFTheRemittancePlanTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self configuration];
        
    }
    return self;
}

-(void)configuration
{
    [self.contentView sd_addSubviews:@[self.tittleLabel,self.contentLabel,self.timeLabel,self.stateLabel]];
    
    self.timeLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(0))
    .widthIs(WIDTH/4)
    .heightIs(YF_H(20));
    
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, WIDTH/4)
    .widthIs(WIDTH/4)
    .heightIs(YF_H(20));
    
    self.contentLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, WIDTH/4*2)
    .widthIs(WIDTH/4)
    .heightIs(YF_H(20));
    
    self.stateLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, WIDTH/4*3)
    .widthIs(WIDTH/4)
    .heightIs(YF_H(20));
    
}


-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(11);
        label.textColor =YF666;
        label.textAlignment=NSTextAlignmentCenter;
        _tittleLabel = label;
    }
    return _tittleLabel;
}


-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(11);
        label.textAlignment=NSTextAlignmentCenter;
        label.textColor =YF666;
        _contentLabel = label;
    }
    return _contentLabel;
}


-(UILabel *)timeLabel
{
    if (!_timeLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(11);
        label.textAlignment=NSTextAlignmentCenter;
        label.textColor =YF666;
        _timeLabel = label;
    }
    return _timeLabel;
}


-(UILabel *)stateLabel
{
    if (!_stateLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(11);
        label.textAlignment=NSTextAlignmentCenter;
        label.textColor =YF666;
        _stateLabel = label;
    }
    return _stateLabel;
}

-(void)setterTimeString:(NSString *)time tittleString:(NSString *)tittle contentString:(NSString *)content stateString:(NSString *)state;
{
   
    self.timeLabel.text=time;
    self.tittleLabel.text=tittle;
    self.contentLabel.text =content;
     self.stateLabel.text =state;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
