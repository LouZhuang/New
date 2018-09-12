//
//  YFFinancialTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/19.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFFinancialTableViewCell.h"

@implementation YFFinancialTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self configuration];
        
    }
    return self;
}

-(void)configuration
{
    
    
    [self.contentView sd_addSubviews:@[self.cellDoenView,self.investmentButton]];
    
    self.cellDoenView.sd_layout
    .topEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH -YF_W(28))
    .heightIs(YF_H(156));
    
    self.investmentButton.sd_layout
    .topSpaceToView(self.contentView, YF_H(131))
    .centerXEqualToView(self.contentView)
    .widthIs(YF_W(50))
    .heightIs(YF_H(50));
    
    [self.cellDoenView sd_addSubviews:@[self.productLabel,self.annualReturnLabel,self.percentageLabel,self.regularLabel,self.theCastLabel,self.ProgressView,self.progressLabel,self.remainingLabel,self.projectSizeLabel,self.stutesLabel]];
    
    self.productLabel.sd_layout
    .topSpaceToView(self.cellDoenView, YF_W(8))
    .leftSpaceToView(self.cellDoenView, YF_W(14))
    .widthIs(YF_W(200))
    .heightIs(YF_H(17));
    
    self.stutesLabel.sd_layout
    .topSpaceToView(self.cellDoenView, YF_W(8))
    .rightSpaceToView(self.cellDoenView, YF_W(14))
    .widthIs(YF_W(200))
    .heightIs(YF_H(17));
    
    self.annualReturnLabel.sd_layout
    .topSpaceToView(self.cellDoenView, YF_W(33))
    .leftSpaceToView(self.cellDoenView, YF_W(14))
    .widthIs(YF_W(100))
    .heightIs(YF_H(28));
    
    self.regularLabel.sd_layout
    .topSpaceToView(self.cellDoenView, YF_W(37))
    .rightSpaceToView(self.cellDoenView, YF_W(14))
    .widthIs(YF_W(100))
    .heightIs(YF_H(20));
    
    self.ProgressView.sd_layout
    .topSpaceToView(self.cellDoenView, YF_H(94))
    .leftSpaceToView(self.cellDoenView, YF_W(14))
    .rightSpaceToView(self.cellDoenView, YF_W(50))
    .heightIs(YF_H(2));
    
    
    self.percentageLabel.sd_layout
    .topSpaceToView(self.cellDoenView, YF_W(61))
    .leftSpaceToView(self.cellDoenView, YF_W(14))
    .widthIs(YF_W(100))
    .heightIs(YF_H(17));
    
    self.theCastLabel.sd_layout
    .topSpaceToView(self.cellDoenView, YF_W(61))
    .rightSpaceToView(self.cellDoenView, YF_W(14))
    .widthIs(YF_W(100))
    .heightIs(YF_H(17));
    
    
    self.progressLabel.sd_layout
    .topSpaceToView(self.cellDoenView, YF_W(86))
    .rightSpaceToView(self.cellDoenView, YF_W(14))
    .widthIs(YF_W(100))
    .heightIs(YF_H(17));
    
    self.remainingLabel.sd_layout
    .topSpaceToView(self.cellDoenView, YF_W(104))
    .leftSpaceToView(self.cellDoenView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(17));
    
    self.projectSizeLabel.sd_layout
    .topSpaceToView(self.cellDoenView, YF_W(104))
    .rightSpaceToView(self.cellDoenView, YF_W(50))
    .widthIs(YF_W(150))
    .heightIs(YF_H(17));
    
}


-(UIView *)cellDoenView
{
    if (!_cellDoenView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = LIGHTGREYCOLOR;
        view.layer.cornerRadius = YF_W(8);
        view.layer.masksToBounds=YES;
        view.userInteractionEnabled =YES;
        _cellDoenView = view;
    }
    return _cellDoenView;
}

-(UIButton *)investmentButton
{
    if (!_investmentButton) {
        UIButton *button = [[UIButton alloc] init];
        [button setBackgroundImage:[UIImage imageNamed:@"touziImage"] forState:UIControlStateNormal];
        button.layer.cornerRadius = YF_W(50)/2;
        button.layer.masksToBounds=YES;
        button.userInteractionEnabled =NO;
        _investmentButton = button;
    }
    return _investmentButton;
}

-(UILabel *)productLabel
{
    if (!_productLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF333;
        label.text =@"产品-1234567号";
        _productLabel = label;
    }
    return _productLabel;
}
-(UILabel *)stutesLabel
{
    if (!_stutesLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =ZHUTICOLOR;
        label.text =@"新手专享";
        label.textAlignment =NSTextAlignmentRight;
        _stutesLabel = label;
    }
    return _stutesLabel;
}

-(UILabel *)annualReturnLabel
{
    if (!_annualReturnLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.textColor =ZHUTICOLOR;
        label.text =@"7.18%";
        _annualReturnLabel = label;
    }
    return _annualReturnLabel;
}
-(UILabel *)percentageLabel
{
    if (!_percentageLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF999;
        label.text =@"2017年历史年化";
        
        _percentageLabel = label;
    }
    return _percentageLabel;
}
-(UILabel *)regularLabel
{
    if (!_regularLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF333;
        label.textAlignment =NSTextAlignmentRight;
        label.text =@"锁定期 83天";
        _regularLabel = label;
    }
    return _regularLabel;
}
-(UILabel *)theCastLabel
{
    if (!_theCastLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF999;
        label.text =@"1000.00起投";
        label.textAlignment =NSTextAlignmentRight;
        _theCastLabel = label;
    }
    return _theCastLabel;
}
-(YFProgressView *)ProgressView
{
    if (!_ProgressView) {
        YFProgressView *view = [[YFProgressView alloc] init];
        [view setterFloat:0.63];
        _ProgressView = view;
    }
    return _ProgressView;
}

-(UILabel *)progressLabel
{
    if (!_progressLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF666;
        label.text =@"63%";
        label.textAlignment =NSTextAlignmentRight;
        _progressLabel = label;
    }
    return _progressLabel;
}
-(UILabel *)remainingLabel
{
    if (!_remainingLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF666;
        label.text =@"剩余可投5000.00元";
        _remainingLabel = label;
    }
    return _remainingLabel;
}
-(UILabel *)projectSizeLabel
{
    if (!_projectSizeLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF666;
        label.text =@"项目规模18,650.82元";
        label.textAlignment =NSTextAlignmentRight;
        _projectSizeLabel = label;
    }
    return _projectSizeLabel;
}

-(void)setterRow:(NSInteger)row stutesString:(NSInteger)stutes
{
    if (stutes==1) {
        self.stutesLabel.text = @"债权转让";
    }
    
    if (row==2) {
        
        [self.investmentButton setBackgroundImage:[UIImage imageNamed:@"yimanbiaoImage"] forState:UIControlStateNormal];
        
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
