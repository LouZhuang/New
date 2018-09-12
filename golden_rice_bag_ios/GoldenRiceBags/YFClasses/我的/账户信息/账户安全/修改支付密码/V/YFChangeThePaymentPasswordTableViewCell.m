//
//  YFChangeThePaymentPasswordTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/10.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFChangeThePaymentPasswordTableViewCell.h"
#define YFMineTittle @[@"我记得原交易密码",@"我忘记原交易密码"]
@implementation YFChangeThePaymentPasswordTableViewCell

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
     [self.contentView sd_addSubviews:@[self.tittleLabel,self.rightImageView]];
    
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(50));
    
    self.rightImageView.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(5))
    .heightIs(YF_H(9));
    
}


-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF666;
        _tittleLabel = label;
    }
    return _tittleLabel;
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
-(void)setterIndexRow:(NSInteger)row
{
    self.tittleLabel.text=[YFMineTittle objectAtIndex:row];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
