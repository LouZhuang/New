//
//  YFChangeLoginPasswordTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFChangeLoginPasswordTableViewCell.h"
#define YFTittle @[@"原登录密码",@"新登录密码"]
#define YFTittle1 @[@"请输入原登录密码",@"请确认登录密码"]

#define YFTittle2 @[@"新登录密码",@"确认登录密码"]
#define YFTittle22 @[@"请输入新登录密码",@"请确认登录密码"]
@implementation YFChangeLoginPasswordTableViewCell

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
    [self.contentView sd_addSubviews:@[self.tittleLabel,self.YFTextField]];
    
    
    
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(20));
    
    self.YFTextField.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(98))
    .widthIs(YF_W(150))
    .heightIs(YF_H(50));
    
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
        textField.secureTextEntry = YES;
        _YFTextField = textField;
        
    }
    return _YFTextField;
}



-(void)setterIndex:(NSInteger)row
{
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    self.tittleLabel.text = [YFTittle objectAtIndex:row];
    self.YFTextField.attributedPlaceholder=[YFTool nsstring:[YFTittle1 objectAtIndex:row]];
    self.YFTextField.tag = row;
    
}

-(void)setterForgotPasswordChangeIndex:(NSInteger)row
{
    self.YFTextField.sd_resetLayout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(112))
    .widthIs(YF_W(150))
    .heightIs(YF_H(50));
    
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    self.tittleLabel.text = [YFTittle2 objectAtIndex:row];
    self.YFTextField.attributedPlaceholder=[YFTool nsstring:[YFTittle22 objectAtIndex:row]];
    self.YFTextField.tag = row;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
