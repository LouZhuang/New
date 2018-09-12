//
//  YFWithdrawalTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFWithdrawalTableViewCell.h"
#define YFTittle @[@"手续费",@"实际到账"]
@implementation YFWithdrawalTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self configuration];
    }
    return self;
}

-(void)configuration
{
    
    
    
    [self.contentView sd_addSubviews:@[self.tittleLabel,self.contentLabel,self.numberLabel,self.changeButton,self.YFtextField]];
    
    
    
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(100))
    .heightIs(YF_H(20));
    
    self.contentLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(207))
    .heightIs(YF_H(17));
    
    self.numberLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(32))
    .widthIs(YF_W(180))
    .heightIs(YF_H(17));
    
    self.changeButton.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(60))
    .heightIs(YF_H(30));
    
    self.YFtextField.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(108))
    .widthIs(YF_W(150))
    .heightIs(YF_H(20));
    
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

-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF333;
        label.hidden=YES;
        label.textAlignment = NSTextAlignmentRight;
        _contentLabel = label;
    }
    return _contentLabel;
}

-(UILabel *)numberLabel
{
    if (!_numberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =ZHUTICOLOR;
        label.hidden=YES;
        label.textAlignment = NSTextAlignmentRight;
        _numberLabel = label;
    }
    return _numberLabel;
}
-(UIButton *)changeButton
{
    if (!_changeButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.layer.cornerRadius = YF_W(15);
        button.hidden = YES;
        button.layer.masksToBounds = YES;
        button.titleLabel.font = YF_FONT(12);
        _changeButton = button;
        
    }
    return _changeButton;
}


- (UITextField *)YFtextField {
    if (!_YFtextField) {
        UITextField *textfield = [[UITextField alloc]init];
        textfield.font = YF_FONT(14);
        textfield.textAlignment=NSTextAlignmentRight;
        textfield.textColor =[YFTool YFColorWithString:@"333333"];
        textfield.attributedPlaceholder=[YFTool nsstring:@"请输入提现金额"];
        textfield.hidden =YES;
        textfield.keyboardType=UIKeyboardTypeNumberPad;
        _YFtextField = textfield;
    }
    return _YFtextField;
}

-(void)setterIndexPath:(NSInteger)row IndexSection:(NSInteger)section textString:(NSString *)text poundageString:(NSString *)poundage totalString:(NSString *)total BankCardNumberString:(NSString *)bankCardNumber

{
    if (section==0) {
        self.tittleLabel.text =@"提现金额";
        self.contentLabel.hidden = NO;
        self.contentLabel.sd_resetLayout
        .centerYEqualToView(self.contentView)
        .rightSpaceToView(self.contentView, YF_W(88))
        .widthIs(YF_W(207))
        .heightIs(YF_H(17));
        self.contentLabel.text=@"元";
        
        self.changeButton.hidden = NO;
        self.changeButton.tag=0;
        [self.changeButton setTitle:@"全部提现" forState:UIControlStateNormal];
        
        
        
        self.YFtextField.hidden = NO;
        self.YFtextField.text=text;
    }
    if (section==1) {
        self.tittleLabel.text =[YFTittle objectAtIndex:row];
        self.contentLabel.hidden = NO;
        self.contentLabel.text=@"元";
        
        if (row==0) {
            self.numberLabel.hidden = NO;
            self.numberLabel.text=poundage;
        }
        if (row==1) {
            self.numberLabel.hidden = NO;
            self.numberLabel.text=total;
        }
        
    }
    if (section==2) {
        self.tittleLabel.text =@"银行卡";
    
        self.contentLabel.hidden = NO;
        
        self.changeButton.hidden = NO;
        self.changeButton.tag=1;
        [self.changeButton setTitle:@"更换" forState:UIControlStateNormal];
        
        self.contentLabel.sd_resetLayout
        .centerYEqualToView(self.contentView)
        .rightSpaceToView(self.contentView, YF_W(88))
        .widthIs(YF_W(207))
        .heightIs(YF_H(17));
        
        if (bankCardNumber.length!=0) {
            NSLog(@"1111 == %@",[YFTool getNewBankNumWitOldBankNum:[YFTool safeBase64Str:bankCardNumber]]);
            
            self.contentLabel.text=[YFTool getNewBankNumWitOldBankNum:[YFTool safeBase64Str:bankCardNumber]];
        }
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
