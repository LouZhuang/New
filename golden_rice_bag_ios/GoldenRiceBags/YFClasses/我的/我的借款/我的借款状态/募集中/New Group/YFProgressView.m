//
//  YFProgressView.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFProgressView.h"

@implementation YFProgressView

-(instancetype)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    if (self) {
     
        self.backgroundColor = [YFTool YFColorWithString:@"C5C5C5"];
        self.layer.cornerRadius = YF_W(2);
        self.layer.masksToBounds = YES;
        [self initUI];
    }
    return self;
}

-(void)initUI
{
    [self sd_addSubviews:@[self.progressView]];
    
    self.progressView.sd_layout
    .topEqualToView(self)
    .leftEqualToView(self)
    .widthIs(0)
    .heightIs(YF_H(2));
    
}

-(UIView *)progressView
{
    if (!_progressView) {
        UIView *view=[[UIView alloc] init];
        view.layer.cornerRadius = YF_W(0);
        view.layer.masksToBounds = YES;
        
        _progressView =view;
    }
    return _progressView;
}


-(void)setterFloat:(CGFloat)YFFloat
{
    self.progressView.sd_resetLayout
    .topEqualToView(self)
    .leftEqualToView(self)
    .heightIs(YF_H(2))
    .widthIs(WIDTH *YFFloat);
    
    [self.progressView.layer addSublayer:[YFTool LayerInitialColor:[YFTool YFColorWithString:@"F7BF29"] LayerEndColor:[YFTool YFColorWithString:@"FF8421"] LayerFrame:CGRectMake(0, 0,(WIDTH - YF_W(92)) *YFFloat, YF_H(2))]];

}

@end
