//
//  YFTheInvitationView.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFTheInvitationView.h"

@implementation YFTheInvitationView


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
    .heightIs(YF_H(241));
    
    
    [self.popView sd_addSubviews:@[self.tittleLabel,self.contentLabel,self.determineButton]];
    

    
    self.tittleLabel.sd_layout
    .topSpaceToView(self.popView, YF_H(15))
    .leftSpaceToView(self.popView, YF_W(14))
    .widthIs(WIDTH - YF_W(88))
    .heightIs(YF_H(20));
    
    self.contentLabel.sd_layout
    .topSpaceToView(self.popView, YF_H(50))
    .leftSpaceToView(self.popView, YF_W(14))
    .widthIs(WIDTH - YF_W(88))
    .heightIs(YF_H(106));
    
    self.determineButton.sd_layout
    .topSpaceToView(self.popView, YF_H(164))
    .leftSpaceToView(self.popView, YF_W(38))
    .widthIs(WIDTH - YF_W(136))
    .heightIs(YF_H(45));
    
    
}


-(UIView *)downView
{
    if (!_downView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.6;
        //添加手势
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(event:)];
        //将手势添加到需要相应的view中去
        [view addGestureRecognizer:tapGesture];
        
        //选择触发事件的方式（默认单机触发）
        [tapGesture setNumberOfTapsRequired:1];
        _downView = view;
    }
    return _downView;
}
-(void)event:(UITapGestureRecognizer *)gesture
{
    NSLog(@"999999999");
    
    
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



-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.text=@"活动规则";
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
        label.font = YF_FONT(14);
        label.text=@"1.您邀请的好友注册后的每笔成功进入计息期出借，您都可以获得0.8%返现；\n2.现金奖励将于每月6日定时发放；\n3.现金奖励将直接存入个人银行存管账户中，可用于投资、提现等操作。";
        label.numberOfLines=0;
        label.textColor =[YFTool YFColorWithString:@"666666"];
        _contentLabel = label;
    }
    return _contentLabel;
}


-(UIButton *)determineButton
{
    if (!_determineButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitle:@"我知道了" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.layer.cornerRadius = YF_W(25);
        button.layer.masksToBounds = YES;
        button.titleLabel.font = YF_FONT(17);
        button.userInteractionEnabled = YES;
        [button addTarget:self action:@selector(determineClick) forControlEvents:UIControlEventTouchUpInside];
        _determineButton = button;
        
    }
    return _determineButton;
}

-(void)determineClick
{
    [self remove];
}

-(void)remove
{
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
    [self removeFromSuperview];
    
    //    });
}

@end
