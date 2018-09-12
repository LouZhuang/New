//
//  YFBorrowingDetailTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBorrowingDetailTableViewCell.h"
#define YFMineTittle @[@"借款金额",@"借款期限",@"预计年化利率",@"注:此年化利率仅作参考，具体数据以合同为准",@"还款方式"]
#define YFMineContent @[@"元",@"月",@"9.3%",@"",@""]
@implementation YFBorrowingDetailTableViewCell

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
    [self.contentView sd_addSubviews:@[self.tittleLabel,self.contentLabel,self.rightImageView,self.YFTextField]];
    
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(300))
    .heightIs(YF_H(40));
    
    self.contentLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(40));
    
    
    
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
        textfield.keyboardType = UIKeyboardTypeNumberPad;
        textfield.textColor =YF999;
        [textfield addTarget:self action:@selector(phoneClick:) forControlEvents:UIControlEventEditingChanged];
        _YFTextField = textfield;
    }
    return _YFTextField;
}

-(void)phoneClick:(UITextField *)sender
{
    NSLog(@"%@",sender.text);
}

-(void)setterIndex:(NSInteger)row moneyString:(NSString *)money TimeLimitString:(NSString *)timeLimit yearsString:(NSString *)years type:(NSInteger)type
{
    self.tittleLabel.text=[YFMineTittle objectAtIndex:row];
    self.contentLabel.text=[YFMineContent objectAtIndex:row];
    
    if (row!=4) {
         [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    if (row==0) {
        self.contentLabel.textColor=YF333;
        self.YFTextField.hidden=NO;
        self.YFTextField.tag=0;
        self.YFTextField.attributedPlaceholder =[YFTool nsstring:@"请输入借款金额"];
        self.YFTextField.text=money;
    }
    if (row==1) {
        self.contentLabel.textColor=YF333;
        self.YFTextField.hidden=NO;
        self.YFTextField.tag=1;
        self.YFTextField.attributedPlaceholder =[YFTool nsstring:@"请输入借款期限"];
        self.YFTextField.text=timeLimit;
    }
    if (row==2) {
        self.contentLabel.text=years;
    }
    if (row==3) {
        self.tittleLabel.textColor=YF999;
        self.tittleLabel.font=YF_FONT(12);

        
    }
    if (row==4) {
        self.rightImageView.hidden=NO;
        self.YFTextField.hidden=NO;
        self.YFTextField.textColor=ZHUTICOLOR;
        self.YFTextField.userInteractionEnabled=NO;
        if (type==1) {
         self.YFTextField.text=@"等额本息";
        }
        if (type==2) {
          self.YFTextField.text=@"先息后本";
        }
        if (type==3) {
          self.YFTextField.text=@"一次性还本付息";
        }
  
    }
    
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
