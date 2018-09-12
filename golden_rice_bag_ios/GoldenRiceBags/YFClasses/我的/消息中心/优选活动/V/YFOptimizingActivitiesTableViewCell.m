//
//  YFOptimizingActivitiesTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFOptimizingActivitiesTableViewCell.h"

@implementation YFOptimizingActivitiesTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.contentView.backgroundColor=WHITECOLOR;
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self configuration];
    }
    return self;
}

-(void)configuration
{
    [self.contentView sd_addSubviews:@[self.timeLabel,self.tittleImageView]];
    
    self.timeLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(15))
    .centerXEqualToView(self.contentView)
    .widthIs(YF_W(123))
    .heightIs(YF_H(26));
    
    
    
    self.tittleImageView.sd_layout
    .topSpaceToView(self.contentView, YF_H(55))
    .leftSpaceToView(self.contentView, YF_W(0))
    .widthIs(YF_W(375))
    .heightIs(YF_H(150));
    
}

-(UILabel *)timeLabel
{
    if (!_timeLabel) {
        UILabel *label=[[UILabel alloc] init];
        label.font=YF_FONT(12);
        label.textColor=WHITECOLOR;
        label.textAlignment =NSTextAlignmentCenter;
        label.backgroundColor=[YFTool YFColorWithString:@"D8D8D8"];
        label.layer.cornerRadius=YF_W(12);
        label.layer.masksToBounds=YES;
        label.text=@"";
        _timeLabel = label;
    }
    return _timeLabel;
}


-(UIImageView *)tittleImageView
{
    if (!_tittleImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image=[UIImage imageNamed:@"showImage"];
        _tittleImageView = imageView;
    }
    return _tittleImageView;
}

-(void)setterMessageModel:(YFMessageModel *)model
{
    [self.tittleImageView sd_setImageWithURL:[NSURL URLWithString:model.href] placeholderImage:nil];
    self.timeLabel.text=[YFTool timeWithTimeIntervalString:model.createTime Format:@"yyyy-MM-dd HH:mm"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
