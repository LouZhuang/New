//
//  YFOnScheduleTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFOnScheduleTableViewCell.h"

@implementation YFOnScheduleTableViewCell

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
    [self.contentView sd_addSubviews:@[self.timeLabel,self.yuanLabel,self.totalLabel,self.detailLabel,self.stateLabel]];
    
    self.timeLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(15))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(100))
    .heightIs(YF_H(20));
    
    self.yuanLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(21))
    .leftSpaceToView(self.contentView, YF_W(self.timeLabel.right))
    .widthIs(YF_W(8))
    .heightIs(YF_H(8));
    
    self.totalLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(15))
    .leftSpaceToView(self.contentView, YF_W(self.timeLabel.right + 15))
    .widthIs(YF_W(100))
    .heightIs(YF_H(20));
    
    self.detailLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(37))
    .leftSpaceToView(self.contentView, YF_W(77))
    .widthIs(WIDTH - YF_W(77)-YF_W(14))
    .heightIs(YF_H(17));
    
    
    self.stateLabel.sd_layout
    .bottomSpaceToView(self.contentView, YF_H(15))
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(120))
    .heightIs(YF_H(17));
}


-(UILabel *)timeLabel
{
    if (!_timeLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF666;
//        label.text =@"6.25";
        _timeLabel = label;
    }
    return _timeLabel;
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


-(UILabel *)totalLabel
{
    if (!_totalLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF333;
//        label.text =@"602.23";
        _totalLabel = label;
    }
    return _totalLabel;
}


-(UILabel *)detailLabel
{
    if (!_detailLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF999;
        label.numberOfLines=0;
//        label.text =@"本金498.29+利息103.94+手续费10.00";
        _detailLabel = label;
    }
    return _detailLabel;
}


-(UILabel *)stateLabel
{
    if (!_stateLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF666;
        label.textAlignment=NSTextAlignmentRight;
//        label.text =@"正常还款";
        _stateLabel = label;
    }
    return _stateLabel;
}

-(void)indexPath:(NSInteger)row andDic:(NSDictionary *)dic
{
//    还款状态（0待还款1已还款2逾期中3逾期已还款4扣款失败提醒5提前还款）

//    if (type==row) {

       
        NSString *str = @"";
        switch ([dic[@"status"] integerValue]) {
            case 0:
            {
                str = @"待还款";
            }
                break;
            case 1:
            {
                str = @"已还款";
            }
                break;
            case 2:
            {
                str = @"逾期中";
            }
                break;
            case 3:
            {
                str = @"逾期已还款";
            }
                break;
           
            case 4:
            {
                str = @"扣款失败提醒";
            }
                break;
            case 5:
            {
                str = @"提前还款";
            }
                break;
            default:
                break;
        }
    if ([dic[@"status"] integerValue] == 2) {
        self.detailLabel.text = [NSString stringWithFormat:@"本金%.2f + 利息%.2f +%.2f手续费 +%.2f逾期费",[dic[@"principal"] floatValue],[dic[@"interest"] floatValue],[dic[@"poundage"] floatValue],[dic[@"reserve1"] floatValue]];//  @"     ";//本金498.29+利息103.94+手续费10.00

    }else{
        self.detailLabel.text = [NSString stringWithFormat:@"本金%.2f + 利息%.2f +%.2f手续费",[dic[@"principal"] floatValue],[dic[@"interest"] floatValue],[dic[@"poundage"] floatValue]];//  @"     ";//本金498.29+利息103.94+手续费10.00

    }
        self.totalLabel.text = [NSString stringWithFormat:@"%.2f",[dic[@"total"] floatValue]]; //602.23
        self.timeLabel.text =  [YFTool timeWithTimeIntervalString:[NSString stringWithFormat:@"%lld",[dic[@"repayDate"] longLongValue]] Format:@"MM-dd"];// @"";//6.25
        self.stateLabel.text = str;//=@"正常还款"
    NSLog(@"repayDate ---- %@",dic[@"repayDate"]);
    
    if([dic[@"status"] integerValue] == 4){
        self.totalLabel.hidden=YES;
        
        self.detailLabel.textColor=YF333;
        self.detailLabel.font=YF_FONT(12);
        
        self.detailLabel.sd_resetLayout
        .topSpaceToView(self.contentView, YF_H(15))
        .leftSpaceToView(self.contentView, YF_W(77))
        .widthIs(WIDTH - YF_W(77)-YF_W(14))
        .heightIs(YF_H(50));
        
        self.detailLabel.text=@"扣款失败,请确保存管账户中资金充足后,点击“立即还款”,或联系客服,以免产生更多逾期费用";
//        self.detailLabel.text=@"扣款失败，请点击“立即还款";
        self.yuanLabel.backgroundColor=[YFTool YFColorWithString:@"F83F3F"];
        
        self.stateLabel.textColor=[YFTool YFColorWithString:@"F83F3F"];
        self.stateLabel.text=@"扣款失败";
        self.yuanLabel.hidden = YES;
    }else
    {
        self.totalLabel.hidden=NO;
        self.yuanLabel.hidden = NO;
    }
    
//    }
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
