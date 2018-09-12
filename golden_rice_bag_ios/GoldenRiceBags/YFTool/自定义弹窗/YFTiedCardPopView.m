//
//  YFTiedCardPopView.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/25.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFTiedCardPopView.h"

@implementation YFTiedCardPopView


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
    .topSpaceToView(self, YF_H(208))
    .leftSpaceToView(self, YF_W(30))
    .widthIs(WIDTH - YF_W(60))
    .heightIs(YF_H(283));
    
    
    [self.popView sd_addSubviews:@[self.imageView,self.tittleLabel,self.determineButton,self.cancelButton]];
    
    self.imageView.sd_layout
    .topSpaceToView(self.popView, YF_H(15))
    .leftSpaceToView(self.popView, YF_W(136))
    .widthIs(YF_W(43))
    .heightIs(YF_H(49.9));
    
    self.tittleLabel.sd_layout
    .topSpaceToView(self.popView, YF_H(90))
    .leftSpaceToView(self.popView, YF_W(14))
    .widthIs(WIDTH - YF_W(88))
    .heightIs(YF_H(50));

    
    self.determineButton.sd_layout
    .topSpaceToView(self.popView, YF_H(175))
    .leftSpaceToView(self.popView, YF_W(38))
    .widthIs(WIDTH - YF_W(136))
    .heightIs(YF_H(45));
    
    self.cancelButton.sd_layout
    .topSpaceToView(self.popView, YF_H(235))
    .leftSpaceToView(self.popView, YF_W(38))
    .widthIs(WIDTH - YF_W(136))
    .heightIs(YF_H(24));
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

-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.numberOfLines = 0;
        label.text=@"您未绑定银行卡,将不能进行充值操作";
        label.textAlignment=NSTextAlignmentCenter;
        label.textColor =[YFTool YFColorWithString:@"333333"];
        _tittleLabel = label;
    }
    return _tittleLabel;
}



-(UIButton *)determineButton
{
    if (!_determineButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitle:@"立即绑卡" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.layer.cornerRadius = YF_W(25);
        button.layer.masksToBounds = YES;
        button.titleLabel.font = YF_FONT(17);
        button.tag =1;
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
        [button setTitle:@"取消" forState:UIControlStateNormal];
        [button setTitleColor:[YFTool YFColorWithString:@"999999"] forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(17);
        button.tag =0;
        [button addTarget:self action:@selector(determineClick:) forControlEvents:UIControlEventTouchUpInside];
        _cancelButton = button;
        
    }
    return _cancelButton;
}

-(void)determineClick:(UIButton *)sender
{
    [self.TiedCardPopDelegate TiedCardPopSuccessfulType:sender.tag];
    
    [self remove];
}


-(void)remove
{
    
    [self removeFromSuperview];
    
    
}
@end
