//
//  YFWithdrawalDetailTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFWithdrawalDetailTableViewCell.h"
#define YFTittle @[@"订单号",@"提现时间",@"手续费",@"提现金额",@"提现银行",@"提现状态"]
#define YFContent @[@"16363823920292238373",@"2018-01-01 22:33",@"8,000.00元",@"工商银行  尾号1234",@"申请中"]
@implementation YFWithdrawalDetailTableViewCell

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
    
    
    
    [self.contentView sd_addSubviews:@[self.tittleLabel,self.contentLabel]];
    
    
    
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(100))
    .heightIs(YF_H(17));
    
    self.contentLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(200))
    .heightIs(YF_H(17));
    
    
}



-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF999;
        _tittleLabel = label;
    }
    return _tittleLabel;
}

-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF333;
        label.textAlignment = NSTextAlignmentRight;
        _contentLabel = label;
    }
    return _contentLabel;
}



-(void)setterIndex:(NSInteger)row TopUpDetailModel:(YFTopUpDetailModel *)model
{
    self.tittleLabel.text=[YFTittle objectAtIndex:row];
    
    NSString *status=@"";
    if ([model.status integerValue]==0) {
        status=@"待确认提现结果";
    }
   else if ([model.status integerValue]==1) {
        status=@"提现成功";
    }
   else if ([model.status integerValue]==2) {
        status=@"提现失败";
    }
    NSString *bank =@"无";
    if (model.bank != nil) {
        bank = model.bank;
    }
    NSArray *array=@[[NSString stringWithFormat:@"%@",model.withdrawNo],[YFTool timeWithTimeIntervalString:model.createTime Format:@"yyyy-MM-dd HH:mm"],model.commission,[NSString stringWithFormat:@"%@元",model.amount],bank,status];
    self.contentLabel.text=[array objectAtIndex:row];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
