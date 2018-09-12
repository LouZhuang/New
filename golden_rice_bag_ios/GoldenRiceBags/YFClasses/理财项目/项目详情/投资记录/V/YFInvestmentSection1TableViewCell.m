//
//  YFInvestmentSection1TableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/21.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFInvestmentSection1TableViewCell.h"

@implementation YFInvestmentSection1TableViewCell

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
    [self.contentView sd_addSubviews:@[self.tittleLabel,self.contentLabel,self.timeLabel]];
    
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, 0)
    .widthIs(WIDTH/3)
    .heightIs(YF_H(20));
    
    self.contentLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, WIDTH/3)
    .widthIs(WIDTH/3)
    .heightIs(YF_H(20));
    
    self.timeLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(0))
    .widthIs(WIDTH/3)
    .heightIs(YF_H(20));
    
}


-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(11);
        label.textColor =YF666;
        label.textAlignment=NSTextAlignmentCenter;
        _tittleLabel = label;
    }
    return _tittleLabel;
}


-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(11);
        label.textAlignment=NSTextAlignmentCenter;
        label.textColor =YF666;
        _contentLabel = label;
    }
    return _contentLabel;
}


-(UILabel *)timeLabel
{
    if (!_timeLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(11);
        label.textAlignment=NSTextAlignmentCenter;
        label.textColor =YF666;
        _timeLabel = label;
    }
    return _timeLabel;
}

-(void)settermoneyCertificationModel:(YFCertificationModel *)model
{

    NSMutableString * safeBase64Str = [[NSMutableString alloc]initWithString:model.phone];
    safeBase64Str = (NSMutableString * )[safeBase64Str stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
    safeBase64Str = (NSMutableString * )[safeBase64Str stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
    NSInteger mod4 = safeBase64Str.length % 4;
    if(mod4 > 0)
    {
         [safeBase64Str appendString:[@"====" substringToIndex:(4-mod4)]];
    }
    
//    if ([YFTool isValidateMobile:[[safeBase64Str aci_decryptWithAES] aci_decryptWithAES]]==YES) {
        NSString *phone = [safeBase64Str aci_decryptWithAES];
      self.tittleLabel.text=[phone stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
//    }

    self.contentLabel.text =[NSString stringWithFormat:@"%@",model.amount];
    self.timeLabel.text=[YFTool timeWithTimeIntervalString:model.createTime Format:@"yyyy.MM.dd HH:mm:ss"];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
