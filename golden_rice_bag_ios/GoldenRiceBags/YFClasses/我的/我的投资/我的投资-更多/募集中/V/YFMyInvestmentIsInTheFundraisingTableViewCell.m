//
//  YFMyInvestmentIsInTheFundraisingTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFMyInvestmentIsInTheFundraisingTableViewCell.h"
#define YFMineTittleSetion0 @[@"投资订单号",@"投资份额",@"订单金额"]
#define YFMineTittleSetion1 @[@"投资时间",@"预期收益",@"截止时间",@"剩余时间"]

#define YFMineTittleSetion11 @[@"投资时间",@"关闭时间"]

@implementation YFMyInvestmentIsInTheFundraisingTableViewCell

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
    [self.contentView sd_addSubviews:@[self.tittleLabel,self.contentLabel,self.rightImageView]];
    
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(300))
    .heightIs(YF_H(40));
    
    self.contentLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(250))
    .heightIs(YF_H(40));
    
    
    
    self.rightImageView.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(5))
    .heightIs(YF_H(9));
    
    
    
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
        label.font = YF_FONT(14);
        label.textColor =YF333;
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




-(void)setterIndexSection:(NSInteger)section IndexPath:(NSInteger)row stateString:(NSString *)state MyInvestmentModel:(YFHomePageModel *)model
{
    if (section!=0) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    if (section==0) {
        self.tittleLabel.text=model.projectName;
        
        self.rightImageView.hidden=NO;
        
        self.contentLabel.sd_resetLayout
        .centerYEqualToView(self.contentView)
        .rightSpaceToView(self.contentView, YF_W(31))
        .widthIs(YF_W(150))
        .heightIs(YF_H(40));
        self.contentLabel.textColor=[YFTool YFColorWithString:@"8ABF79"];
        self.contentLabel.text=state;
        
        if ([state isEqualToString:@"募集成功"]) {
            self.contentLabel.textColor=YF333;
        }
        
        
        
        
    }
    if (section==1) {
        
        if (row==1||row==2) {
            self.contentLabel.textColor=ZHUTICOLOR;
        }
        
        self.tittleLabel.text=[YFMineTittleSetion0 objectAtIndex:row];
        float contentLabel = [model.amount floatValue] - [model.cashCoupon floatValue];
        NSArray *arr = @[model.investmentNo,[NSString stringWithFormat:@"%@元",model.share],[NSString stringWithFormat:@"%.2f元",contentLabel]];
        self.contentLabel.text=[arr objectAtIndex:row];
        
        
    }
    if (section==2) {
        if (row==1) {
            self.contentLabel.textColor=ZHUTICOLOR;
        }
        
        self.tittleLabel.text=[YFMineTittleSetion1 objectAtIndex:row];
        NSArray *arr = @[[NSString stringWithFormat:@"%@",[YFTool timeWithTimeIntervalString:model.createTime Format:@"YYYY-MM-dd HH:mm"]],[NSString stringWithFormat:@"%@元",model.reserve1],[NSString stringWithFormat:@"%@",[YFTool timeWithTimeIntervalString:model.projectRaiseEnd Format:@"YYYY-MM-dd"]],[YFTool endTime:[YFTool timeWithTimeIntervalString:model.projectRaiseEnd Format:@"yyyy-MM-dd HH:mm:ss"]]];
        self.contentLabel.text=[arr objectAtIndex:row];
        
        NSLog(@"===============%@",arr);
        
    }
    
}

/*
 撤销投资
 */
-(void)setterUndoIndexPath:(NSInteger)row MyInvestmentModel:(YFHomePageModel *)model

{
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
//    NSArray *array=@[@"账单明细",@"投资订单号",@"订单金额",@"手续费",@"红包",@"解冻金额"];
    NSArray *array=@[@"账单明细",@"投资订单号",@"订单金额",@"红包",@"解冻金额"];
    float contentLabel = [model.amount floatValue] - [model.cashCoupon floatValue];
//    NSArray *arr = @[model.investmentNo,[NSString stringWithFormat:@"%@元",model.share],[NSString stringWithFormat:@"%.2f元",contentLabel]];
    NSArray *array1=@[@"",model.investmentNo,[NSString stringWithFormat:@"%.2f元",contentLabel],[NSString stringWithFormat:@"-%@元",model.cashCoupon],[NSString stringWithFormat:@"%@元",model.amount]];
    if (row==0) {
        self.tittleLabel.textColor=YF333;
    }
    
    if (row==2||row==3||row==4||row==5) {
        self.contentLabel.textColor=ZHUTICOLOR;
    }
    
    if (row==5) {
        self.contentView.backgroundColor=LIGHTGREYCOLOR;
    }
    
    self.tittleLabel.text=[array objectAtIndex:row];
    self.contentLabel.text=[array1 objectAtIndex:row];
}

/*
 历史投资
 */
-(void)setterHistoryIndexPath:(NSInteger)row IndexSection:(NSInteger)section MyInvestmentModel:(YFHomePageModel *)model

{
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    if (section==0) {
        self.tittleLabel.text=model.projectName;
        
//        self.rightImageView.hidden=NO;
        
        self.contentLabel.sd_resetLayout
        .centerYEqualToView(self.contentView)
        .rightSpaceToView(self.contentView, YF_W(14))
        .widthIs(YF_W(150))
        .heightIs(YF_H(40));
        
        self.contentLabel.textColor=YF999;
        self.contentLabel.text=@"已关闭";
        

    }
    if (section==1) {
        
        if (row==1||row==2) {
            self.contentLabel.textColor=ZHUTICOLOR;
        }
        
        self.tittleLabel.text=[YFMineTittleSetion0 objectAtIndex:row];

        NSArray *array1=@[model.investmentNo,[NSString stringWithFormat:@"%@元",model.amount],[NSString stringWithFormat:@"%@元",model.projectSize]];

        self.contentLabel.text=[array1 objectAtIndex:row];
        
    }
    if (section==2) {
        
        self.tittleLabel.text=[YFMineTittleSetion11 objectAtIndex:row];
        NSArray *array=@[[YFTool timeWithTimeIntervalString:model.createTime Format:@"YYYY-MM-dd HH:mm"],[YFTool timeWithTimeIntervalString:model.modifyTime Format:@"YYYY-MM-dd HH:mm"]];
        self.contentLabel.text=[array objectAtIndex:row];
    }
    if (section==3) {
        
        self.tittleLabel.text=@"关闭原因";
        self.contentLabel.text=model.reserve1;
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

