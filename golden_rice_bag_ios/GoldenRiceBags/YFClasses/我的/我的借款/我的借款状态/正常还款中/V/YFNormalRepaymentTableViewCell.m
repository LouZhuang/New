//
//  YFNormalRepaymentTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFNormalRepaymentTableViewCell.h"
#define YFMineTittle1 @[@"提前还款",@"按期还款"]
#define YFMineTittle01 @[@"可提前结清所有借款",@"还款日将自动还款"]
#define YFMineTittle @[@"借款流水号",@"放款日期",@"每月还款日期",@"借款周期",@"年化利率",@"借款合同"]

#define YFMineTimeOutTittle @[@"借款流水号",@"放款日期",@"每月还款日期",@"借款周期",@"还款方式",@"年化利率",@"借款合同",@"逾期时间",@"逾期费用"]
@implementation YFNormalRepaymentTableViewCell

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
    [self.contentView sd_addSubviews:@[self.totalLabel,self.totalNumberLabel,self.totalRightLabel,self.tittleImageView,self.tittleLabel,self.contentLabel,self.toViewButton]];
    
    self.totalLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(15))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(20));
    
    self.totalNumberLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(37))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(28));
    
    self.totalRightLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(0))
    .widthIs(YF_W(150))
    .heightIs(YF_H(20));
    
    self.tittleImageView.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(6))
    .heightIs(YF_H(6));
    
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(26))
    .widthIs(YF_W(150))
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

-(UILabel *)totalRightLabel
{
    if (!_totalRightLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.hidden=YES;
        label.textAlignment = NSTextAlignmentRight;
        label.textColor =[YFTool YFColorWithString:@"333333"];
        _totalRightLabel = label;
    }
    return _totalRightLabel;
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

-(void)setterIndexRow:(NSInteger)row numberString:(NSString *)number
{
    self.totalLabel.hidden = NO;
    self.totalNumberLabel.hidden = NO;
    
    self.totalNumberLabel.text =number;
    
}

-(void)setterIndexRow:(NSInteger)row totalString:(NSString *)total

{
    self.totalNumberLabel.sd_resetLayout
    .topSpaceToView(self.contentView, YF_H(37))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(17));
    
    self.totalLabel.textColor = [YFTool YFColorWithString:@"333333"];
    self.totalLabel.hidden = NO;
    self.totalNumberLabel.hidden = NO;
    self.totalNumberLabel.font=YF_FONT(12);
    self.totalNumberLabel.textColor =[YFTool YFColorWithString:@"999999"];
    self.totalLabel.text=[YFMineTittle1 objectAtIndex:row];
    self.totalNumberLabel.text =[YFMineTittle01 objectAtIndex:row];
    
    if (row==1) {
        self.totalRightLabel.hidden = NO;
        self.totalRightLabel.text =total;
    }
}


-(void)setterIndexRow:(NSInteger)row modelArray:(NSArray *)array
{
    self.tittleImageView.hidden = NO;
    self.tittleLabel.hidden = NO;
    self.contentLabel.hidden = NO;
    
    self.tittleLabel.text =[YFMineTittle objectAtIndex:row];
    self.contentLabel.text = [array objectAtIndex:row];
    
    if (row == 4 ) {
        self.contentLabel.textColor =ZHUTICOLOR;
    }
    if (row == 5 ) {
        self.contentLabel.textColor =ZHUTICOLOR;
        self.toViewButton.hidden = NO;
    }
}


/*
 逾期中
 */


-(void)setterTimeOutIndexRow:(NSInteger)row numberString:(NSString *)number
{
    self.totalLabel.hidden = NO;
    self.totalNumberLabel.hidden = NO;
    
    self.totalNumberLabel.text =number;
    
}

-(void)setterTimeOutIndexRow:(NSInteger)row totalString:(NSString *)total{
    self.totalNumberLabel.sd_resetLayout
    .topSpaceToView(self.contentView, YF_H(37))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(17));
    
    self.totalLabel.textColor = [YFTool YFColorWithString:@"333333"];
    self.totalLabel.hidden = NO;
    self.totalNumberLabel.hidden = NO;
    self.totalNumberLabel.font=YF_FONT(12);
    self.totalNumberLabel.textColor =[YFTool YFColorWithString:@"999999"];
    self.totalLabel.text=[YFMineTittle1 objectAtIndex:row];
    self.totalNumberLabel.text =[YFMineTittle01 objectAtIndex:row];
    
    if (row==1) {
        self.totalRightLabel.hidden = NO;
        self.totalRightLabel.text =total;
    }
}


-(void)setterTimeOutIndexRow:(NSInteger)row modelArray:(NSArray *)array
{
    self.tittleImageView.hidden = NO;
    self.tittleLabel.hidden = NO;
    self.contentLabel.hidden = NO;
    
    self.tittleLabel.text =[YFMineTimeOutTittle objectAtIndex:row];
    self.contentLabel.text = [array objectAtIndex:row];
    
    if (row == 5 ) {
        self.contentLabel.textColor =ZHUTICOLOR;
    }
    if (row == 6 ) {
        self.contentLabel.textColor =ZHUTICOLOR;
        self.toViewButton.hidden = NO;
    }
    if (row ==7 ) {
        self.contentLabel.textColor =ZHUTICOLOR;
    }
    if (row == 8 ) {
        self.contentLabel.textColor =ZHUTICOLOR;
    }
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
