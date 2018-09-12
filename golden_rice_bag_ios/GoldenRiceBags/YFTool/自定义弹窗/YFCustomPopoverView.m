//
//  YFCustomPopoverView.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/14.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFCustomPopoverView.h"

@implementation YFCustomPopoverView

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
    .heightIs(YF_H(383));

    
    [self.popView sd_addSubviews:@[self.imageView,self.tittleLabel,self.contentLabel,self.determineButton,self.cancelButton]];
    
    self.imageView.sd_layout
    .topSpaceToView(self.popView, YF_H(15))
    .leftSpaceToView(self.popView, YF_W(136))
    .widthIs(YF_W(43))
    .heightIs(YF_H(49.9));
    
    self.tittleLabel.sd_layout
    .topSpaceToView(self.popView, YF_H(78))
    .leftSpaceToView(self.popView, YF_W((self.popView.width - 78)*0.5))
    .widthIs(WIDTH - YF_W(88))
    .heightIs(YF_H(40));
    
    self.contentLabel.sd_layout
    .topSpaceToView(self.popView, YF_H(110))
    .leftSpaceToView(self.popView, YF_W(14))
    .widthIs(WIDTH - YF_W(88))
    .heightIs(YF_H(177));
    
    self.determineButton.sd_layout
    .topSpaceToView(self.popView, YF_H(290))
    .leftSpaceToView(self.popView, YF_W(38))
    .widthIs(WIDTH - YF_W(136))
    .heightIs(YF_H(45));
    
    self.cancelButton.sd_layout
    .topSpaceToView(self.popView, YF_H(345))
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
        label.text = @"活动规则";
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
        label.numberOfLines = 0;
        label.text=@"尊敬的出借人：为了便于您了解自身的风险承受能力，选择合适的出借标的和服务，请您填写以下风险承受能力评估问卷，下列问题（每题满分10分）可协助评估您对出借标的和服务的风险承受能力。请您根据自身情况认证选择。评估结果仅供参考，不构成出借建议。为了及时了解您的风险承受能力，我们建议您持续做好动态评估。我们承诺对您的所有个人资料保密。风险提示：网络出借可能获得比价高的出借收益，但也存在一定出借风险，请您根据自身的风险承受能力，谨慎作出出借决定。";
        label.textColor =[YFTool YFColorWithString:@"999999"];
        _contentLabel = label;
    }
    return _contentLabel;
}


-(UIButton *)determineButton
{
    if (!_determineButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitle:@"立即评级" forState:UIControlStateNormal];
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
        [button setTitle:@"我先看看" forState:UIControlStateNormal];
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
    if ([self.CustomPopoverDelegate respondsToSelector:@selector(CustomPopoverSuccessfulType:)]) {
          [self.CustomPopoverDelegate CustomPopoverSuccessfulType:sender.tag];
    }
  
    
    [self remove];
}


-(void)remove
{
    
        [self removeFromSuperview];
    
    
}


@end
