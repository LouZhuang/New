//
//  YFMyInvestmentMoreTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFMyInvestmentMoreTableViewCell.h"

@implementation YFMyInvestmentMoreTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self configuration];
        
    }
    return self;
}

-(void)configuration
{
    [self.contentView sd_addSubviews:@[self.downImageView]];

    
    self.downImageView.sd_layout
    .topSpaceToView(self.contentView, YF_H(20))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH -YF_W(28))
    .heightIs(YF_H(185));
    
    [self.downImageView sd_addSubviews:@[self.serialNumberLabel,self.statusLabel,self.timeLabel,self.borrowingAmountLabel,self.borrowingAmountNumberLabel,self.interestReceivableLabel,self.interestReceivableNumberLabel,self.toBorrowLabel,self.toBorrowNumberLabel]];
    
    self.serialNumberLabel.sd_layout
    .topSpaceToView(self.downImageView, YF_H(15))
    .leftSpaceToView(self.downImageView, YF_W(14))
    .widthIs(YF_W(200))
    .heightIs(YF_H(17));
    
    self.statusLabel.sd_layout
    .topSpaceToView(self.downImageView, YF_H(15))
    .rightSpaceToView(self.downImageView, YF_W(14))
    .widthIs(YF_W(100))
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
        label.text =@"新手专享-18010101";
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
//        label.text =@"逾期中";
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
        label.text =@"2017年11月27日 14:20:30";
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
        label.text =@"投资份额";
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
        label.text =@"9,000.00元";
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
        label.text =@"预期收益";
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
        label.text =@"50.00元";
        _interestReceivableNumberLabel = label;
    }
    return _interestReceivableNumberLabel;
}



-(UILabel *)toBorrowLabel
{
    if (!_toBorrowLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =[YFTool YFColorWithString:@"666666"];
        label.text =@"到期时间";
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
        label.text =@"2018-04-05";
        _toBorrowNumberLabel = label;
    }
    return _toBorrowNumberLabel;
}
-(void)setterLishiMyInvestmentModel:(YFHomePageModel *)model
{
    self.interestReceivableLabel.text = @"回款本息";
    self.timeLabel.text=[NSString stringWithFormat:@"%@",[YFTool timeWithTimeIntervalString:model.createTime Format:@"YYYY年MM月dd日 HH:mm:ss"]];
    self.serialNumberLabel.text=model.projectName;
    self.toBorrowNumberLabel.text=[NSString stringWithFormat:@"%@",[YFTool timeWithTimeIntervalString:model.projectRaiseEnd Format:@"YYYY-MM-dd"]];
    self.borrowingAmountNumberLabel.text=[NSString stringWithFormat:@"%.2f元",[model.amount floatValue]];
    self.interestReceivableNumberLabel.text = [NSString stringWithFormat:@"%.2f元",[model.reserve1 floatValue] +[model.amount floatValue]];
    switch ([model.status integerValue]) {
        case 0:
        {
            self.statusLabel.text=@"募集中";
        }
            break;
        case 1:
        {
            self.statusLabel.text=@"募集成功";
            
        }
            break;
        case 2:
        {
            self.statusLabel.text=@"计息中";
            
        }
            break;
        case 3:
        {
            self.statusLabel.text=@"已结清";
            
        }
            break;
        case 4:
        {
            self.statusLabel.text=@"转让中";
        }
            break;
        case 5:
        {
            self.statusLabel.text=@"已关闭";
        }
            break;
        case 6:
        {
            self.statusLabel.text=@"已转让";
            
        }
            break;
        case 9:
        {
            self.statusLabel.text=@"待确认购买结果";
            
        }
            break;
            
        default:
            
            break;
    }
}
-(void)setterMyInvestmentModel:(YFHomePageModel *)model
{
    
    self.timeLabel.text=[NSString stringWithFormat:@"%@",[YFTool timeWithTimeIntervalString:model.createTime Format:@"YYYY年MM月dd日 HH:mm:ss"]];
    self.serialNumberLabel.text=model.projectName;
    self.toBorrowNumberLabel.text=[NSString stringWithFormat:@"%@",[YFTool timeWithTimeIntervalString:model.projectRaiseEnd Format:@"YYYY-MM-dd"]];
    self.borrowingAmountNumberLabel.text=[NSString stringWithFormat:@"%.2f元",[model.amount floatValue]];
    self.interestReceivableNumberLabel.text = [NSString stringWithFormat:@"%.2f元",[model.reserve1 floatValue] ];
    switch ([model.status integerValue]) {
        case 0:
        {
            self.statusLabel.text=@"募集中";
        }
            break;
        case 1:
        {
            self.statusLabel.text=@"募集成功";
            
        }
            break;
        case 2:
        {
            self.statusLabel.text=@"计息中";
            
        }
            break;
        case 3:
        {
            self.statusLabel.text=@"已结清";
            
        }
            break;
        case 4:
        {
            self.statusLabel.text=@"转让中";
        }
            break;
        case 5:
        {
            self.statusLabel.text=@"已关闭";
        }
            break;
        case 6:
        {
            self.statusLabel.text=@"已转让";
            
        }
            break;
        case 9:
        {
            self.statusLabel.text=@"待确认购买结果";
            
        }
            break;
            
        default:
   
            break;
    }

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
