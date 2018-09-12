//
//  YFOpenASavingsAccountTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/14.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFOpenASavingsAccountTableViewCell.h"
#define YFTittle1 @[@"真实姓名",@"证件类型",@"证件号码"]
#define YFTittle2 @[@"银行卡号",@"预留手机号",@"短信验证",@""]
#define YFTittle3 @[@"开通授权",@"",@"授权期限",@"授权金额",@""]
#define YFTittle4 @[@"设置交易密码",@"确认交易密码"]

#define YFPlaceholderTittle1 @[@"请输入您的真实姓名",@"",@"请输入身份证号码"]
#define YFPlaceholderTittle2 @[@"请输入本人银行卡号",@"请输入银行预留手机号",@"请输入验证码"]
#define YFPlaceholderTittle3 @[@"请输入授权期限(选填)",@"请输入授权金额(选填)"]
#define YFPlaceholderTittle4 @[@"请输入交易密码",@"请再次确认密码"]
#define YFTittle @[@"天",@"元"]
@implementation YFOpenASavingsAccountTableViewCell

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
    self.backgroundColor =WHITECOLOR;
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
#warning section0
    [self.contentView sd_addSubviews:@[self.midaiImageView,self.hengFengImageView]];
    
    self.midaiImageView.sd_layout
    .topSpaceToView(self.contentView, YF_H(20))
    .leftSpaceToView(self.contentView, YF_W(76))
    .widthIs(YF_W(92))
    .heightIs(YF_H(24));
    
    self.hengFengImageView.sd_layout
    .topSpaceToView(self.contentView, YF_H(20))
    .rightSpaceToView(self.contentView, YF_W(76))
    .widthIs(YF_W(92))
    .heightIs(YF_H(24));


#warning section1
   [self.contentView sd_addSubviews:@[self.tittleLabel,self.YFtextField]];
    
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(90))
    .heightIs(YF_H(20));
    
    self.YFtextField.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(112))
    .widthIs(YF_W(230))
    .heightIs(YF_H(50));
    
#warning section2
    
    [self.contentView sd_addSubviews:@[self.detailButton,self.tenderLabel,self.reimbursementLabel,self.segmentationView,self.instructionsLabel,self.tianYuanLabel,self.timeButton]];
    
    self.detailButton.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(42));
    
    self.tenderLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(112))
    .widthIs(YF_W(60))
    .heightIs(YF_H(50));
    
    self.segmentationView.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(184))
    .widthIs(YF_W(1))
    .heightIs(YF_H(11));
    
    self.reimbursementLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(118))
    .widthIs(YF_W(60))
    .heightIs(YF_H(50));
    
    self.instructionsLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH-YF_W(28))
    .heightIs(YF_H(42));
    
    self.tianYuanLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(60))
    .heightIs(YF_H(50));
    
    self.timeButton.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(90))
    .heightIs(YF_H(30));
    
}
#warning section0
-(UIImageView *)midaiImageView
{
    if (!_midaiImageView) {
        UIImageView *imageView=[[UIImageView alloc] init];
        imageView.hidden=YES;
        _midaiImageView=imageView;
    }
    return _midaiImageView;
}

-(UIImageView *)hengFengImageView
{
    if (!_hengFengImageView) {
        UIImageView *imageView=[[UIImageView alloc] init];
        imageView.hidden=YES;
        _hengFengImageView=imageView;
    }
    return _hengFengImageView;
}

#warning section1

-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.hidden = YES;
        label.textColor =[YFTool YFColorWithString:@"666666"];
        _tittleLabel = label;
    }
    return _tittleLabel;
}



#warning section2


-(UIButton *)detailButton
{
    if (!_detailButton) {
        UIButton *button=[[UIButton alloc] init];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        button.hidden =YES;
        button.titleLabel.font = YF_FONT(12);
        [button setTitleColor:[YFTool YFColorWithString:@"3987FF"] forState:UIControlStateNormal];
        _detailButton = button;
        
    }
    return _detailButton;
}


-(UILabel *)tenderLabel
{
    if (!_tenderLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.hidden = YES;
        label.textColor =[YFTool YFColorWithString:@"333333"];
        _tenderLabel = label;
    }
    return _tenderLabel;
}

-(UIView *)segmentationView
{
    if (!_segmentationView) {
      
        UIView *view = [[UIView alloc] init];
        view.hidden=YES;
        view.backgroundColor =[YFTool YFColorWithString:@"D8D8D8"];
        _segmentationView =view;
    }
    return _segmentationView;
}

-(UILabel *)reimbursementLabel
{
    if (!_reimbursementLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.hidden = YES;
        label.textColor =[YFTool YFColorWithString:@"333333"];
        _reimbursementLabel = label;
    }
    return _reimbursementLabel;
}

-(UILabel *)instructionsLabel
{
    if (!_instructionsLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.hidden = YES;
        label.textColor =[YFTool YFColorWithString:@"999999"];
        _instructionsLabel = label;
    }
    return _instructionsLabel;
}


-(UILabel *)tianYuanLabel
{
    if (!_tianYuanLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textAlignment=NSTextAlignmentRight;
        label.hidden = YES;
        label.textColor =[YFTool YFColorWithString:@"333333"];
        _tianYuanLabel = label;
    }
    return _tianYuanLabel;
}



- (UITextField *)YFtextField {
    if (!_YFtextField) {
        UITextField *textfield = [[UITextField alloc]init];
        textfield.font = YF_FONT(14);
        textfield.textColor =[YFTool YFColorWithString:@"333333"];
        textfield.hidden =YES;
        _YFtextField = textfield;
    }
    return _YFtextField;
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






/*
 section 和 row
 */
-(void)setterSection:(NSInteger )section indexPath:(NSInteger)row
{
    if (section ==0) {
        self.midaiImageView.hidden =NO;
        self.midaiImageView.image =[UIImage imageNamed:@"midaiImage"];
        
        self.hengFengImageView.hidden =NO;
        self.hengFengImageView.image =[UIImage imageNamed:@"hengfengImage"];
    }
    
    
    if (section ==1) {
        
        self.tittleLabel.hidden = NO;
        self.tittleLabel.text=[YFTittle1 objectAtIndex:row];
        
        self.YFtextField.hidden = NO;
        self.YFtextField.attributedPlaceholder =[YFTool nsstring:[YFPlaceholderTittle1 objectAtIndex:row]];
        if (row ==1) {
            self.YFtextField.text = @"中华人民共和国身份证";
            self.YFtextField.userInteractionEnabled =NO;
        }
        self.YFtextField.tag = row;
        
    }
    
    if (section ==2) {
        self.tittleLabel.hidden = NO;
        self.tittleLabel.text=[YFTittle2 objectAtIndex:row];
        
        if (row !=3) {
            self.YFtextField.hidden = NO;
            self.YFtextField.attributedPlaceholder =[YFTool nsstring:[YFPlaceholderTittle2 objectAtIndex:row]];
            self.YFtextField.keyboardType = UIKeyboardTypeNumberPad;
            self.YFtextField.tag =10 + row;
        }
//        if (row ==2) {
//            self.timeButton.hidden = NO;
//        }
//
//        if (row==3) {
//            self.detailButton.hidden = NO;
//            self.detailButton.tag =0;
//            [self.detailButton setTitle:@"支持银行及限额说明" forState:UIControlStateNormal];
//
//        }
    }
//    if (section ==3) {
//        self.tittleLabel.hidden = NO;
//        self.tittleLabel.text=[YFTittle3 objectAtIndex:row];
//        
//        if (row==0) {
//            self.tenderLabel.hidden = NO;
//            self.tenderLabel.text =@"授权投标";
//            self.segmentationView.hidden = NO;
//            self.reimbursementLabel.hidden = NO;
//            self.reimbursementLabel.text =@"授权还款";
//            
//        }
//        if (row==1) {
//            self.detailButton.hidden = NO;
//            self.detailButton.tag =0;
//            [self.detailButton setTitle:@"什么是授权服务" forState:UIControlStateNormal];
//        }
//        if (row ==2 ||row==3) {
//          
//            self.tianYuanLabel.hidden = NO;
//            self.tianYuanLabel.text =[YFTittle objectAtIndex:row-2];
//            
//            self.YFtextField.hidden = NO;
//            self.YFtextField.attributedPlaceholder =[YFTool nsstring:[YFPlaceholderTittle3 objectAtIndex:row-2]];
//            self.YFtextField.tag =20 + row-2;
//            self.YFtextField.keyboardType = UIKeyboardTypeNumberPad;
//        }
//        
//        if (row == 4) {
//            self.instructionsLabel.hidden = NO;
//            self.instructionsLabel.text =@"不填写默认授权期限为1年，授权金额为10万元";
//        }
//    }
//    if (section ==4) {
//        self.YFtextField.hidden = NO;
//        self.YFtextField.attributedPlaceholder =[YFTool nsstring:[YFPlaceholderTittle4 objectAtIndex:row]];
//        self.YFtextField.tag =30 + row;
//        self.YFtextField.secureTextEntry =YES;
//
//        self.tittleLabel.hidden = NO;
//        self.tittleLabel.text=[YFTittle4 objectAtIndex:row];
//    }
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
