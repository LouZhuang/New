//
//  YFAutomaticBidTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFAutomaticBidTableViewCell.h"

@implementation YFAutomaticBidTableViewCell

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
    [self.contentView sd_addSubviews:@[self.tittleImageView,self.tittleLabel,self.downImageView]];
    
    self.tittleImageView.sd_layout
    .topSpaceToView(self.contentView, YF_H(39))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(12))
    .heightIs(YF_H(8));
    
    self.tittleLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(30))
    .leftSpaceToView(self.contentView, YF_W(32))
    .widthIs(YF_W(100))
    .heightIs(YF_H(24));
    
    
    self.downImageView.sd_layout
    .topSpaceToView(self.contentView, YF_H(69))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH -YF_W(28))
    .heightIs(YF_H(170));
    
    
     [self.downImageView sd_addSubviews:@[self.settingButton,self.contentLabel,self.openLabel,self.stateImageView]];
    
    self.settingButton.sd_layout
    .topSpaceToView(self.downImageView, YF_W(0))
    .rightSpaceToView(self.downImageView, YF_W(14))
    .widthIs(YF_W(100))
    .heightIs(YF_H(40));
    
    self.contentLabel.sd_layout
    .topSpaceToView(self.downImageView, YF_H(50))
    .leftSpaceToView(self.downImageView, YF_W(14))
    .rightSpaceToView(self.downImageView, YF_W(14))
    .heightIs(YF_H(48));
    
    self.openLabel.sd_layout
    .topSpaceToView(self.downImageView, YF_H(136))
    .leftSpaceToView(self.downImageView, YF_W(14))
    .widthIs(YF_W(120))
    .heightIs(YF_H(20));
    
    self.stateImageView.sd_layout
    .topSpaceToView(self.downImageView, YF_H(138))
    .leftSpaceToView(self.downImageView, YF_W(132))
    .widthIs(YF_W(16))
    .heightIs(YF_H(16));
}


#pragma mark - lazy

-(UIImageView *)tittleImageView
{
    if (!_tittleImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image =[UIImage imageNamed:@"yueImage"];
        imageView.userInteractionEnabled =YES;
        _tittleImageView = imageView;
    }
    return _tittleImageView;
}

-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textColor =YF333;
        label.text =@"自动投标";
        _tittleLabel = label;
    }
    return _tittleLabel;
}

-(UIImageView *)downImageView
{
    if (!_downImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image =[UIImage imageNamed:@"zidongImage"];
        imageView.userInteractionEnabled =YES;
        _downImageView = imageView;
    }
    return _downImageView;
}


-(UIButton *)settingButton
{
    if (!_settingButton) {
        UIButton *button =[[UIButton alloc] init];
        button.titleLabel.font = YF_FONT(14);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        button.titleEdgeInsets =UIEdgeInsetsMake(0,0,0,0);
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        [button setTitle:@"设置详情" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(settingClick) forControlEvents:UIControlEventTouchUpInside];
        _settingButton = button;
    }
    return _settingButton;
}
-(void)settingClick
{
    
    YFAutomaticBidViewController *YFMyInvestmentMoreVC=[[YFAutomaticBidViewController alloc]init];
    [[YFTool getCurrentVC].navigationController pushViewController:YFMyInvestmentMoreVC animated:YES];
    
}


-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.textColor =WHITECOLOR;
        label.numberOfLines=0;
        label.textAlignment=NSTextAlignmentCenter;
        _contentLabel = label;
    }
    return _contentLabel;
}


-(UILabel *)openLabel
{
    if (!_openLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =WHITECOLOR;
        label.text =@"开启预约自动投标";
        _openLabel = label;
    }
    return _openLabel;
}



-(UIImageView *)stateImageView
{
    if (!_stateImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image =[UIImage imageNamed:@"kaiqiImage"];
        imageView.userInteractionEnabled =YES;
        _stateImageView = imageView;
    }
    return _stateImageView;
}

-(void)setterUtilizationString:(NSString *)utilization stateType:(NSInteger)type
{
    if (type==0) {
      self.stateImageView.image =[UIImage imageNamed:@"bukaiqiImage"];
    }
    if (type==1) {
        self.stateImageView.image =[UIImage imageNamed:@"kaiqiImage"];
    }
    NSString *string =utilization;
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithString:string];
    [aString addAttribute:NSFontAttributeName value:YF_FONT(14) range:NSMakeRange(0, 10)];
    [aString addAttribute:NSFontAttributeName value:YF_FONT(14) range:NSMakeRange(string.length-7, 7)];
    self.contentLabel.attributedText=aString;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
