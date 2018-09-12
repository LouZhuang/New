//
//  YFBorrowingHeaderTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBorrowingHeaderTableViewCell.h"

@implementation YFBorrowingHeaderTableViewCell

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
    [self.contentView sd_addSubviews:@[self.tittleLabel,self.sectionImageView,self.borrowingInformationButton,self.certificationButton,self.completeButton,self.tittleImageView]];
    
    self.sectionImageView.sd_layout
    .topSpaceToView(self.contentView, YF_H(72))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(12))
    .heightIs(YF_H(8));
    
    self.tittleLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(63))
    .leftSpaceToView(self.contentView, YF_W(32))
    .widthIs(YF_W(250))
    .heightIs(YF_H(24));
    
    
    self.borrowingInformationButton.sd_layout
    .topSpaceToView(self.contentView, YF_H(15))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(90))
    .heightIs(YF_H(28));
    
    self.certificationButton.sd_layout
    .topSpaceToView(self.contentView, YF_H(15))
    .centerXEqualToView(self.contentView)
    .widthIs(YF_W(100))
    .heightIs(YF_H(28));
    
    self.completeButton.sd_layout
    .topSpaceToView(self.contentView, YF_H(15))
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(90))
    .heightIs(YF_H(28));
    
}

-(UIButton *)borrowingInformationButton
{
    if (!_borrowingInformationButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =[YFTool YFColorWithString:@"DDDDDD"];
        [button setTitle:@"• 借款信息" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.layer.cornerRadius = YF_W(15);
        button.layer.masksToBounds = YES;
        button.titleLabel.font = YF_FONT(14);
        _borrowingInformationButton = button;
        
    }
    return _borrowingInformationButton;
}


-(UIButton *)certificationButton
{
    if (!_certificationButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =[YFTool YFColorWithString:@"DDDDDD"];
        [button setTitle:@"• 认证及文件" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.layer.cornerRadius = YF_W(15);
        button.layer.masksToBounds = YES;
        button.titleLabel.font = YF_FONT(14);
        _certificationButton = button;
        
    }
    return _certificationButton;
}


-(UIButton *)completeButton
{
    if (!_completeButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =[YFTool YFColorWithString:@"DDDDDD"];
        [button setTitle:@"• 完成" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.layer.cornerRadius = YF_W(15);
        button.layer.masksToBounds = YES;
        button.titleLabel.font = YF_FONT(14);
        _completeButton = button;
        
    }
    return _completeButton;
}


-(UIImageView *)tittleImageView
{
    if (!_tittleImageView) {
        for (NSInteger i=0; i < 2; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(YF_W(116.5)  +i*YF_W(134) , YF_H(26), YF_W(9), YF_H(6))];
            imageView.image=[UIImage imageNamed:@"borrowrightImage"];
            _tittleImageView = imageView;
            [self.contentView addSubview:_tittleImageView];
        }
        
    }
    return _tittleImageView;
}


-(UIImageView *)sectionImageView
{
    if (!_sectionImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image =[UIImage imageNamed:@"yueImage"];
        imageView.userInteractionEnabled =YES;
        _sectionImageView = imageView;
    }
    return _sectionImageView;
}

-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textColor =YF333;
        label.text =@"信息披露";
        _tittleLabel = label;
    }
    return _tittleLabel;
}


-(void)setterIndexPath:(NSInteger)row selectType:(NSInteger)type tittleString:(NSString *)string
{
    
    self.tittleLabel.text =string;
    if (type==0) {
        self.borrowingInformationButton.backgroundColor=ZHUTICOLOR;
    }
    if (type==1) {
       self.certificationButton.backgroundColor=ZHUTICOLOR;
    }
    if (type==2) {
         self.completeButton.backgroundColor=ZHUTICOLOR;
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
