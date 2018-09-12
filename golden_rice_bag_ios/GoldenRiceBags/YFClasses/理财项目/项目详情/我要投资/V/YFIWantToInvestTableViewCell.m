//
//  YFIWantToInvestTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/21.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFIWantToInvestTableViewCell.h"
#define YFMineTittle @[@"最低出借金额",@"购买",@"加息券",@"红包",@"预期收益",@"账单明细",@"购买金额",@"红包",@"合计"]

@implementation YFIWantToInvestTableViewCell

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
    [self.contentView sd_addSubviews:@[self.tittleLabel,self.contentLabel,self.tittleImage,self.rightImageView,self.YFTextField]];
    
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(40));
    
    self.contentLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(40));

    
    self.tittleImage.sd_layout
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(12))
    .heightIs(YF_H(8))
    .centerYEqualToView(self.contentView);
    
    
    self.rightImageView.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(5))
    .heightIs(YF_H(9));
    
    self.YFTextField.sd_layout
    .rightSpaceToView(self.contentView, YF_W(40))
    .centerYEqualToView(self.contentView)
    .widthIs(YF_W(200))
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
        label.textColor =ZHUTICOLOR;
        label.textAlignment=NSTextAlignmentRight;
        _contentLabel = label;
    }
    return _contentLabel;
}

-(UIImageView *)tittleImage
{
    if (!_tittleImage) {
        UIImageView *imageView=[[UIImageView alloc] init];
        imageView.hidden=YES;
        imageView.image=[UIImage imageNamed:@"zhuangshidianImage"];
        _tittleImage=imageView;
    }
    
    return _tittleImage;
}

-(UIImageView *)rightImageView
{
    if (!_rightImageView) {
        UIImageView *imageView =[[UIImageView alloc] init];
        imageView.hidden=YES;
        imageView.image=[UIImage imageNamed:@"rightImage"];
        _rightImageView = imageView;
    }
    return _rightImageView;
}


- (UITextField *)YFTextField {
    if (!_YFTextField) {
        UITextField *textfield = [[UITextField alloc]init];
        textfield.font = YF_FONT(14);
        textfield.delegate = self;
        textfield.hidden=YES;
        textfield.textAlignment=NSTextAlignmentRight;
        textfield.attributedPlaceholder =[YFTool nsstring:@"请输入购买金额"];
        textfield.keyboardType = UIKeyboardTypeNumberPad;
        textfield.textColor =YF999;
        _YFTextField = textfield;
    }
    return _YFTextField;
}



-(void)setterIndex:(NSInteger)row investmentMinString:(NSString *)investmentMin buyString:(NSString *)buy RateCouponString:(NSString *)RateCoupon redEnvelopeString:(NSString *)redEnvelope earningsString:(NSString *)earnings buyListString:(NSString *)buyList poundageString:(NSString *)poundage redEnvelopeListString:(NSString *)redEnvelopeList combinedString:(NSString *)combined
{
    if (row==0) {
        self.contentLabel.text=[NSString stringWithFormat:@"%@元",investmentMin];
    }
    
     if (row==1) {
         self.contentLabel.textColor=YF333;
         self.contentLabel.text=@"元";
         self.YFTextField.hidden=NO;
         self.YFTextField.text=buy;
     }
    if (row==2) {
        self.rightImageView.hidden=NO;
        self.contentLabel.text=[NSString stringWithFormat:@"%@%%",RateCoupon];
        self.contentLabel.sd_resetLayout
        .centerYEqualToView(self.contentView)
        .rightSpaceToView(self.contentView, YF_W(31))
        .widthIs(YF_W(150))
        .heightIs(YF_H(40));
    }
    
    if (row==3) {
       self.rightImageView.hidden=NO;
        self.contentLabel.text=[NSString stringWithFormat:@"￥%@",redEnvelope];
        self.contentLabel.sd_resetLayout
        .centerYEqualToView(self.contentView)
        .rightSpaceToView(self.contentView, YF_W(31))
        .widthIs(YF_W(150))
        .heightIs(YF_H(40));
        
    }
    if (row==4) {
        self.backgroundColor=LIGHTGREYCOLOR;
        self.contentLabel.text=[NSString stringWithFormat:@"%.2f元",[earnings floatValue]];
        
    }
    if (row==5) {
        self.tittleLabel.textColor=YF333;
        self.tittleLabel.sd_resetLayout
        .centerYEqualToView(self.contentView)
        .leftSpaceToView(self.contentView, YF_W(32))
        .widthIs(YF_W(150))
        .heightIs(YF_H(40));
        
        self.tittleImage.hidden=NO;
       
        
    }
    if (row==6) {

        self.contentLabel.text=[NSString stringWithFormat:@"%@元",buyList];
    }
//    if (row==7) {
//
//        self.contentLabel.text=[NSString stringWithFormat:@"%@元",poundage];
//    }
    if (row==7) {

        self.contentLabel.text=[NSString stringWithFormat:@"%@元",redEnvelopeList];
    }
    if (row==8) {
        self.tittleLabel.textColor=YF333;
        self.backgroundColor=LIGHTGREYCOLOR;
         self.contentLabel.text=[NSString stringWithFormat:@"%@元",combined];
    }
    
    
    self.tittleLabel.text=[YFMineTittle objectAtIndex:row];
 
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
