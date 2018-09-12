//
//  YFMineBnakCardTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/25.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFMineBnakCardTableViewCell.h"

@implementation YFMineBnakCardTableViewCell

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
    [self.contentView sd_addSubviews:@[self.tittleLabel,self.rightImageView,self.DownImageView]];
    
    
    
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(20));
    
    
    self.rightImageView.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(5))
    .heightIs(YF_H(9));
    
    
    self.DownImageView.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH- YF_W(28))
    .heightIs(YF_H(116));
    
    
    [self.DownImageView sd_addSubviews:@[self.bankNameLabel,self.bankTypeLabel,self.bankcardNumberLabel]];
    
    self.bankNameLabel.sd_layout
    .topSpaceToView(self.DownImageView, YF_H(15))
    .leftSpaceToView(self.DownImageView, YF_W(14))
    .widthIs(YF_W(200))
    .heightIs(YF_H(24));
    
    self.bankTypeLabel.sd_layout
    .topSpaceToView(self.DownImageView, YF_H(43))
    .leftSpaceToView(self.DownImageView, YF_W(14))
    .widthIs(YF_W(200))
    .heightIs(YF_H(20));
    
    self.bankcardNumberLabel.sd_layout
    .topSpaceToView(self.DownImageView, YF_H(73))
    .leftSpaceToView(self.DownImageView, YF_W(14))
    .widthIs(YF_W(250))
    .heightIs(YF_H(20));
    
}



-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF666;
        label.text=@"更换银行卡";
        label.hidden=YES;
        _tittleLabel = label;
    }
    return _tittleLabel;
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


-(UIImageView *)DownImageView
{
    if (!_DownImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.hidden = YES;
        imageView.layer.cornerRadius=YF_W(8);
        imageView.backgroundColor=[YFTool YFColorWithString:@"FFA75F"];
        imageView.layer.masksToBounds=YES;
        imageView.userInteractionEnabled =YES;
        _DownImageView = imageView;
    }
    return _DownImageView;
}




-(UILabel *)bankNameLabel
{
    if (!_bankNameLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textColor =WHITECOLOR;
        label.text=@"";
        _bankNameLabel = label;
    }
    return _bankNameLabel;
}



-(UILabel *)bankTypeLabel
{
    if (!_bankTypeLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =WHITECOLOR;
//        label.text=@"储蓄卡";
        _bankTypeLabel = label;
    }
    return _bankTypeLabel;
}



-(UILabel *)bankcardNumberLabel
{
    if (!_bankcardNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.textColor =WHITECOLOR;
        label.text=@"";
        _bankcardNumberLabel = label;
    }
    return _bankcardNumberLabel;
}

-(void)setterSction:(NSInteger)section MineBnakCardModel:(YFMineBnakCardModel *)model

{
    

    
    if (section==0) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.DownImageView.hidden=NO;
        self.bankNameLabel.text=model.bank;
        
        self.bankcardNumberLabel.text=[YFTool getNewBankNumWitOldBankNum:[YFTool safeBase64Str:model.cardno]];
        
    }
    
//    if (section==1) {
//        self.tittleLabel.hidden=NO;
//        self.rightImageView.hidden=NO;
//    }
    
    
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
