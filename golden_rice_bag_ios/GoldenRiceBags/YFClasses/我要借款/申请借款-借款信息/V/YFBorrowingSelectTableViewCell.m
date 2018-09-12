//
//  YFBorrowingSelectTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBorrowingSelectTableViewCell.h"
#define YFMineContent @[@"请选择所属行业",@"请选择收入金额区间"]
#define YFMineTittle @[@"所属行业",@"收入情况"]

@implementation YFBorrowingSelectTableViewCell

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
    [self.contentView sd_addSubviews:@[self.tittleLabel,self.firstButton,self.secondButton,self.threeButton,self.YF_TextView,self.selectButton,self.xiaImageView,self.contentLabel,self.YFtextField]];
    
    self.contentLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(50))
    .heightIs(YF_H(20));
    
    self.YFtextField.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(190))
    .heightIs(YF_H(50));
    
    
    self.tittleLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(15))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(20));
    
    self.YF_TextView.sd_layout
    .topSpaceToView(self.contentView, YF_H(0))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH- YF_W(28))
    .heightIs(YF_H(70));
    
    
    self.firstButton.sd_layout
    .topSpaceToView(self.contentView, YF_H(45))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(70))
    .heightIs(YF_H(20));
    [self.firstButton setIconInLeftWithSpacing:YF_W(6)];
    
    self.secondButton.sd_layout
    .topSpaceToView(self.contentView, YF_H(45))
    .centerXEqualToView(self.contentView)
    .widthIs(YF_W(70))
    .heightIs(YF_H(20));
     [self.secondButton setIconInLeftWithSpacing:YF_W(6)];
    
    self.threeButton.sd_layout
    .topSpaceToView(self.contentView, YF_H(45))
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(90))
    .heightIs(YF_H(20));
     [self.secondButton setIconInLeftWithSpacing:YF_W(6)];
    
    self.tittleLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(15))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(20));
    
    self.selectButton.sd_layout
    .topSpaceToView(self.contentView, YF_H(45))
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH - YF_W(28))
    .heightIs(YF_H(50));
    
    [self.selectButton sd_addSubviews:@[self.xiaImageView]];
    
    self.xiaImageView.sd_layout
    .centerYEqualToView(self.selectButton)
    .rightSpaceToView(self.selectButton, YF_W(14))
    .widthIs(YF_W(9))
    .heightIs(YF_H(5));
    
}

-(UIButton *)firstButton
{
    if (!_firstButton) {
        UIButton *button=[[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"borrownoselect"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"borrowselect"] forState:UIControlStateSelected];
        [button setTitle:@" 自然人" forState:UIControlStateNormal];
        button.hidden=YES;
        [button setTitleColor:YF333 forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(14);
        _firstButton = button;
        
    }
    return _firstButton;
}


-(UIButton *)secondButton
{
    if (!_secondButton) {
        UIButton *button=[[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"borrownoselect"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"borrowselect"] forState:UIControlStateSelected];
        [button setTitle:@"  法人" forState:UIControlStateNormal];
        button.hidden=YES;
        [button setTitleColor:YF333 forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(14);
        _secondButton = button;
        
    }
    return _secondButton;
}


-(UIButton *)threeButton
{
    if (!_threeButton) {
        UIButton *button=[[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"borrownoselect"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"borrowselect"] forState:UIControlStateSelected];
        [button setTitle:@"  其他组织" forState:UIControlStateNormal];
        button.hidden=YES;
        [button setTitleColor:YF333 forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(14);
        _threeButton = button;
        
    }
    return _threeButton;
}



-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.hidden=YES;
        label.textColor =YF666;
        label.text =@"主体性质";
        _tittleLabel = label;
    }
    return _tittleLabel;
}


-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.hidden=YES;
        label.textColor =YF333;
        label.textAlignment=NSTextAlignmentRight;
        label.text =@"元";
        _contentLabel = label;
    }
    return _contentLabel;
}



-(MPTextView *)YF_TextView
{
    if (!_YF_TextView) {
        _YF_TextView = [[MPTextView alloc] init];
        _YF_TextView.backgroundColor = LIGHTGREYCOLOR;
        _YF_TextView.layer.masksToBounds = YES;
        _YF_TextView.layer.cornerRadius = YF_W(8);
        _YF_TextView.font = YF_FONT(14);
        _YF_TextView.hidden=YES;
        _YF_TextView.textColor=ZHUTICOLOR;
        _YF_TextView.placeholderText=@"如有其它贷款，请如实填写贷款类型";
    }
    return _YF_TextView;
}


-(UIButton *)selectButton
{
    if (!_selectButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =LIGHTGREYCOLOR;
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.titleEdgeInsets = UIEdgeInsetsMake(0, YF_W(14), 0, 0);
        [button setTitleColor:YF999 forState:UIControlStateNormal];
        button.layer.cornerRadius = YF_W(8);
        button.layer.masksToBounds = YES;
        button.hidden=YES;
        button.titleLabel.font = YF_FONT(14);
        _selectButton = button;
        
    }
    return _selectButton;
}


-(UIImageView *)xiaImageView
{
    if (!_xiaImageView) {
        UIImageView *imageView =[[UIImageView alloc] init];
        imageView.image=[UIImage imageNamed:@"xiaImage"];
        _xiaImageView = imageView;
    }
    return _xiaImageView;
}



- (UITextField *)YFtextField {
    if (!_YFtextField) {
        UITextField *textfield = [[UITextField alloc]init];
        textfield.font = YF_FONT(14);
        textfield.textColor =ZHUTICOLOR;
        textfield.hidden =YES;
        textfield.textAlignment=NSTextAlignmentRight;
        _YFtextField = textfield;
    }
    return _YFtextField;
}


/*
 section1
 */
-(void)setterSetionOneSelectType:(NSInteger)type
{
    self.tittleLabel.hidden=NO;
    self.firstButton.hidden=NO;
    self.secondButton.hidden=NO;
    self.threeButton.hidden=NO;
    self.firstButton.tag=0;
    self.secondButton.tag=1;
     self.threeButton.tag=2;
    
    if (type==0) {
        self.firstButton.selected=YES;
        self.secondButton.selected=NO;
        self.threeButton.selected=NO;
    }
    if (type==1) {
        self.firstButton.selected=NO;
        self.secondButton.selected=YES;
        self.threeButton.selected=NO;
    }
    if (type==2) {
        self.firstButton.selected=NO;
        self.secondButton.selected=NO;
        self.threeButton.selected=YES;
    }
}

/*
 section2
 */
-(void)setterSetionTwoRow:(NSInteger)row industryString:(NSString *)industry amountString:(NSString *)amount

{
    self.tittleLabel.text=[YFMineTittle objectAtIndex:row];
    self.tittleLabel.hidden=NO;
    self.selectButton.hidden=NO;
    self.selectButton.tag=row;
   
    
    if (row==0) {
       [self.selectButton setTitle:industry forState:UIControlStateNormal];
    }
    if (row==1) {
        [self.selectButton setTitle:amount forState:UIControlStateNormal];
    }
}


/*
 section3
 */
-(void)setterSetionThreeRow:(NSInteger)row SelectType:(NSMutableArray *)type textViewString:(NSString *)textView
{
    if (row==0) {
        self.tittleLabel.hidden=NO;
        self.firstButton.hidden=NO;
        self.secondButton.hidden=NO;
        self.threeButton.hidden=NO;
        self.tittleLabel.text=@"负债情况";
        self.firstButton.tag=0;
        self.secondButton.tag=1;
        self.threeButton.tag=2;
        [self.firstButton setTitle:@"  房贷" forState:UIControlStateNormal];
        [self.secondButton setTitle:@"  车贷" forState:UIControlStateNormal];
        [self.threeButton setTitle:@"  其他贷款" forState:UIControlStateNormal];
        
    
        if ([[type objectAtIndex:0] integerValue]==0) {
            self.firstButton.selected=NO;
        }
        if ([[type objectAtIndex:0] integerValue]==1) {
            self.firstButton.selected=YES;
        }
        if ([[type objectAtIndex:1] integerValue]==0) {
            self.secondButton.selected=NO;
        }
        if ([[type objectAtIndex:1] integerValue]==1) {
            self.secondButton.selected=YES;
        }
        if ([[type objectAtIndex:2] integerValue]==0) {
            self.threeButton.selected=NO;
        }
        if ([[type objectAtIndex:2] integerValue]==1) {
            self.threeButton.selected=YES;
        }
        
    }
    if (row==1) {
        _YF_TextView.text=textView;
       _YF_TextView.hidden=NO;
    }
  
}

/*
 section4
 */
-(void)setterSetionFourRow:(NSInteger)row SelectType:(NSInteger)type lastType:(NSInteger)lasttype textFieldOneString:(NSString *)textFieldOne textFieldTwoString:(NSString *)textFieldTwo
{
    if (row==0) {
    self.tittleLabel.text=@"目前是否其他平台借贷";
    self.tittleLabel.hidden=NO;
    self.firstButton.hidden=NO;
    self.secondButton.hidden=NO;
    self.firstButton.tag=0;
    self.secondButton.tag=1;
    [self.firstButton setTitle:@"  是" forState:UIControlStateNormal];
    [self.secondButton setTitle:@"  否" forState:UIControlStateNormal];
    if (type==0) {
        self.firstButton.selected=YES;
        self.secondButton.selected=NO;
    }
    if (type==1) {
        self.firstButton.selected=NO;
        self.secondButton.selected=YES;
    }
    }
    
     if (row==1) {
         self.tittleLabel.text=@"平台名称";
         self.tittleLabel.hidden=NO;
         self.YFtextField.tag=0;
         self.YFtextField.hidden=NO;
         self.YFtextField.attributedPlaceholder=[YFTool nsstring:@"请输入借款平台名称(选填)"];
         self.YFtextField.text=textFieldOne;
     }
    
    if (row==2) {
        self.tittleLabel.text=@"借款金额";
        self.tittleLabel.hidden=NO;
        self.contentLabel.hidden=NO;
         self.YFtextField.tag=1;
        self.YFtextField.hidden=NO;
        self.YFtextField.attributedPlaceholder=[YFTool nsstring:@"请输入借款金额"];
        self.YFtextField.text=textFieldTwo;
        self.YFtextField.keyboardType=UIKeyboardTypeNumberPad;
        self.YFtextField.sd_resetLayout
        .centerYEqualToView(self.contentView)
        .rightSpaceToView(self.contentView, YF_W(34))
        .widthIs(YF_W(190))
        .heightIs(YF_H(50));
    }
    
    if (row==3) {
        self.tittleLabel.text=@"目前是否逾期";
        self.tittleLabel.hidden=NO;
        self.firstButton.hidden=NO;
        self.secondButton.hidden=NO;
        self.firstButton.tag=2;
        self.secondButton.tag=3;
        [self.firstButton setTitle:@"  是" forState:UIControlStateNormal];
        [self.secondButton setTitle:@"  否" forState:UIControlStateNormal];
        if (lasttype==2) {
            self.firstButton.selected=YES;
            self.secondButton.selected=NO;
            
        }
        if (lasttype==3) {
            self.firstButton.selected=NO;
            self.secondButton.selected=YES;
            
            
            
            
        }
    }
    
    
    
}




-(void)setterIndexPath:(NSInteger)row selectType:(NSInteger)type
{
    [self.contentView removeFromSuperview];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
