//
//  YFForgotPasswordTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFForgotPasswordTableViewCell.h"

#define YFTittle @[@"真实姓名",@"证件类型",@"证件号码",@"短信验证"]
#define YFTittle1 @[@"",@"",@"请输入身份证号码",@"请输入验证码"]
@implementation YFForgotPasswordTableViewCell

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
    [self.contentView sd_addSubviews:@[self.tittleLabel,self.YFTextField,self.timeButton]];
    
    
    
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(20));
    
    self.YFTextField.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(84))
    .widthIs(YF_W(150))
    .heightIs(YF_H(50));
    
    self.timeButton.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(90))
    .heightIs(YF_H(30));
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
-(UITextField *)YFTextField
{
    if (!_YFTextField) {
        UITextField *textField =[[UITextField alloc] init];
        textField.font = YF_FONT(14);
        textField.textColor =YF333;
        _YFTextField = textField;
    }
    return _YFTextField;
}

-(TimeButton *)timeButton
{
    if (!_timeButton) {
        _timeButton = [TimeButton buttonWithType:UIButtonTypeCustom];
        _timeButton.backgroundColor = ZHUTICOLOR;
        _timeButton.hidden = YES;
        [_timeButton setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        [_timeButton.titleLabel setFont:[UIFont systemFontOfSize:YF_W(12)]];
        [_timeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        _timeButton.layer.masksToBounds = YES;
        _timeButton.layer.cornerRadius = YF_W(15.5);
        
    }
    return _timeButton;
}

-(void)setterIndex:(NSInteger)row nameString:(NSString *)name idString:(NSString *)YDId
{
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    self.tittleLabel.text=[YFTittle objectAtIndex:row];
    self.YFTextField.attributedPlaceholder=[YFTool nsstring:[YFTittle1 objectAtIndex:row]];
     self.YFTextField.tag = row;
    if (row==0) {
        self.YFTextField.userInteractionEnabled=NO;
        self.YFTextField.text = name;
    }
    if (row==1) {
       self.YFTextField.userInteractionEnabled=NO;
        self.YFTextField.text = YDId;
        self.YFTextField.keyboardType =UIKeyboardTypeNumberPad;
    }
    
    if (row==3) {
    
        self.timeButton.hidden = NO;
         self.YFTextField.keyboardType =UIKeyboardTypeNumberPad;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
