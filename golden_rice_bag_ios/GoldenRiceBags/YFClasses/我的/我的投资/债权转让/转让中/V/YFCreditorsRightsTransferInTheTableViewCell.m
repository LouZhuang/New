//
//  YFCreditorsRightsTransferInTheTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFCreditorsRightsTransferInTheTableViewCell.h"
#define YFMineTittle @[@"新手专享-18010101",@"距离目标5000.00元",@"转让份额(元)",@"转让价格(元)",@"发起时间",@"投资期剩余时间",@" "]
#define YFMineContent @[@"查看投资详情",@"已筹63%",@"580.00",@"50.00",@"2018-03-16 17:00",@"1天23小时45分6秒",@" "]

@implementation YFCreditorsRightsTransferInTheTableViewCell

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
    [self.contentView sd_addSubviews:@[self.tittleLabel,self.contentLabel,self.rightImageView,self.yuanLabel,self.canButton,self.ProgressView]];
    
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(26))
    .widthIs(YF_W(300))
    .heightIs(YF_H(40));
    
    self.contentLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(40));
    
    
    
    self.rightImageView.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(5))
    .heightIs(YF_H(9));
    
    self.yuanLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(8))
    .heightIs(YF_H(8));
    
    self.canButton.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(0))
    .widthIs(WIDTH)
    .heightIs(YF_H(49));
    
    self.ProgressView.sd_layout
    .topSpaceToView(self.contentView, YF_H(38))
    .leftSpaceToView(self.contentView, YF_W(14))
    .rightSpaceToView(self.contentView, YF_W(90))
    .heightIs(YF_H(2));
    
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
        label.font = YF_FONT(12);
        label.textColor =YF666;
        _tittleLabel = label;
    }
    return _tittleLabel;
}


-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =ZHUTICOLOR;
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

-(YFProgressView *)ProgressView
{
    if (!_ProgressView) {
        YFProgressView *view = [[YFProgressView alloc] init];
        view.hidden=YES;
//        [view setterFloat:0.63];
        _ProgressView = view;
    }
    return _ProgressView;
}


-(UIButton *)canButton
{
    if (!_canButton) {
        
        UIButton *button =[[UIButton alloc] init];
        button.backgroundColor=ZHUTICOLOR;
        button.hidden = YES;
        button.titleLabel.font = YF_FONT(12);
        button.titleLabel.textAlignment=NSTextAlignmentCenter;
        button.titleLabel.numberOfLines=0;
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
//       NSString *string =@"取消转让\n0天0小时0分0秒后自动结束";
//        NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithString:string];
//        [aString addAttribute:NSForegroundColorAttributeName value:WHITECOLOR range:NSMakeRange(0, string.length)];
//        [aString addAttribute:NSFontAttributeName value:YF_FONT(14) range:NSMakeRange(0, 4)];
//        [aString addAttribute:NSFontAttributeName value:YF_FONT(12) range:NSMakeRange(4, string.length-4)];
//         [button setAttributedTitle:aString forState:UIControlStateNormal];
        _canButton = button;
        
    }
    return _canButton;
}
/**
 转让中
 */
-(void)setterIndex:(NSInteger)row IndexSection:(NSInteger)secrtion andStr:(YFHomePageModel *)model
{

    
    NSString *string = [NSString stringWithFormat:@"取消转让\n%@后自动结束",model.reserve3];
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithString:string];
    [aString addAttribute:NSForegroundColorAttributeName value:WHITECOLOR range:NSMakeRange(0, string.length)];
    [aString addAttribute:NSFontAttributeName value:YF_FONT(14) range:NSMakeRange(0, 4)];
    [aString addAttribute:NSFontAttributeName value:YF_FONT(12) range:NSMakeRange(4, string.length-4)];
    [self.canButton setAttributedTitle:aString forState:UIControlStateNormal];
    
    NSString *str = @"";
    if (model.reserve3 == nil) {
        str = @"无";
    }else{
        str = model.reserve3;
    }
    NSString *prjectName = @"";
    if ([model.isNew integerValue] == 1) {
        prjectName = [NSString stringWithFormat:@"新人专项-%@",model.projectName];
    }else{
        prjectName = model.projectName;
    }
    
    self.tittleLabel.text=[@[prjectName,model.residue,@"转让份额(元)",@"转让价格(元)",@"发起时间",@"投资期剩余时间",@""] objectAtIndex:row];
    double count = 1 - [model.residue floatValue]/[model.projectSize floatValue];
    [self.ProgressView setterFloat:count];
    if ([model.residue floatValue] == 0) {
        count = 1;
    }
    NSString *residue = [NSString stringWithFormat:@"已筹%.2f%%",count*100];
    //projectShare
    self.contentLabel.text =  @[@"查看投资详情",residue,model.projectSize,model.projectShare,[YFTool timeWithTimeIntervalString:model.createTime Format:@"yyyy-MM-dd HH:mm:ss"],str,@" "][row];
//    [YFMineContent objectAtIndex:row];
   
    
    
    if (row!=0) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }

    if (row==0) {
        
        self.yuanLabel.hidden = YES;
        
        self.tittleLabel.sd_resetLayout
        .centerYEqualToView(self.contentView)
        .leftSpaceToView(self.contentView, YF_W(14))
        .widthIs(YF_W(200))
        .heightIs(YF_H(40));
        self.tittleLabel.textColor=YF333;
        self.tittleLabel.font=YF_FONT(14);
        
        self.rightImageView.hidden=NO;
        
        self.contentLabel.sd_resetLayout
        .centerYEqualToView(self.contentView)
        .rightSpaceToView(self.contentView, YF_W(31))
        .widthIs(YF_W(150))
        .heightIs(YF_H(40));
        self.contentLabel.textColor=YF999;
        self.contentLabel.font=YF_FONT(14);
    }
    if (row==1) {
        self.ProgressView.hidden = NO;
        self.yuanLabel.hidden = YES;
        
        self.tittleLabel.sd_resetLayout
        .topSpaceToView(self.contentView, YF_H(10))
        .leftSpaceToView(self.contentView, YF_W(14))
        .widthIs(YF_W(270))
        .heightIs(YF_H(17));
        self.tittleLabel.textColor=ZHUTICOLOR;
        NSString *string = [NSString stringWithFormat:@"距离目标%.2f元",[model.residue floatValue]]; //@"距离目标5000.00元";
        NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithString:string];
        [aString addAttribute:NSForegroundColorAttributeName value:[YFTool YFColorWithString:@"999999"] range:NSMakeRange(0, 4)];
        self.tittleLabel.attributedText =aString;

        self.contentLabel.sd_resetLayout
        .topSpaceToView(self.contentView, YF_H(31))
        .rightSpaceToView(self.contentView, YF_W(14))
        .widthIs(YF_W(150))
        .heightIs(YF_H(17));
        self.contentLabel.textColor=YF666;
        
        UIView *view=[[UIView alloc] init];
        view.backgroundColor=LIGHTGREYCOLOR;
        [self.contentView addSubview:view];
        
        view.sd_layout
        .bottomEqualToView(self.contentView)
        .leftEqualToView(self.contentView)
        .widthIs(WIDTH)
        .heightIs(YF_H(10));
    
    }
    if (row==4||row==5) {
        self.contentLabel.textColor=YF333;
    }
    if (row==6) {
//        self.canButton.hidden= NO;
        if ([model.residue integerValue] != 0) {
            self.canButton.hidden= NO;
             self.yuanLabel.hidden = NO;
        }else{
            self.yuanLabel.hidden = YES;
        }
        self.canButton.tag=secrtion;
    }
    
}

/*
 已转让
 */
-(void)setterTheTransferredIndex:(NSInteger)row IndexSection:(NSInteger)secrtion andStr:(YFHomePageModel *)model

{
//    self.tittleLabel.text=[YFMineTittle objectAtIndex:row];
////    self.contentLabel.text=[YFMineContent objectAtIndex:row];
//    NSString *str = @"";
//    if (model.reserve3 == nil) {
//        str = @"无";
//    }else{
//        str = model.reserve3;
//    }
////    double count = ([model.projectSize floatValue] - [model.residue floatValue])/[model.projectSize floatValue]/100.0;
////    NSString *residue = [NSString stringWithFormat:@"已筹%.2f%%",count];
////    [self.ProgressView setterFloat:count];
//     self.contentLabel.text =  @[@"查看投资详情",model.projectSize,model.projectSize,[YFTool timeWithTimeIntervalString:model.createTime Format:@"yyyy-MM-dd HH:mm:ss"],str,@" ",@" "][row];
    
    
    NSString *prjectName = @"";
    if ([model.isNew integerValue] == 1) {
        prjectName = [NSString stringWithFormat:@"新人专项-%@",model.projectName];
    }else{
        prjectName = model.projectName;
    }
    
    self.tittleLabel.text=[@[prjectName,model.residue,@"转让份额(元)",@"转让价格(元)",@"发起时间",@"转让时间",@""] objectAtIndex:row];

    //    self.contentLabel.text=[YFMineContent objectAtIndex:row];
    NSString *str = @"";
    if (model.reserve3 == nil) {
        str = @"无";
    }else{
        str = model.reserve3;
    }
    double count = 1 - [model.residue floatValue]/[model.projectSize floatValue];
    [self.ProgressView setterFloat:count];
    if ([model.residue floatValue] == 0) {
        count = 1;
    }
    NSString *residue = [NSString stringWithFormat:@"已筹%.2f%%",count*100];
//    double count = [model.amount doubleValue] - [model.cashCoupon doubleValue];
    self.contentLabel.text =  @[@"查看投资详情",
                                residue,
                                model.projectSize,
                                model.projectSize,
                                [YFTool timeWithTimeIntervalString:model.raiseStart Format:@"yyyy-MM-dd HH:mm:ss"],
                                [YFTool timeWithTimeIntervalString:model.lendingTime Format:@"yyyy-MM-dd HH:mm:ss"],@""][row];
    
    if (row!=0) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    if (row==0) {
        
        self.yuanLabel.hidden = YES;
        
        self.tittleLabel.sd_resetLayout
        .centerYEqualToView(self.contentView)
        .leftSpaceToView(self.contentView, YF_W(14))
        .widthIs(YF_W(270))
        .heightIs(YF_H(40));
        self.tittleLabel.textColor=YF333;
        self.tittleLabel.font=YF_FONT(14);
        
        self.rightImageView.hidden=NO;
        
        self.contentLabel.sd_resetLayout
        .centerYEqualToView(self.contentView)
        .rightSpaceToView(self.contentView, YF_W(31))
        .widthIs(YF_W(150))
        .heightIs(YF_H(40));
        self.contentLabel.textColor=YF999;
        self.contentLabel.font=YF_FONT(14);
    }
    if (row==1) {
        self.ProgressView.hidden = NO;
        self.yuanLabel.hidden = YES;
        
        self.tittleLabel.sd_resetLayout
        .topSpaceToView(self.contentView, YF_H(10))
        .leftSpaceToView(self.contentView, YF_W(14))
        .widthIs(YF_W(150))
        .heightIs(YF_H(17));
        self.tittleLabel.textColor=ZHUTICOLOR;
//        NSString *string = @"距离目标5000.00元";
        double count = 1 - [model.residue floatValue]/[model.projectSize floatValue];
        [self.ProgressView setterFloat:count];
        if ([model.residue floatValue] == 0) {
            count = 1;
        }

        NSString *string = [NSString stringWithFormat:@"距离目标%.2f元",[model.residue floatValue]]; //@"距离目标5000.00元";

        NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithString:string];
        [aString addAttribute:NSForegroundColorAttributeName value:[YFTool YFColorWithString:@"999999"] range:NSMakeRange(0, 4)];
        self.tittleLabel.attributedText =aString;
        

        self.contentLabel.sd_resetLayout
        .topSpaceToView(self.contentView, YF_H(31))
        .rightSpaceToView(self.contentView, YF_W(14))
        .widthIs(YF_W(150))
        .heightIs(YF_H(17));
        self.contentLabel.textColor=YF666;
        
        UIView *view=[[UIView alloc] init];
        view.backgroundColor=LIGHTGREYCOLOR;
        [self.contentView addSubview:view];
        
        view.sd_layout
        .bottomEqualToView(self.contentView)
        .leftEqualToView(self.contentView)
        .widthIs(WIDTH)
        .heightIs(YF_H(10));
        
    }
    if (row==4||row==5) {
        self.contentLabel.textColor=YF333;
    }
    if (row==6) {
         self.yuanLabel.hidden = YES;
        self.contentView.backgroundColor=LIGHTGREYCOLOR;
    }
}
/*
 已转入
 */
-(void)setterHasBeenTransferredToIndex:(NSInteger)row IndexSection:(NSInteger)secrtion andStr:(YFHomePageModel *)model
{
    NSString *prjectName = @"";
    if ([model.isNew integerValue] == 1) {
        prjectName = [NSString stringWithFormat:@"新人专项-%@",model.projectName];
    }else{
        prjectName = model.projectName;
    }
    NSArray *array0= @[prjectName,@"转入份额(元)",@"转入价格(元)",@"转入时间",@""];
//    NSArray *array1=  @[@"查看投资详情",@"580.00",@"50.00",@"2018-03-16 17:00",@""];
    NSString *residueCoupon = @"";
//   projectShare
   NSArray *array1 =  @[@"查看投资详情",model.share,model.amount,[YFTool timeWithTimeIntervalString:model.createTime Format:@"yyyy-MM-dd HH:mm:ss"],@" "];
    
    
    self.tittleLabel.text=[array0 objectAtIndex:row];
    self.contentLabel.text=[array1 objectAtIndex:row];
    
    if (row!=0) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    if (row==0) {
        
        self.yuanLabel.hidden = YES;
        
        self.tittleLabel.sd_resetLayout
        .centerYEqualToView(self.contentView)
        .leftSpaceToView(self.contentView, YF_W(14))
        .widthIs(YF_W(270))
        .heightIs(YF_H(40));
        self.tittleLabel.textColor=YF333;
        self.tittleLabel.font=YF_FONT(14);
        
        self.rightImageView.hidden=NO;
        
        self.contentLabel.sd_resetLayout
        .centerYEqualToView(self.contentView)
        .rightSpaceToView(self.contentView, YF_W(31))
        .widthIs(YF_W(150))
        .heightIs(YF_H(40));
        self.contentLabel.textColor=YF999;
        self.contentLabel.font=YF_FONT(14);
    }

    if (row==3) {
        self.contentLabel.textColor=YF333;
    }
    if (row==4) {
        self.yuanLabel.hidden = YES;
        self.contentView.backgroundColor=LIGHTGREYCOLOR;
    }

}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
