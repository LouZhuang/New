//
//  YFCreditorsRightsTransferCanTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFCreditorsRightsTransferCanTableViewCell.h"
#define YFMineTittle @[@"",@"投资金额(元)",@"预期剩余收益(元)",@"还款方式",@"预期收益率",@"下一回款日",@"投资期剩余时间"]
#define YFMineTittle0 @[@"",@"投资金额(元)",@"已经回款(元)",@"债权总价(元)",@"投资期剩余时间",@"转让收入",@"手续费",@"实际成交价格的0.15%，转让成功后收取",@"转让成功预计收入"]

@implementation YFCreditorsRightsTransferCanTableViewCell

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
    [self.contentView sd_addSubviews:@[self.tittleLabel,self.contentLabel,self.rightImageView,self.yuanLabel,self.canButton]];
    
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(26))
    .widthIs(YF_W(250))
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


-(UIButton *)canButton
{
    if (!_canButton) {
        
        UIButton *button =[[UIButton alloc] init];
        button.backgroundColor=ZHUTICOLOR;
        button.hidden = YES;
        button.titleLabel.font = YF_FONT(17);
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        [button setTitle:@"我要转让" forState:UIControlStateNormal];
        _canButton = button;
        
    }
    return _canButton;
}

-(void)setterIndex:(NSInteger)row IndexSection:(NSInteger)secrtion CreditorsRightsTransferModel:(YFHomePageModel *)model
{
    if (row!=7) {
        
        
        
//        NSLog(@"000 == %@",[NSString stringWithFormat:@"%@元",model.amount]);
//
//        NSLog(@"222 == %@",[NSString stringWithFormat:@"%@元",model.reserve1]);
//
//        NSLog(@"333 == %@ ",model.repayType);
//
//        NSLog(@"444 == %@",[NSString stringWithFormat:@"%@%%",model.projectRate]);
//
//        NSLog(@"555 == %@ ",model.reserve2);
//
//        NSLog(@" 666 == %@",[YFTool endTime:[YFTool timeWithTimeIntervalString:model.projectRaiseEnd Format:@"yyyy-MM-dd HH:mm:ss"]]);
        NSString *str = @"";
        if (model.reserve2 == nil) {
            str = @"无";
        }else{
            str = model.reserve2;
        }
        NSArray *array= @[@"查看投资详情",[NSString stringWithFormat:@"%@元",model.amount],[NSString stringWithFormat:@"%@元",model.reserve1],model.repayType,[NSString stringWithFormat:@"%@%%",model.projectRate],str,[YFTool endTime:[YFTool timeWithTimeIntervalString:model.projectRaiseEnd Format:@"yyyy-MM-dd HH:mm:ss"]]];
        
        self.tittleLabel.text=[YFMineTittle objectAtIndex:row];
        
        
        self.contentLabel.text=[array objectAtIndex:row];
        if (row==0) {
            self.tittleLabel.text=model.projectName;
        }
        
        
    }
    if (row!=0) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    
    
    if (row==0) {
        
        self.yuanLabel.hidden = YES;
        
        self.tittleLabel.sd_resetLayout
        .centerYEqualToView(self.contentView)
        .leftSpaceToView(self.contentView, YF_W(14))
        .widthIs(YF_W(150))
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
    if (row==3||row==5||row==6) {
        self.contentLabel.textColor=YF333;
    }
    if (row==7) {
        self.canButton.hidden= NO;
        self.canButton.tag=secrtion;
    }
    
}



/*
 我要转让
 */
-(void)setterWantToTransferIndex:(NSInteger)row IndexSection:(NSInteger)secrtion CreditorsRightsTransferModel:(YFHomePageModel *)model
{
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    self.tittleLabel.text=[YFMineTittle0 objectAtIndex:row];
    
    NSArray *array= @[@" ",[NSString stringWithFormat:@"%@元",model.amount],[NSString stringWithFormat:@"%@元",model.returnAmt],[NSString stringWithFormat:@"%@元",model.projectSize],[YFTool endTime:[YFTool timeWithTimeIntervalString:model.projectRaiseEnd Format:@"yyyy-MM-dd HH:mm:ss"]],[NSString stringWithFormat:@"%.2f元",[model.poundage floatValue]+[model.successIncome floatValue]],[NSString stringWithFormat:@"%@元",model.poundage],@"",[NSString stringWithFormat:@"%@元",model.successIncome]];
    
    self.contentLabel.text=[array objectAtIndex:row];
    
    
    
    if (row==0) {
        
        self.tittleLabel.text=model.projectName;
        
        self.yuanLabel.hidden = YES;
        
        self.tittleLabel.sd_resetLayout
        .centerYEqualToView(self.contentView)
        .leftSpaceToView(self.contentView, YF_W(14))
        .widthIs(YF_W(150))
        .heightIs(YF_H(40));
        self.tittleLabel.textColor=YF333;
        self.tittleLabel.font=YF_FONT(14);
        
    }
    if (row==4) {
        self.contentLabel.textColor=YF333;
    }
    
    if (row==5||row==6||row==7||row==8) {
        
        self.tittleLabel.sd_resetLayout
        .centerYEqualToView(self.contentView)
        .leftSpaceToView(self.contentView, YF_W(14))
        .widthIs(YF_W(280))
        .heightIs(YF_H(40));
        
        self.yuanLabel.hidden=YES;
        self.contentView.backgroundColor=LIGHTGREYCOLOR;
        
    }
    if (row==7) {
        self.tittleLabel.text=[NSString stringWithFormat:@"实际成交价格的%@%%，转让成功后收取",model.poundageRate];
    }
    if (row==8) {
        
        self.contentLabel.font=YF_FONT(14);
    }
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

