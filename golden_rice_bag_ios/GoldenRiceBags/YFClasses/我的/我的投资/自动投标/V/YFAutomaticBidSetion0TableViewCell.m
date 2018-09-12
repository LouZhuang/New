//
//  YFAutomaticBidSetion0TableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFAutomaticBidSetion0TableViewCell.h"

#define YFMineTittle @[@"余额全投",@"使用红包",@"将使用符合使用条件中优惠金额最大的加息红包"]
#define YFMineTittle2 @[@"账户保留金额",@"投标金额",@"投资期限",@"预期年化利率",@""]
@implementation YFAutomaticBidSetion0TableViewCell

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
    [self.contentView sd_addSubviews:@[self.downImageView,self.tittleLabel,self.SwitchButton,self.leftTextField,self.rightTextField,self.oneView,self.unitLabel]];
    
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(16))
    .widthIs(YF_W(300))
    .heightIs(YF_H(20));
    
    self.unitLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(60))
    .heightIs(YF_H(20));
    
    
    self.downImageView.sd_layout
    .topSpaceToView(self.contentView, YF_H(15))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH -YF_W(28))
    .heightIs(YF_H(170));
    
    self.SwitchButton.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(50))
    .heightIs(YF_H(25));
    
    self.leftTextField.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(116))
    .widthIs(YF_W(90))
    .heightIs(YF_H(20));
    
    self.rightTextField.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(54))
    .widthIs(YF_W(90))
    .heightIs(YF_H(20));
    
    self.oneView.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(152))
    .widthIs(YF_W(9))
    .heightIs(YF_H(1));
    
    
    [self.downImageView sd_addSubviews:@[self.contentLabel,self.openLabel,self.stateImageView]];
    
    
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



-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF333;
        label.hidden=YES;
        _tittleLabel = label;
    }
    return _tittleLabel;
}

-(UILabel *)unitLabel
{
    if (!_unitLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF333;
        label.textAlignment=NSTextAlignmentRight;
        label.hidden=YES;
        _unitLabel = label;
    }
    return _unitLabel;
}



-(UIImageView *)downImageView
{
    if (!_downImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image =[UIImage imageNamed:@"zidongImage"];
        imageView.userInteractionEnabled =YES;
        imageView.hidden=YES;
        _downImageView = imageView;
    }
    return _downImageView;
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
        label.text =@"已有0人开启";
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

-(UISwitch *)YFSwitch
{
    if(!_YFSwitch){
        _YFSwitch = [[UISwitch alloc]init];
        [_YFSwitch setBackgroundColor:WHITECOLOR];
        [_YFSwitch setOnTintColor:WHITECOLOR];
        [_YFSwitch setThumbTintColor:ZHUTICOLOR];
        _YFSwitch.layer.cornerRadius = 15.5f;
        _YFSwitch.layer.masksToBounds = YES;
        _YFSwitch.hidden=YES;
        _YFSwitch.layer.borderColor=ZHUTICOLOR.CGColor;
        _YFSwitch.layer.borderWidth = YF_W(1);
    
    }
    return _YFSwitch;
}
-(UIButton *)SwitchButton
{
    if(!_SwitchButton){
        UIButton *button=[[UIButton alloc]init];
        button.hidden=YES;
        button.adjustsImageWhenHighlighted = NO;
        [button setImage:[UIImage imageNamed:@"guanbiImage"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"kaiqiImage-1"] forState:UIControlStateSelected];
        _SwitchButton=button;
    }
    return _SwitchButton;
}




- (UITextField *)leftTextField {
    if (!_leftTextField) {
        UITextField *textfield = [[UITextField alloc]init];
        textfield.font = YF_FONT(14);
        textfield.textColor =ZHUTICOLOR;
        textfield.hidden =YES;
        textfield.delegate=self;
        textfield.keyboardType=UIKeyboardTypeNumberPad;
         textfield.textAlignment=NSTextAlignmentRight;
        _leftTextField = textfield;
    }
    return _leftTextField;
}


- (UITextField *)rightTextField {
    if (!_rightTextField) {
        UITextField *textfield = [[UITextField alloc]init];
        textfield.font = YF_FONT(14);
        textfield.delegate=self;
        textfield.keyboardType=UIKeyboardTypeNumberPad;
        textfield.textColor =ZHUTICOLOR;
        textfield.hidden =YES;
        textfield.textAlignment=NSTextAlignmentRight;
        _rightTextField = textfield;
    }
    return _rightTextField;
}

-(UIImageView *)oneView
{
    if (!_oneView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor=YF333;
        imageView.hidden=YES;
        imageView.userInteractionEnabled =YES;
        _oneView = imageView;
    }
    return _oneView;
}


-(void)setterUtilizationString:(NSString *)utilization stateType:(NSInteger)type
{
    self.downImageView.hidden=NO;
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

/*
 section1 row1
 */

-(void)setterStion0:(NSInteger)row Type0:(NSInteger)type0 Type1:(NSInteger)type1
{
    self.tittleLabel.hidden=NO;
    self.tittleLabel.text=[YFMineTittle objectAtIndex:row];
    
     if (row==0) {
         self.SwitchButton.tag=0;
         self.SwitchButton.hidden=NO;
         
         if (type0==0) {
             self.SwitchButton.selected=NO;
         }
         if (type0==1) {
            self.SwitchButton.selected=YES;
         }
         
     }
    
    if (row==1) {
        self.SwitchButton.tag=1;
        self.SwitchButton.hidden=NO;
        
        if (type1==0) {
            self.SwitchButton.selected=NO;
        }
        if (type1==1) {
            self.SwitchButton.selected=YES;
        }

    }
    
    if (row==2) {
        self.tittleLabel.font=YF_FONT(12);
        self.tittleLabel.textColor=YF999;
    }
    
}

/*
 section2
 */

-(void)setterStion1:(NSInteger)row string0:(NSString *)string0 string1:(NSString *)string1 string2:(NSString *)string2 string3:(NSString *)string3 string4:(NSString *)string4 string5:(NSString *)string5 string6:(NSString *)string6
{
    self.tittleLabel.hidden=NO;
    self.tittleLabel.text=[YFMineTittle2 objectAtIndex:row];
    
    if (row==0) {
        self.rightTextField.hidden=NO;
         self.unitLabel.hidden=NO;
        self.rightTextField.tag=0;
        self.rightTextField.text=string0;
        self.rightTextField.attributedPlaceholder=[YFTool nsstring:@"账户最低保留金额"];
        self.rightTextField.sd_resetLayout
        .centerYEqualToView(self.contentView)
        .rightSpaceToView(self.contentView, YF_W(54))
        .widthIs(YF_W(130))
        .heightIs(YF_H(20));
        
        self.unitLabel.text=@"元";
    }
    
    if (row==1) {
         self.oneView.hidden=NO;
        self.rightTextField.hidden=NO;
        self.leftTextField.hidden=NO;
        self.leftTextField.text=string1;
        self.rightTextField.text=string2;
        self.unitLabel.hidden=NO;
        self.rightTextField.tag=1;
        self.leftTextField.tag=1;
        self.rightTextField.attributedPlaceholder=[YFTool nsstring:@"最高投标金额"];
        self.leftTextField.attributedPlaceholder=[YFTool nsstring:@"最低投标金额"];
         self.unitLabel.text=@"元";
    }
    if (row==2) {
         self.oneView.hidden=NO;
        self.rightTextField.hidden=NO;
        self.leftTextField.hidden=NO;
         self.unitLabel.hidden=NO;
        self.leftTextField.text=string3;
        self.rightTextField.text=string4;
        self.rightTextField.tag=2;
        self.leftTextField.tag=2;
        self.rightTextField.attributedPlaceholder=[YFTool nsstring:@"最高投资期限"];
        self.leftTextField.attributedPlaceholder=[YFTool nsstring:@"最低投资期限"];
         self.unitLabel.text=@"个月";
        
        
    }
    if (row==3) {
         self.unitLabel.hidden=NO;
        self.oneView.hidden=NO;
        self.rightTextField.hidden=NO;
        self.leftTextField.hidden=NO;
        self.leftTextField.text=string5;
        self.rightTextField.text=string6;
        self.rightTextField.tag=3;
        self.leftTextField.tag=3;
        self.rightTextField.attributedPlaceholder=[YFTool nsstring:@"最高年化利率"];
        self.leftTextField.attributedPlaceholder=[YFTool nsstring:@"最低年化利率"];
         self.unitLabel.text=@"%";
        
        
    }
    
    if (row==4) {
        self.tittleLabel.font=YF_FONT(12);
        self.tittleLabel.textColor=YF999;
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
