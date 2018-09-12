//
//  YFAboutTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/19.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFAboutTableViewCell.h"
#define YFTittle @[@"客服电话",@"网址",@"商务合作",@"上海米袋集团"]
@implementation YFAboutTableViewCell

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
    [self.contentView sd_addSubviews:@[self.iconImageView,self.tittleLabel,self.contentLabel,self.rightImageView]];
    
    self.iconImageView.sd_layout
    .centerYEqualToView(self.contentView)
    .centerXEqualToView(self.contentView)
    .widthIs(YF_W(236))
    .heightIs(YF_H(30));
    

    
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(20));
    
    self.contentLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(31))
    .widthIs(YF_W(150))
    .heightIs(YF_H(20));
    
    self.rightImageView.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(5))
    .heightIs(YF_H(9));
    
}


-(UIImageView *)iconImageView
{
    if (!_iconImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.hidden = YES;
        imageView.image =[UIImage imageNamed:@"iconImage"];
        imageView.userInteractionEnabled =YES;
        _iconImageView = imageView;
    }
    return _iconImageView;
}


-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF666;
        label.hidden=YES;
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
        label.hidden=YES;
        label.textAlignment = NSTextAlignmentRight;
        _contentLabel = label;
    }
    return _contentLabel;
}


-(UIImageView *)rightImageView
{
    if (!_rightImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.hidden = YES;
        imageView.image=[UIImage imageNamed:@"rightImage"];
        imageView.userInteractionEnabled =YES;
        _rightImageView = imageView;
    }
    return _rightImageView;
}

-(void)setterIndexPath:(NSInteger)row phoneString:(NSString *)phone urlString:(NSString *)url cooperationString:(NSString *)cooperation
{
    self.tittleLabel.hidden = NO;
    self.tittleLabel.text=[YFTittle objectAtIndex:row];
    
    if (row!=3) {
        NSArray *array=@[phone,url,cooperation];
        self.rightImageView.hidden=NO;
        self.contentLabel.hidden=NO;
        self.contentLabel.text=[array objectAtIndex:row];
        
    }
    
    
    
}

-(void)Icon
{
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    self.iconImageView.hidden = NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
