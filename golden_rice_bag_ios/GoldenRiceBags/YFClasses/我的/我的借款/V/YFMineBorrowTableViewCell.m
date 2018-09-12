//
//  YFMineBorrowTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFMineBorrowTableViewCell.h"

@implementation YFMineBorrowTableViewCell

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
    [self.contentView sd_addSubviews:@[self.downImageView,self.noMessageImageView]];
    
    self.downImageView.sd_layout
    .topEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH -YF_W(28))
    .heightIs(YF_H(185));
    
    self.noMessageImageView.sd_layout
    .topEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH -YF_W(28))
    .heightIs(YF_H(185));
    
    [self.downImageView sd_addSubviews:@[self.serialNumberLabel,self.statusLabel,self.timeLabel,self.borrowingAmountLabel,self.borrowingAmountNumberLabel,self.interestReceivableLabel,self.interestReceivableNumberLabel,self.toBorrowLabel,self.toBorrowNumberLabel]];
    
    self.serialNumberLabel.sd_layout
    .topSpaceToView(self.downImageView, YF_H(15))
    .leftSpaceToView(self.downImageView, YF_W(14))
    .widthIs(YF_W(240))
    .heightIs(YF_H(17));
    
    self.statusLabel.sd_layout
    .topSpaceToView(self.downImageView, YF_H(15))
    .rightSpaceToView(self.downImageView, YF_W(14))
    .widthIs(YF_W(80))
    .heightIs(YF_H(20));
    
    self.timeLabel.sd_layout
    .topSpaceToView(self.downImageView, YF_H(36))
    .leftSpaceToView(self.downImageView, YF_W(14))
    .widthIs(YF_W(200))
    .heightIs(YF_H(17));
    
    self.borrowingAmountLabel.sd_layout
    .topSpaceToView(self.downImageView, YF_H(76))
    .leftSpaceToView(self.downImageView, YF_W(14))
    .widthIs(YF_W(100))
    .heightIs(YF_H(20));
    
    self.borrowingAmountNumberLabel.sd_layout
    .topSpaceToView(self.downImageView, YF_H(76))
    .rightSpaceToView(self.downImageView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(17));
    
    self.interestReceivableLabel.sd_layout
    .topSpaceToView(self.downImageView, YF_H(113))
    .leftSpaceToView(self.downImageView, YF_W(14))
    .widthIs(YF_W(100))
    .heightIs(YF_H(20));
    
    self.interestReceivableNumberLabel.sd_layout
    .topSpaceToView(self.downImageView, YF_H(113))
    .rightSpaceToView(self.downImageView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(17));
    
    self.toBorrowLabel.sd_layout
    .topSpaceToView(self.downImageView, YF_H(150))
    .leftSpaceToView(self.downImageView, YF_W(14))
    .widthIs(YF_W(100))
    .heightIs(YF_H(20));
    
    self.toBorrowNumberLabel.sd_layout
    .topSpaceToView(self.downImageView, YF_H(150))
    .rightSpaceToView(self.downImageView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(17));
    
    for (NSInteger i=0; i < 3; i ++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(YF_W(14), YF_H(65) +i*YF_H(38), YF_W(319), YF_H(1))];
        imageView.image = [UIImage imageNamed:@"xuxianImage"];
        [self.downImageView addSubview:imageView];
    }
    
    
    [self.noMessageImageView sd_addSubviews:@[self.noMessageLogoImageView,self.noMessageLabel]];
    
    self.noMessageLogoImageView.sd_layout
    .topSpaceToView(self.noMessageImageView, YF_H(59))
    .centerXEqualToView(self.noMessageImageView)
    .widthIs(YF_W(73))
    .heightIs(YF_H(50));
    
    self.noMessageLabel.sd_layout
    .topSpaceToView(self.noMessageLogoImageView, YF_W(10))
    .leftSpaceToView(self.noMessageImageView, 0)
    .rightSpaceToView(self.noMessageImageView, 0)
    .heightIs(YF_H(20));
    
    
}

#pragma mark - lazy

-(UIImageView *)downImageView
{
    if (!_downImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image =[UIImage imageNamed:@"minedownImage"];
        imageView.userInteractionEnabled =YES;
        _downImageView = imageView;
    }
    return _downImageView;
}


-(UILabel *)serialNumberLabel
{
    if (!_serialNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =[YFTool YFColorWithString:@"333333"];
        label.text =@"借款流水号 ";
        label.adjustsFontSizeToFitWidth = YES;
        _serialNumberLabel = label;
    }
    return _serialNumberLabel;
}



-(UILabel *)statusLabel
{
    if (!_statusLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =[YFTool YFColorWithString:@"F83F3F"];
        label.textAlignment=NSTextAlignmentRight;
        label.text =@"逾期中";
        label.adjustsFontSizeToFitWidth = YES;
        _statusLabel = label;
    }
    return _statusLabel;
}



-(UILabel *)timeLabel
{
    if (!_timeLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =[YFTool YFColorWithString:@"999999"];
        label.text =@"";
        _timeLabel = label;
    }
    return _timeLabel;
}



-(UILabel *)borrowingAmountLabel
{
    if (!_borrowingAmountLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =[YFTool YFColorWithString:@"666666"];
        label.text =@"借款金额";
        _borrowingAmountLabel = label;
    }
    return _borrowingAmountLabel;
}



-(UILabel *)borrowingAmountNumberLabel
{
    if (!_borrowingAmountNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =ZHUTICOLOR;
        label.text =@"";
        label.textAlignment=NSTextAlignmentRight;
        _borrowingAmountNumberLabel = label;
    }
    return _borrowingAmountNumberLabel;
}



-(UILabel *)interestReceivableLabel
{
    if (!_interestReceivableLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =[YFTool YFColorWithString:@"666666"];
        label.text =@"借款利息";
        _interestReceivableLabel = label;
    }
    return _interestReceivableLabel;
}



-(UILabel *)interestReceivableNumberLabel
{
    if (!_interestReceivableNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =ZHUTICOLOR;
        label.textAlignment=NSTextAlignmentRight;
        label.text =@"元";
        _interestReceivableNumberLabel = label;
    }
    return _interestReceivableNumberLabel;
}
-(UIImageView *)noMessageImageView
{
    if (!_noMessageImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor=WHITECOLOR;
        imageView.userInteractionEnabled =YES;
        _noMessageImageView = imageView;
    }
    return _noMessageImageView;
}

-(UIImageView *)noMessageLogoImageView
{
    if (!_noMessageLogoImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image =[UIImage imageNamed:@"nomessageImage"];
        imageView.userInteractionEnabled =YES;
        _noMessageLogoImageView = imageView;
    }
    return _noMessageLogoImageView;
}

-(UILabel *)noMessageLabel
{
    if (!_noMessageLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF999;
        label.text =@"您暂时没有借款记录哦~";
        label.textAlignment =NSTextAlignmentCenter;
        _noMessageLabel = label;
    }
    return _noMessageLabel;
}




-(UILabel *)toBorrowLabel
{
    if (!_toBorrowLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =[YFTool YFColorWithString:@"666666"];
        label.text =@"借款期限";
        _toBorrowLabel = label;
    }
    return _toBorrowLabel;
}



-(UILabel *)toBorrowNumberLabel
{
    if (!_toBorrowNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =ZHUTICOLOR;
        label.textAlignment=NSTextAlignmentRight;
        label.text =@"";
        _toBorrowNumberLabel = label;
    }
    return _toBorrowNumberLabel;
}

-(void)setterMineBorrowModel:(YFMineBorrowModel *)model totalCountString:(NSString *)totalCount
{
    if ([totalCount integerValue]>0) {

        self.noMessageImageView.hidden=YES;

    self.serialNumberLabel.text=[NSString stringWithFormat:@"借款流水号 %@",model.loanNo];
    self.timeLabel.text=[NSString stringWithFormat:@"%@借",[YFTool timeWithTimeIntervalString:model.createTime Format:@"YYYY年MM月dd日"]];
    self.borrowingAmountNumberLabel.text=[NSString stringWithFormat:@"%@元",model.loanAmount];
     self.toBorrowNumberLabel.text=[NSString stringWithFormat:@"%@个月",model.loanDays];
     self.interestReceivableNumberLabel.text=[NSString stringWithFormat:@"%.2f元",[model.loanAmount floatValue]/12 *[model.loanDays floatValue] *[model.rateOfYear floatValue]/100];
    
    switch (model.status) {
        case 0:
        {
            self.statusLabel.textColor = [YFTool YFColorWithString:@"8ABF79"];
            self.statusLabel.text=@"申请中";
        }
            break;
        case 1:
        {
            self.statusLabel.textColor = [YFTool YFColorWithString:@"8ABF79"];
            self.statusLabel.text=@"募集中";
            
        }
            break;
        case 2:
        {
            self.statusLabel.textColor = [YFTool YFColorWithString:@"8ABF79"];
            self.statusLabel.text=@"正常还款中";
            
        }
            break;
        case 3:
        {
            self.statusLabel.textColor = [YFTool YFColorWithString:@"999999"];
            self.statusLabel.text=@"审核未通过";
            
        }
            break;
        case 4:
        {
            self.statusLabel.textColor = [YFTool YFColorWithString:@"999999"];
            self.statusLabel.text=@"关闭";
        }
            break;
        case 5:
        {
            self.statusLabel.textColor = [YFTool YFColorWithString:@"999999"];
            self.statusLabel.text=@"募集失败";
        }
            break;
        case 6:
        {
            self.statusLabel.textColor = [YFTool YFColorWithString:@"999999"];
            self.statusLabel.text=@"正常结款";
            
        }
            break;
        case 7:
        {
            self.statusLabel.textColor = ZHUTICOLOR;
            self.statusLabel.text=@"提前还款结束";
            
        }
            break;
        case 8:
        {
            self.statusLabel.textColor = [YFTool YFColorWithString:@"FF8421"];
            self.statusLabel.text=@"募集成功";
        }
            break;
        case 9:
        {
            self.statusLabel.textColor = [YFTool YFColorWithString:@"F83F3F"];
            self.statusLabel.text=@"逾期中";
            
        }
            break;
        default:
            break;
    }
    }

}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
