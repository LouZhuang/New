//
//  YFAccountSecurityTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFAccountSecurityTableViewCell.h"
#define YFTittle @[@"实名认证",@"手机认证",@"登录密码",@"交易密码",@"授权管理"]
@implementation YFAccountSecurityTableViewCell

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
    [self.contentView sd_addSubviews:@[self.changeButton,self.tittleLabel,self.contentLabel,self.rightImageView]];
    

    
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
    
    self.changeButton.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(2))
    .widthIs(YF_W(58))
    .heightIs(YF_H(50));
    
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
-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF999;
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

-(UIButton *)changeButton
{
    if (!_changeButton) {
        UIButton *button=[[UIButton alloc] init];
        button.titleLabel.font=YF_FONT(14);
        button.hidden=YES;
        [button setTitle:@"修改" forState:UIControlStateNormal];
        [button setTitleColor:ZHUTICOLOR forState:UIControlStateNormal];
        _changeButton =button;
        
    }
    return _changeButton;
}

-(void)setterIndex:(NSInteger)row certificationString:(NSString *)certification phoneString:(NSString *)phone
{
    
    self.tittleLabel.text = [YFTittle objectAtIndex:row];
    
    if (row==0) {
        self.rightImageView.hidden = NO;
        self.contentLabel.hidden=NO;
        self.contentLabel.text =@"未认证";
//        &&[[YFTool userDefaultsId:YFisDepositoryB] integerValue]==1
          if ([[YFTool userDefaultsId:YFisDepository] integerValue]==1 ) {
              self.contentLabel.text =@"已认证";
          }
    }
    if (row==1) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.changeButton.hidden = NO;
        self.changeButton.tag = 1;
        
        self.contentLabel.hidden=NO;
        self.contentLabel.sd_resetLayout
        .centerYEqualToView(self.contentView)
        .rightSpaceToView(self.contentView, YF_W(62))
        .widthIs(YF_W(150))
        .heightIs(YF_H(20));
        self.contentLabel.text =phone;
    }
    if (row==2) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.changeButton.hidden = NO;
        self.changeButton.tag = 2;
    }
    if (row==3) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.changeButton.hidden = NO;
        self.changeButton.tag = 3;
        
    }
    if (row==4) {
       self.rightImageView.hidden = NO;
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
