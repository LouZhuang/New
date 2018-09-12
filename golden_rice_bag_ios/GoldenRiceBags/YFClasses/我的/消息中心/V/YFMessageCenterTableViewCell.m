//
//  YFMessageCenterTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFMessageCenterTableViewCell.h"
#define YFTittle @[@"系统公告",@"我的消息",@"优选活动"]
#define YFTittleImage @[@"messageImage0",@"messageImage1",@"messageImage2"]
@implementation YFMessageCenterTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self configuration];
    }
    return self;
}

-(void)configuration
{
    [self.contentView sd_addSubviews:@[self.tittleImageView,self.tittleLabel,self.contentLabel,self.timeLabel]];
    
    self.tittleImageView.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(36))
    .heightIs(YF_H(36));
    
    self.tittleLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(15))
    .leftSpaceToView(self.contentView, YF_W(58))
    .widthIs(YF_W(100))
    .heightIs(YF_H(20));
    
    self.contentLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(37))
    .leftSpaceToView(self.contentView, YF_W(58))
    .widthIs(YF_W(207))
    .heightIs(YF_H(17));
    
    self.timeLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(37))
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(80))
    .heightIs(YF_H(17));
    
}

-(UIImageView *)tittleImageView
{
    if (!_tittleImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        _tittleImageView = imageView;
    }
    return _tittleImageView;
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

-(void)setterIndexPath:(NSInteger)row contentString:(NSString *)content timeString:(NSString *)time
{
    self.tittleImageView.image=[UIImage imageNamed:[YFTittleImage objectAtIndex:row]];
    self.tittleLabel.text=[YFTittle objectAtIndex:row];
    self.contentLabel.text=content;
    self.timeLabel.text =time;
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
