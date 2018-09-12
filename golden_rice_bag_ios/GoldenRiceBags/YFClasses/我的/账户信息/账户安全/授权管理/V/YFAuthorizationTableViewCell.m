//
//  YFAuthorizationTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFAuthorizationTableViewCell.h"

#define YFTittle @[@"自动投标",@"自动还款",@"自动债权认购"]

@implementation YFAuthorizationTableViewCell

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
     [self.contentView sd_addSubviews:@[self.tittleLabel,self.SwitchButton]];
    
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(20));
    
    self.SwitchButton.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(50))
    .heightIs(YF_H(25));
}
-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF666;
        _tittleLabel = label;
    }
    return _tittleLabel;
}
//-(UISwitch *)YFSwitch
//{
//    if(!_YFSwitch){
//        _YFSwitch = [[UISwitch alloc]init];
//        [_YFSwitch setBackgroundColor:WHITECOLOR];
//        [_YFSwitch setOnTintColor:WHITECOLOR];
//        [_YFSwitch setThumbTintColor:ZHUTICOLOR];
//        _YFSwitch.layer.cornerRadius = 15.5f;
//        _YFSwitch.layer.masksToBounds = YES;
////        _YFSwitch.transform = CGAffineTransformMakeScale( 0.9, 0.9);//缩放
//        _YFSwitch.layer.borderColor=ZHUTICOLOR.CGColor;
//        _YFSwitch.layer.borderWidth = YF_W(1);
//        [_YFSwitch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
//    }
//    return _YFSwitch;
//}
//-(void)switchAction:(UISwitch *)sender
//{
//    sender.selected=!sender.selected;
//}
-(UIButton *)SwitchButton
{
    if(!_SwitchButton){
        UIButton *button=[[UIButton alloc]init];
        button.hidden=YES;
        button.adjustsImageWhenHighlighted = NO;
        [button setShowsTouchWhenHighlighted:YES];
        [button setImage:[UIImage imageNamed:@"guanbiImage"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"kaiqiImage-1"] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"kaiqiImage-1"] forState:UIControlStateSelected];
        _SwitchButton=button;
    }
    return _SwitchButton;
}

-(void)setterindexPath:(NSInteger)row SwitchButtonFirst:(NSInteger)firstType SwitchButtonSecond:(NSInteger)secondType switchcReitAssignment:(NSInteger )reitAssignment
{
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    self.tittleLabel.text=[YFTittle objectAtIndex:row];
    if (row==0) {
        self.SwitchButton.tag=0;
        self.SwitchButton.hidden=NO;
        
        if (firstType==0) {
            self.SwitchButton.selected=NO;
        }
        if (firstType==1) {
            self.SwitchButton.selected=YES;
        }
        
    }else  if (row==1) {
        self.SwitchButton.tag=1;
        self.SwitchButton.hidden=NO;
        
        if (secondType==0) {
            self.SwitchButton.selected=NO;
        }
        if (secondType==1) {
            self.SwitchButton.selected=YES;
        }
        
    }else  if (row==2) {
        self.SwitchButton.tag=2;
        self.SwitchButton.hidden=NO;
        self.SwitchButton.selected=reitAssignment == 1?YES:NO;
        
        
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
