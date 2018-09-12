//
//  YFApplicationOfFundsTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFApplicationOfFundsTableViewCell.h"

#define YFMineTittleSetion0 @[@"借款运用情况:",@"借款人经营情况及财务状况:",@"借款人还款能力变化情况:",@"借款人逾期情况:",@"借款人涉诉情况:",@"借款人受行政处罚情况:"]
#define YFMineTittleSetion1 @[@"存管行已经受理提现，借款人承诺借款用于约定用途",@"妥善经营，财务状况良好",@"若有变化，照实披露；若无变化，写暂无变化",@"无逾期情况",@"无",@"无"]
@implementation YFApplicationOfFundsTableViewCell

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
    [self.contentView sd_addSubviews:@[self.yuanLabel,self.tittleLabel,self.contentLabel]];

    self.yuanLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(17))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(8))
    .heightIs(YF_H(8));
    
    self.tittleLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(10))
    .leftSpaceToView(self.contentView, YF_W(26))
    .widthIs(YF_W(200))
    .heightIs(YF_H(20));
    
    self.contentLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(37))
    .leftSpaceToView(self.contentView, YF_W(26))
    .widthIs(WIDTH - YF_W(52))
    .heightIs(YF_H(17));
    

}



-(UILabel *)yuanLabel
{
    if (!_yuanLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.layer.cornerRadius=YF_W(8)/2;
        label.layer.masksToBounds=YES;
        label.backgroundColor =ZHUTICOLOR;
        _yuanLabel = label;
    }
    return _yuanLabel;
}


-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF333;
        _tittleLabel = label;
    }
    return _tittleLabel;
}


-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF666;
        label.numberOfLines=0;
        _contentLabel = label;
    }
    return _contentLabel;
}



-(void)indexPath:(NSInteger)row
{

   
   
}
- (void)setDataDic:(NSString *)str andIndex:(NSInteger )index
{
     self.tittleLabel.text=[YFMineTittleSetion0 objectAtIndex:index];
     self.contentLabel.text = str;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
