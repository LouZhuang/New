//
//  YFHomePageTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/19.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFHomePageTableViewCell.h"


@implementation YFHomePageTableViewCell

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
    
    [self.cellDoenView sd_addSubviews:@[self.productLabel,self.annualReturnLabel,self.percentageLabel,self.regularLabel,self.theCastLabel,self.ProgressView,self.progressLabel,self.remainingLabel,self.projectSizeLabel]];
    
    self.productLabel.sd_layout
    .topSpaceToView(self.cellDoenView, YF_W(8))
    .leftSpaceToView(self.cellDoenView, YF_W(14))
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
//        [button setBackgroundImage:[UIImage imageNamed:@"touziImage"] forState:UIControlStateNormal];
        button.layer.cornerRadius = YF_W(50)/2;
        button.layer.masksToBounds=YES;
//        button.userInteractionEnabled =NO;
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
        label.text =@"";
        _productLabel = label;
    }
    return _productLabel;
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
        label.text =@"";
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
        label.text =@"";
        label.textAlignment =NSTextAlignmentRight;
        _theCastLabel = label;
    }
    return _theCastLabel;
}
-(YFProgressView *)ProgressView
{
    if (!_ProgressView) {
        YFProgressView *view = [[YFProgressView alloc] init];
//        [view setterFloat:0.63];
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
        label.text =@"";
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
        label.text =@"";
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
        label.text =@"";
        label.textAlignment =NSTextAlignmentRight;
        _projectSizeLabel = label;
    }
    return _projectSizeLabel;
}

-(void)setterHomePageModel:(YFHomePageModel *)model
{
    self.productLabel.text=model.projectName;
    self.annualReturnLabel.text=[NSString stringWithFormat:@"%@%%",model.rateOfYear];
    self.regularLabel.text=[NSString stringWithFormat:@"锁定期 %@天",@"30"];
    self.theCastLabel.text=[NSString stringWithFormat:@"%.2f起投",[model.investmentMin floatValue]];
    self.projectSizeLabel.text=[NSString stringWithFormat:@"项目规模%.2f元",[model.projectSize floatValue]];
    self.remainingLabel.text=[NSString stringWithFormat:@"剩余可投%.2f元",[model.residue floatValue]];
    double progressCount = 1- [model.residue doubleValue]/[model.projectSize doubleValue];
     [self.ProgressView setterFloat:progressCount];
    if ([model.residue floatValue] == 0) {
        progressCount = 1;
    }
    self.progressLabel.text=[NSString stringWithFormat:@"%.f%%",progressCount*100];
   
    
    if ([model.residue floatValue] ==0) {
        [self.investmentButton setBackgroundImage:[UIImage imageNamed:@"yimanbiaoImage"] forState:UIControlStateNormal];
        self.investmentButton.userInteractionEnabled = YES;

    }else{
        [self.investmentButton setBackgroundImage:[UIImage imageNamed:@"touziImage"] forState:UIControlStateNormal];
        self.investmentButton.userInteractionEnabled = NO;

    }
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
