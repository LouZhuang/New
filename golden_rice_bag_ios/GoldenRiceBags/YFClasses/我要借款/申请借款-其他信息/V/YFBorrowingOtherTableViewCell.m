//
//  YFBorrowingOtherTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBorrowingOtherTableViewCell.h"
#define YFMineTittle @[@"借款用途",@"还款来源",@"还款措施保障",@"担保主体名称",@"担保措施",@"是否已经履行完毕相关手续"]
#define YFMineContent @[@"请选择借款用途",@"请选择还款来源",@"请确认是否有担保措施"]
@implementation YFBorrowingOtherTableViewCell

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
    [self.contentView sd_addSubviews:@[self.tittleLabel,self.contentLabel,self.firstButton,self.secondButton,self.rightImageView,self.selectButton,self.YF_TextView,self.YFtextField]];
    
    self.tittleLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(15))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(200))
    .heightIs(YF_H(20));
    
    self.contentLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(33))
    .widthIs(YF_W(200))
    .heightIs(YF_H(40));
    
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
    
    self.YFtextField.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(190))
    .heightIs(YF_H(50));
    
    self.YF_TextView.sd_layout
    .topSpaceToView(self.contentView, YF_H(45))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH- YF_W(28))
    .heightIs(YF_H(70));
    
    
    self.rightImageView.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(5))
    .heightIs(YF_H(9));
    
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
        [button setTitle:@" 是" forState:UIControlStateNormal];
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
        [button setTitle:@"  否" forState:UIControlStateNormal];
        button.hidden=YES;
        [button setTitleColor:YF333 forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(14);
        _secondButton = button;
        
    }
    return _secondButton;
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
        label.textColor =YF999;
        label.hidden=YES;
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
        _YF_TextView.placeholderText=@"请输入担保措施";
    }
    return _YF_TextView;
}


- (UITextField *)YFtextField {
    if (!_YFtextField) {
        UITextField *textfield = [[UITextField alloc]init];
        textfield.font = YF_FONT(14);
        textfield.textColor =ZHUTICOLOR;
        textfield.hidden =YES;
        textfield.textAlignment=NSTextAlignmentRight;
        textfield.attributedPlaceholder=[YFTool nsstring:@"请输入担保主体名称"];
        _YFtextField = textfield;
    }
    return _YFtextField;
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




-(void)setterIndex:(NSInteger)row indexSection:(NSInteger)section oneString:(NSString *)one twoString:(NSString *)two threeString:(NSString *)three textViewString:(NSString *)textView textFieldString:(NSString *)textField typeString:(NSInteger)type
{

    
    NSArray *array=@[one,two,three];
    if (section==1) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
         self.tittleLabel.text=[YFMineTittle objectAtIndex:row];
        if (row==0||row==1||row==2) {
        self.selectButton.hidden=NO;
        self.selectButton.tag=row;
        [self.selectButton setTitle:[array objectAtIndex:row] forState:UIControlStateNormal];
            
        }
        if (row==3) {
             self.YFtextField.hidden=NO;
            self.YFtextField.text=textField;
        }
        if (row==4) {
        
          _YF_TextView.hidden=NO;
            _YF_TextView.text=textView;
        }
        if (row==5) {
            self.firstButton.hidden=NO;
            self.firstButton.tag=0;
            self.secondButton.hidden=NO;
            self.secondButton.tag=1;
            
            if (type==0) {
                self.firstButton.selected=YES;
                self.secondButton.selected=NO;
            }
            if (type==1) {
                self.secondButton.selected=YES;
                self.firstButton.selected=NO;
            }
        }
        
        
    }
    if (section==2) {
        self.tittleLabel.text=@"借款协议";
        self.contentLabel.hidden=NO;
        self.contentLabel.text=@"请仔细阅读借款协议";
        self.rightImageView.hidden=NO;
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
