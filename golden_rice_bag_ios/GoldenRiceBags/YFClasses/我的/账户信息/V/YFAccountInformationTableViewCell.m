//
//  YFAccountInformationTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/19.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFAccountInformationTableViewCell.h"
#define YFTittle @[@"风险承受能力评估",@"银行卡",@"账户安全"]
#define YFTittle1 @[@"版本更新",@"关于"]

@implementation YFAccountInformationTableViewCell

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
    [self.contentView sd_addSubviews:@[self.headImageView,self.nameLabel,self.tittleLabel,self.contentLabel,self.rightImageView]];
    
    self.headImageView.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(50))
    .heightIs(YF_H(50));
    
    self.nameLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(72))
    .widthIs(YF_W(200))
    .heightIs(YF_H(24));
    
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


-(UIImageView *)headImageView
{
    if (!_headImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.layer.cornerRadius = YF_W(50)/2;
        imageView.layer.masksToBounds=YES;
        imageView.hidden = YES;
        imageView.image =[UIImage imageNamed:@"headImage"];
        imageView.userInteractionEnabled =YES;
        _headImageView = imageView;
    }
    return _headImageView;
}
-(UILabel *)nameLabel
{
    if (!_nameLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textColor =YF333;
        label.text =@"南城瑀落下";
        label.hidden=YES;
        _nameLabel = label;
    }
    return _nameLabel;
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

-(void)nickNameString:(NSString *)nickName
{
    self.headImageView.hidden = NO;
    self.nameLabel.hidden = NO;
    self.nameLabel.text=nickName;
     [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}

/*
 测评状态
 */
-(void)indexPath:(NSInteger)row measurementString:(NSString *)measurement
{
    self.tittleLabel.hidden = NO;
    self.tittleLabel.text =[YFTittle objectAtIndex:row];
    
    if (row==0) {
        self.contentLabel.hidden = NO;
        self.contentLabel.text = measurement;
        if (![measurement isEqualToString:@"进取型"] &&![measurement isEqualToString:@"稳健型"]) {
            self.contentLabel.text=@"未测评";
            self.rightImageView.hidden = NO;
        }
        if ([measurement isEqualToString:@"进取型"] ||[measurement isEqualToString:@"稳健型"]) {
            self.contentLabel.sd_resetLayout
            .centerYEqualToView(self.contentView)
            .rightSpaceToView(self.contentView, YF_W(14))
            .widthIs(YF_W(150))
            .heightIs(YF_H(20));
            
            [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        
    }
    if (row!=0) {
        self.rightImageView.hidden = NO;
    }
   
}


/*
 版本
 */
-(void)indexPath:(NSInteger)row versionString:(NSString *)version
{
    self.tittleLabel.hidden = NO;
    self.tittleLabel.text =[YFTittle1 objectAtIndex:row];
    if (row==0) {
        self.contentLabel.hidden = NO;
        self.contentLabel.text = version;
    }
    self.rightImageView.hidden = NO;
}

/*
 退出登录
 */
-(void)indexPath:(NSInteger)row loginOutString:(NSString *)loginOut
{
    self.nameLabel.hidden = NO;
    self.nameLabel.text =loginOut;
    
    self.nameLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(0))
    .widthIs(WIDTH)
    .heightIs(YF_H(24));
    self.nameLabel.textAlignment=NSTextAlignmentCenter;
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
