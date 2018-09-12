//
//  YFInvestmentSection0TableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/21.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFInvestmentSection0TableViewCell.h"
#define YFMineTittle @[@"当前投资总金额(元)",@"加入人数(人)",@"剩余时间"]
@implementation YFInvestmentSection0TableViewCell

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
     [self.contentView sd_addSubviews:@[self.tittleLabel,self.contentLabel]];
    
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(20));
    
    self.contentLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(200))
    .heightIs(YF_H(20));
    
}


-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF999;
        _tittleLabel = label;
    }
    return _tittleLabel;
}


-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textAlignment=NSTextAlignmentRight;
        label.textColor =ZHUTICOLOR;
        _contentLabel = label;
    }
    return _contentLabel;
}

-(void)setterIndexPath:(NSInteger)row moneyString:(NSString *)money peopleString:(NSString *)people timeString:(NSString *)time
{
    self.tittleLabel.text=[YFMineTittle objectAtIndex:row];
    NSArray *array=@[money,people,time];
    self.contentLabel.text =[array objectAtIndex:row];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
