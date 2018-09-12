//
//  YFMyInvitationHeaderTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFMyInvitationHeaderTableViewCell.h"
#define YFTittle @[@"累计现金奖励(元)",@"扫码邀请",@"",@"注：如有解除好友上下级关系需要，请联系客服"]
@implementation YFMyInvitationHeaderTableViewCell

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
    [self.contentView sd_addSubviews:@[self.tittleLabel,self.contentLabel,self.rightImageView,self.erImageView,self.oneNumberLabel,self.twoNumberLabel,self.oneLabel,self.twoLabel,self.fgImageView]];
    
    
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH-YF_W(28))
    .heightIs(YF_H(20));
    
    self.contentLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(37))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(207))
    .heightIs(YF_H(28));
    
    self.rightImageView.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(5))
    .heightIs(YF_H(9));
    
    self.erImageView.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(31))
    .widthIs(YF_W(22))
    .heightIs(YF_H(22));
    
    
    self.oneNumberLabel.sd_layout
    .topSpaceToView(self.contentView,YF_H(10))
    .leftSpaceToView(self.contentView, YF_W(0))
    .widthIs(WIDTH/2)
    .heightIs(YF_H(28));
    
    self.twoNumberLabel.sd_layout
    .topSpaceToView(self.contentView,YF_H(10))
    .leftSpaceToView(self.contentView, WIDTH/2)
    .widthIs(WIDTH/2)
    .heightIs(YF_H(28));
    
    self.oneLabel.sd_layout
    .topSpaceToView(self.contentView,YF_H(42))
    .leftSpaceToView(self.contentView, YF_W(0))
    .widthIs(WIDTH/2)
    .heightIs(YF_H(20));
    
    self.twoLabel.sd_layout
    .topSpaceToView(self.contentView,YF_H(42))
    .leftSpaceToView(self.contentView, WIDTH/2)
    .widthIs(WIDTH/2)
    .heightIs(YF_H(20));
    
    self.fgImageView.sd_layout
    .topSpaceToView(self.contentView,YF_H(22))
    .centerXEqualToView(self.contentView)
    .widthIs(YF_W(1))
    .heightIs(YF_H(30));
    
}



-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF999;
        _tittleLabel = label;
    }
    return _tittleLabel;
}

-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.textColor =ZHUTICOLOR;
      
        _contentLabel = label;
        
    }
    return _contentLabel;
}

-(UIImageView *)rightImageView
{
    if (!_rightImageView) {
        UIImageView *imageView =[[UIImageView alloc] init];
        imageView.hidden=YES;
        imageView.image=[UIImage imageNamed:@"rightImage"];
        _rightImageView = imageView;
    }
    return _rightImageView;
}


-(UIImageView *)erImageView
{
    if (!_erImageView) {
        UIImageView *imageView =[[UIImageView alloc] init];
        imageView.hidden=YES;
        imageView.image=[UIImage imageNamed:@"erweimaImage"];
        _erImageView = imageView;
    }
    return _erImageView;
}

-(UIImageView *)fgImageView
{
    if (!_fgImageView) {
        UIImageView *imageView =[[UIImageView alloc] init];
        imageView.hidden=YES;
        imageView.backgroundColor=LIGHTGREYCOLOR;
        _fgImageView = imageView;
    }
    return _fgImageView;
}


-(UILabel *)oneNumberLabel
{
    if (!_oneNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.textColor =ZHUTICOLOR;
        label.text=@"5";
        label.hidden=YES;
        label.textAlignment = NSTextAlignmentCenter;
        _oneNumberLabel = label;
        
    }
    return _oneNumberLabel;
}


-(UILabel *)twoNumberLabel
{
    if (!_twoNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.textColor =ZHUTICOLOR;
        label.text=@"5";
        label.hidden=YES;
        label.textAlignment = NSTextAlignmentCenter;
        _twoNumberLabel = label;
        
    }
    return _twoNumberLabel;
}


-(UILabel *)oneLabel
{
    if (!_oneLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF999;
        label.text=@"一级好友(人)";
        label.hidden=YES;
        label.textAlignment = NSTextAlignmentCenter;
        _oneLabel = label;
        
    }
    return _oneLabel;
}


-(UILabel *)twoLabel
{
    if (!_twoLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF999;
        label.hidden=YES;
        label.text=@"二级好友(人)";
        label.textAlignment = NSTextAlignmentCenter;
        _twoLabel = label;
        
    }
    return _twoLabel;
}

-(void)setterIndexRow:(NSInteger)row
{
    self.tittleLabel.text=[YFTittle objectAtIndex:row];
    if (row==0) {
        self.tittleLabel.sd_resetLayout
        .topSpaceToView(self.contentView, YF_H(15))
        .leftSpaceToView(self.contentView, YF_W(14))
        .widthIs(WIDTH-YF_W(28))
        .heightIs(YF_H(20));
        
        self.tittleLabel.font=YF_FONT(14);
        self.contentLabel.text=@"66.66";
    }
    if (row==1) {
        self.tittleLabel.font=YF_FONT(14);
        self.tittleLabel.textColor=YF666;
        self.rightImageView.hidden=NO;
        self.erImageView.hidden=NO;
    }
    if (row==2) {
        self.fgImageView.hidden=NO;
        self.oneNumberLabel.hidden=NO;
        self.twoNumberLabel.hidden=NO;
        self.oneLabel.hidden=NO;
        self.twoLabel.hidden=NO;
        
        
        
    }
    if (row==3) {
        
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
