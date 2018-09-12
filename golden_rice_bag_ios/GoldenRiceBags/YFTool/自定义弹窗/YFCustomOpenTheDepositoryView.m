//
//  YFCustomOpenTheDepositoryView.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/15.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFCustomOpenTheDepositoryView.h"

@implementation YFCustomOpenTheDepositoryView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled = YES;
        [self configuration];
        
        
    }
    return self;
}

-(void)configuration
{
    [self sd_addSubviews:@[self.downView,self.popView]];
    
    self.downView.sd_layout
    .leftEqualToView(self)
    .topEqualToView(self)
    .widthIs(WIDTH)
    .heightIs(HEIGHT);
    
    self.popView.sd_layout
    .topSpaceToView(self, YF_H(186))
    .leftSpaceToView(self, YF_W(30))
    .widthIs(WIDTH - YF_W(60))
    .heightIs(YF_H(336));
    
    
    [self.popView sd_addSubviews:@[self.imageView,self.tittleLabel,self.contentLabel,self.determineButton,self.cancelButton,self.midaiImageView,self.hengFengImageView,self.detailLabel]];
    
    self.imageView.sd_layout
    .topSpaceToView(self.popView, YF_H(15))
    .leftSpaceToView(self.popView, YF_W(136))
    .widthIs(YF_W(43))
    .heightIs(YF_H(50));
    
    self.tittleLabel.sd_layout
    .topSpaceToView(self.popView, YF_H(78))
    .leftSpaceToView(self.popView, YF_W(0))
    .widthIs(WIDTH - YF_W(60))
    .heightIs(YF_H(20));
    
    self.contentLabel.sd_layout
    .topSpaceToView(self.tittleLabel, YF_H(10))
    .leftSpaceToView(self.popView, YF_W(0))
    .widthIs(WIDTH - YF_W(60))
    .heightIs(YF_H(17));
    
    self.determineButton.sd_layout
    .topSpaceToView(self.popView, YF_H(228))
    .leftSpaceToView(self.popView, YF_W(38))
    .widthIs(WIDTH - YF_W(136))
    .heightIs(YF_H(45));
    
    self.cancelButton.sd_layout
    .topSpaceToView(self.popView, YF_H(288))
    .leftSpaceToView(self.popView, YF_W(38))
    .widthIs(WIDTH - YF_W(136))
    .heightIs(YF_H(24));
    
    self.midaiImageView.sd_layout
    .topSpaceToView(self.popView, YF_H(146))
    .leftSpaceToView(self.popView, YF_W(55))
    .widthIs(YF_W(85))
    .heightIs(YF_H(22));
    
    self.hengFengImageView.sd_layout
    .topSpaceToView(self.popView, YF_H(146))
    .rightSpaceToView(self.popView, YF_W(55))
    .widthIs(YF_W(85))
    .heightIs(YF_H(22));
    
    self.detailLabel.sd_layout
    .topSpaceToView(self.popView, YF_H(178))
    .leftSpaceToView(self.popView, YF_W(0))
    .widthIs(WIDTH - YF_W(60))
    .heightIs(YF_H(20));
    
}


-(UIView *)downView
{
    if (!_downView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.6;
        _downView = view;
    }
    return _downView;
}

-(UIView *)popView
{
    if (!_popView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = WHITECOLOR;
        view.layer.cornerRadius = YF_W(8);
        view.layer.masksToBounds = YES;
        view.userInteractionEnabled = YES;
        _popView = view;
    }
    return _popView;
}


-(UIImageView *)imageView
{
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"safeImage"];
        _imageView = imageView;
    }
    return _imageView;
}
-(UIImageView *)midaiImageView
{
    if (!_midaiImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"midaidetailImage"];
        _midaiImageView = imageView;
    }
    return _midaiImageView;
}

-(UIImageView *)hengFengImageView
{
    if (!_hengFengImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"hengfengdetailImage"];
        _hengFengImageView = imageView;
    }
    return _hengFengImageView;
}

-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.text=@"开通金城银行存管账户";
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor =[YFTool YFColorWithString:@"333333"];
        _tittleLabel = label;
    }
    return _tittleLabel;
}


-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.text=@"金米袋与金城银行进行存管合作";
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor =[YFTool YFColorWithString:@"999999"];
        _contentLabel = label;
    }
    return _contentLabel;
}

-(UILabel *)detailLabel
{
    if (!_detailLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.text=@"为了保证您的资金安全，建议您立即开通";
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor =[YFTool YFColorWithString:@"666666"];
        _detailLabel = label;
    }
    return _detailLabel;
}


-(UIButton *)determineButton
{
    if (!_determineButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitle:@"立即开通" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.layer.cornerRadius = YF_W(25);
        button.layer.masksToBounds = YES;
        button.titleLabel.font = YF_FONT(17);
        button.tag =0;
        [button addTarget:self action:@selector(determineClick:) forControlEvents:UIControlEventTouchUpInside];
        button.userInteractionEnabled = YES;
        _determineButton = button;
        
    }
    return _determineButton;
}


-(UIButton *)cancelButton
{
    if (!_cancelButton) {
        UIButton *button=[[UIButton alloc] init];
        [button setTitle:@"暂不考虑" forState:UIControlStateNormal];
        [button setTitleColor:[YFTool YFColorWithString:@"999999"] forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(17);
        button.tag =1;
        [button addTarget:self action:@selector(determineClick:) forControlEvents:UIControlEventTouchUpInside];
        _cancelButton = button;
        
    }
    return _cancelButton;
}
-(void)determineClick:(UIButton *)sender
{
    
    if ([self.OpenTheDepositoryDelegate respondsToSelector:@selector(SuccessfulType:)]) {
        [self.OpenTheDepositoryDelegate SuccessfulType:sender.tag];
    }
    [self remove];
   
}


-(void)remove
{
    [self removeFromSuperview];

}


@end
