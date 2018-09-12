//
//  YFNormalAndModelTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFNormalAndModelTableViewCell.h"


#define YFMineTittle0 @[@"借款流水号",@"放款日期",@"每月还款日期",@"还款方式",@"借款周期",@"年化利率",@"借款合同",@"还款记录"]
#define YFMineTittle1 @[@"共还款",@"借款金额",@"利息",@"逾期费用",@"手续费"]
@implementation YFNormalAndModelTableViewCell

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
    [self.contentView sd_addSubviews:@[self.totalLabel,self.totalNumberLabel,self.tittleImageView,self.tittleLabel,self.contentLabel,self.toViewButton]];
    
    self.totalLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(15))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(20));
    
    self.tittleImageView.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(6))
    .heightIs(YF_H(6));
    
    self.totalNumberLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(37))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(28));
    
    
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(26))
    .widthIs(YF_W(120))
    .heightIs(YF_H(45));
    
    self.contentLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(270))
    .heightIs(YF_H(45));
    
    self.toViewButton.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(0))
    .widthIs(YF_W(75))
    .heightIs(YF_H(45));
    
}


#pragma mark - lazy


-(UILabel *)totalLabel
{
    if (!_totalLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.hidden=YES;
        label.textColor =[YFTool YFColorWithString:@"999999"];
        label.text =@"借款金额";
        _totalLabel = label;
    }
    return _totalLabel;
}

-(UIImageView *)tittleImageView
{
    if (!_tittleImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor=ZHUTICOLOR;
        imageView.hidden=YES;
        imageView.layer.cornerRadius=YF_W(6)/2;
        imageView.layer.masksToBounds=YES;
        imageView.userInteractionEnabled =YES;
        _tittleImageView = imageView;
    }
    return _tittleImageView;
}

-(UILabel *)totalNumberLabel
{
    if (!_totalNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.hidden=YES;
        label.textColor =ZHUTICOLOR;
        label.text =@"90,000.00";
        _totalNumberLabel = label;
    }
    return _totalNumberLabel;
}



-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.hidden=YES;
        label.textColor =[YFTool YFColorWithString:@"666666"];
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
        label.textAlignment=NSTextAlignmentRight;
        label.textColor =[YFTool YFColorWithString:@"333333"];
        _contentLabel = label;
    }
    return _contentLabel;
}

-(UIButton *)toViewButton
{
    if (!_toViewButton) {
        UIButton *button=[[UIButton alloc] init];
        button.hidden = YES;
        _toViewButton = button;
    }
    return _toViewButton;
}

-(void)setterIndexRow:(NSInteger)row numberString:(NSString *)number
{
    self.totalLabel.hidden = NO;
    self.totalNumberLabel.hidden = NO;
    
    self.totalNumberLabel.text =number;
    
}




-(void)setterIndexRow:(NSInteger)row modelArray:(NSArray *)array
{
    if (row==5 ||row==6) {
        
        self.contentLabel.textColor = ZHUTICOLOR;
    }
    if (row == 6) {

        self.toViewButton.hidden = NO;
    }
    
    self.tittleLabel.hidden = NO;
    self.contentLabel.hidden = NO;
    self.tittleImageView.hidden=NO;
    self.tittleLabel.text =[YFMineTittle0 objectAtIndex:row];
    self.contentLabel.text = [array objectAtIndex:row];
    
    
    
}

-(void)setterIndexRow:(NSInteger)row sectioTwomodelArray:(NSArray *)array

{
    
    self.tittleLabel.hidden = NO;
    self.tittleLabel.font = YF_FONT(12);
    self.tittleLabel.text =[YFMineTittle1 objectAtIndex:row];
    
    self.contentLabel.hidden = NO;
    self.contentLabel.font = YF_FONT(12);
    self.contentLabel.textColor=ZHUTICOLOR;
    self.contentLabel.text=[array objectAtIndex:row];
    

    if (row==0) {
        
        self.tittleImageView.hidden=NO;
        self.tittleLabel.font = YF_FONT(14);
        self.contentLabel.font = YF_FONT(14);
       
    }

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
