//
//  YFPrepaymentTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFPrepaymentTableViewCell.h"
#define YFMineTittle0 @[@"剩余还款利息(元)",@"逾期费(元)",@"手续费(元)"]
#define YFMineTittle1 @[@"付款类型",@"还款总额(元)"]
@implementation YFPrepaymentTableViewCell

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
    [self.contentView sd_addSubviews:@[self.totalLabel,self.totalNumberLabel,self.tittleLabel,self.contentLabel]];
    
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
    
    
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(45));
    
    self.contentLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(150))
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
        label.textColor =ZHUTICOLOR;
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




-(void)setterIndexRow:(NSInteger)row modelArray:(NSArray *)array
{

    self.tittleLabel.hidden = NO;
    self.contentLabel.hidden = NO;
    
    self.tittleLabel.text =[YFMineTittle0 objectAtIndex:row];
    self.contentLabel.text = [array objectAtIndex:row];

}

-(void)setterIndexRow:(NSInteger)row totalString:(NSString *)total

{

    self.tittleLabel.hidden = NO;
    self.contentLabel.hidden = NO;
    
    self.tittleLabel.text =[YFMineTittle1 objectAtIndex:row];
    

    
    if (row==0) {
        self.contentLabel.text = @"还款";
        self.contentLabel.textColor=[YFTool YFColorWithString:@"333333"];
    }
    if (row==1) {
        
             self.contentLabel.text =total;
        }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
