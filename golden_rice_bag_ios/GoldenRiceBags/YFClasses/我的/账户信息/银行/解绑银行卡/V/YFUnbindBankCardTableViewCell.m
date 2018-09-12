//
//  YFUnbindBankCardTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/25.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFUnbindBankCardTableViewCell.h"
#define YFTittle @[@"真实姓名",@"证件类型",@"证件号码"]
#define YFTittle1 @[@"",@"",@"请输入身份证号码"]
#define YFTittle2 @[@"持卡人",@"银行卡号",@"手机号"]
#define YFTittle3 @[@"",@"请输入银行卡号",@"请输入手机号"]
@implementation YFUnbindBankCardTableViewCell

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
    .leftSpaceToView(self.contentView, YF_W(84))
    .widthIs(YF_W(230))
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
        _YFTextField = textField;
    }
    return _YFTextField;
}


-(void)setterIndex:(NSInteger)row nameString:(NSString *)name idString:(NSString *)YDId
{
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    self.tittleLabel.text=[YFTittle objectAtIndex:row];
    self.YFTextField.attributedPlaceholder=[YFTool nsstring:[YFTittle1 objectAtIndex:row]];
    if (row==0) {
        self.YFTextField.userInteractionEnabled=NO;
        self.YFTextField.text = name;
    }
    if (row==1) {
        self.YFTextField.userInteractionEnabled=NO;
        self.YFTextField.text = YDId;
        self.YFTextField.keyboardType =UIKeyboardTypeNumberPad;
    }

}

/*
 添加银行卡
 */
-(void)setterIndex:(NSInteger)row nameString:(NSString *)name
{
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    self.tittleLabel.text=[YFTittle2 objectAtIndex:row];
    self.YFTextField.keyboardType =UIKeyboardTypeNumberPad;
    self.YFTextField.attributedPlaceholder=[YFTool nsstring:[YFTittle3 objectAtIndex:row]];
    self.YFTextField.tag=row;
    if (row==0) {
        self.YFTextField.userInteractionEnabled=NO;
        self.YFTextField.text = name;
        
    }

    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
