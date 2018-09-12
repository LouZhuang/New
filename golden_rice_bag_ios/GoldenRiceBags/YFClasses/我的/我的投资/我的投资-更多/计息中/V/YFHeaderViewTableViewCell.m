//
//  YFHeaderViewTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFHeaderViewTableViewCell.h"
#define YFMineTittleSetion0 @[@"投资订单号",@"投资份额",@"订单金额"]
//#define YFMineTittleSetion1 @[@"转让时间",@"投资时间",@"预期收益",@"计息开始日期",@"持有天数",@"投资期剩余时间",@"加息券剩余时间",@"投资合同"]
#define YFMineTittleSetion1 @[@"投资时间",@"预期收益",@"计息开始日期",@"持有天数",@"投资期剩余时间",@"加息券剩余时间",@"投资合同"]


#define YFHistorySetion0 @[@"投资时间",@"计息开始日期",@"截标时间",@"回款本息",@"投资合同"]
#define YFHistorySetion1 @[@"2018-01-27 20:00",@"2018-02-01",@"2018-02-01",@"55,000.00元",@"查看"]

#define YFMineTittleSetion00 @[@"CZ8549393938857",@"50,000.00元",@"49,000.00元"]
#define YFMineTittleSetion11 @[@"2018-01-27 20:00",@"50.00元",@"2018-02-01",@"25天",@"1天23小时45分6秒",@"2小时45分6秒",@"查看"]
@implementation YFHeaderViewTableViewCell

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
    [self.contentView sd_addSubviews:@[self.tittleLabel,self.contentLabel,self.rightImageView,self.toViewButton]];
    
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
    
    self.toViewButton.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(0))
    .widthIs(YF_W(75))
    .heightIs(YF_H(45));
    
    
    
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
-(UIButton *)toViewButton
{
    if (!_toViewButton) {
        UIButton *button=[[UIButton alloc] init];
        button.hidden = YES;
        _toViewButton = button;
    }
    return _toViewButton;
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


/**
 已转让   或者是投资列表
 
 @param section <#section description#>
 @param row <#row description#>
 @param model <#model description#>
 */
-(void)setterIndexSectioned:(NSInteger)section IndexPath:(NSInteger)row  HomePageModel:(YFHomePageModel *)model
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

        self.contentLabel.textColor=ZHUTICOLOR;
        self.contentLabel.text=@"计息中";
        
    }
    if (section==1) {
        
        if (row==1||row==2) {
            self.contentLabel.textColor=ZHUTICOLOR;
        }
        NSArray *array= @[model.investmentNo,[NSString stringWithFormat:@"%@元",model.amount],[NSString stringWithFormat:@"%@元",model.projectSize]];
        self.tittleLabel.text=[YFMineTittleSetion0 objectAtIndex:row];
        self.contentLabel.text=[array objectAtIndex:row];
    }
    if (section==2) {
        if (row==1||row==7) {
            self.contentLabel.textColor=ZHUTICOLOR;
        }
        NSString *loanDays = @"";
        if (model.reserve1 == nil) {
            loanDays = @"无";
        }else{
            loanDays = [NSString stringWithFormat:@"%@元",model.reserve1];
        }
        NSString *residueCoupon = @"";
        if (model.residueCoupon == nil) {
            residueCoupon = @"无";
        }else{
            residueCoupon = model.residueCoupon;
        }
      
        NSArray *array= @[[NSString stringWithFormat:@"%@",[YFTool timeWithTimeIntervalString:model.createTime Format:@"YYYY-MM-dd HH:mm"]],loanDays,[YFTool timeWithTimeIntervalString:model.rateStart Format:@"YYYY-MM-dd"], [NSString stringWithFormat:@"%@天",model.holdDays],model.residueInvestment,residueCoupon,@"查看"];
        self.tittleLabel.text=[YFMineTittleSetion1 objectAtIndex:row];
        self.contentLabel.text=[array objectAtIndex:row];

        
        
        if (row==6) {
            self.toViewButton.hidden=NO;
            [self.toViewButton addTarget:self action:@selector(chaeckClick) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

/**
 已转让

 @param section <#section description#>
 @param row <#row description#>
 @param model <#model description#>
 */
-(void)setterIndexSection:(NSInteger)section IndexPath:(NSInteger)row  HomePageModel:(YFHomePageModel *)model
{
    if (section!=0) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    if (section==0) {
        self.tittleLabel.text=  [NSString stringWithFormat:@"产品类型二-%@",model.projectName]; //@"产品类型二-18010101";
        
        self.rightImageView.hidden=NO;
        
        self.contentLabel.sd_resetLayout
        .centerYEqualToView(self.contentView)
        .rightSpaceToView(self.contentView, YF_W(31))
        .widthIs(YF_W(150))
        .heightIs(YF_H(40));
        
        self.contentLabel.textColor=YF999;
        switch ([model.status integerValue]) {
            case 0:
            {
                self.contentLabel.text=@"募集中";
            }
                break;
            case 1:
            {
                self.contentLabel.text=@"募集成功";
                
            }
                break;
            case 2:
            {
                self.contentLabel.text=@"计息中";
                
            }
                break;
            case 3:
            {
                self.contentLabel.text=@"已结清";
                
            }
                break;
            case 4:
            {
                self.contentLabel.text=@"转让中";
            }
                break;
            case 5:
            {
                self.contentLabel.text=@"已关闭";
            }
                break;
            case 6:
            {
                self.contentLabel.text=@"已转让";
                
            }
                break;
            case 9:
            {
                self.contentLabel.text=@"待确认购买结果";
                
            }
                break;
                
            default:
                break;
        }
        //        self.contentLabel.text=@"已结清";
        
        
    }
    if (section==1) {
        
        if (row==1||row==2) {
            self.contentLabel.textColor=ZHUTICOLOR;
        }
        
        self.tittleLabel.text=[YFMineTittleSetion0 objectAtIndex:row];
        
        //        #define YFMineTittleSetion0 @[@"投资订单号",@"投资份额",@"订单金额"]
        //        @[@"CZ8549393938857",@"50,000.00元",@"49,000.00元"]
        float contentLabel = [model.amount floatValue] - [model.cashCoupon floatValue];
        //    NSArray *arr = @[model.investmentNo,[NSString stringWithFormat:@"%@元",model.share],[NSString stringWithFormat:@"%.2f元",contentLabel]];
        self.contentLabel.text=@[model.investmentNo,model.share,[NSString stringWithFormat:@"%.2f",contentLabel]][row];
        
    }
    if (section==2) {
        if (row==3||row==4 ||row==5) {
            self.contentLabel.textColor=ZHUTICOLOR;
        }
       
        self.tittleLabel.text=[@[@"投资时间",@"计息开始日期",@"转让时间",@"回款本息",@"投资合同",@"转让合同"] objectAtIndex:row];
        NSString *rateStart = @"";
        if (model.rateStart == nil) {
            rateStart = @"无";
        }else{
            rateStart = [YFTool timeWithTimeIntervalString:[NSString stringWithFormat:@"%@",model.rateStart] Format:@"yyyy-MM-dd"];
        }
        NSArray *arr = @[
                         [YFTool timeWithTimeIntervalString:[NSString stringWithFormat:@"%@",model.createTime] Format:@"yyyy-MM-dd"],
                         rateStart,
                         [YFTool timeWithTimeIntervalString:[NSString stringWithFormat:@"%@",model.modifyTime] Format:@"yyyy-MM-dd"],
                         [NSString stringWithFormat:@"%.2f元",[model.reserve1 floatValue] + [model.amount floatValue]],
                         @"查看",@"查看"];
        self.contentLabel.text=[arr objectAtIndex:row];
        
        
        if (row==4||row==5) {
            self.toViewButton.hidden=NO;
            self.toViewButton.tag = row;
            [self.toViewButton addTarget:self action:@selector(chaeckClickTwo:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    
    
}
-(void)chaeckClickTwo:(UIButton *)btn
{
    //    [YFProgressHUD showInfoWithStatus:@"查看"];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"YFHistorySettlementOfViewPushWebTwo" object:@{@"tag":@(btn.tag)}];
    
    
}
-(void)chaeckClick
{
//    [YFProgressHUD showInfoWithStatus:@"查看"];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"YFHistorySettlementOfViewPushWeb" object:nil];

    
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
/*
 历史投资 已结清
 */

-(void)setterHistoryIndexSection:(NSInteger)section IndexPath:(NSInteger)row HomePageModel:(YFHomePageModel *)model
{
    if (section!=0) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    if (section==0) {
        self.tittleLabel.text=  [NSString stringWithFormat:@"产品类型二-%@",model.projectName]; //@"产品类型二-18010101";
        
        self.rightImageView.hidden=NO;
        
        self.contentLabel.sd_resetLayout
        .centerYEqualToView(self.contentView)
        .rightSpaceToView(self.contentView, YF_W(31))
        .widthIs(YF_W(150))
        .heightIs(YF_H(40));
        
        self.contentLabel.textColor=YF999;
                switch ([model.status integerValue]) {
                    case 0:
                    {
                        self.contentLabel.text=@"募集中";
                    }
                        break;
                    case 1:
                    {
                        self.contentLabel.text=@"募集成功";
        
                    }
                        break;
                    case 2:
                    {
                        self.contentLabel.text=@"计息中";
        
                    }
                        break;
                    case 3:
                    {
                        self.contentLabel.text=@"已结清";
        
                    }
                        break;
                    case 4:
                    {
                        self.contentLabel.text=@"转让中";
                    }
                        break;
                    case 5:
                    {
                        self.contentLabel.text=@"已关闭";
                    }
                        break;
                    case 6:
                    {
                        self.contentLabel.text=@"已转让";
        
                    }
                        break;
                    case 9:
                    {
                        self.contentLabel.text=@"待确认购买结果";
        
                    }
                        break;
        
                    default:
                        break;
                }
//        self.contentLabel.text=@"已结清";
        
        
    }
    if (section==1) {
        
        if (row==1||row==2) {
            self.contentLabel.textColor=ZHUTICOLOR;
        }
        
        self.tittleLabel.text=[YFMineTittleSetion0 objectAtIndex:row];
        
//        #define YFMineTittleSetion0 @[@"投资订单号",@"投资份额",@"订单金额"]
//        @[@"CZ8549393938857",@"50,000.00元",@"49,000.00元"]
        float contentLabel = [model.amount floatValue] - [model.cashCoupon floatValue];
        //    NSArray *arr = @[model.investmentNo,[NSString stringWithFormat:@"%@元",model.share],[NSString stringWithFormat:@"%.2f元",contentLabel]];
        self.contentLabel.text=@[model.investmentNo,model.share,[NSString stringWithFormat:@"%.2f",contentLabel]][row];
        
    }
    if (section==2) {
        if (row==3||row==4) {
            self.contentLabel.textColor=ZHUTICOLOR;
        }
        
        self.tittleLabel.text=[YFHistorySetion0 objectAtIndex:row];
//        @"投资时间",@"计息开始日期",@"转让时间",@"回款本息",@"投资合同"]
//        @[@"2018-01-27 20:00",@"2018-02-01",@"2018-02-01",@"55,000.00元",@"查看"]
        NSString *rateStart = @"";
        if (model.rateStart == nil) {
            rateStart = @"无";
        }else{
            rateStart = [YFTool timeWithTimeIntervalString:[NSString stringWithFormat:@"%@",model.rateStart] Format:@"yyyy-MM-dd"];
        }
     NSArray *arr = @[
          [YFTool timeWithTimeIntervalString:[NSString stringWithFormat:@"%@",model.createTime] Format:@"yyyy-MM-dd"],
          rateStart,
          [YFTool timeWithTimeIntervalString:[NSString stringWithFormat:@"%@",model.projectEnd] Format:@"yyyy-MM-dd"],
          [NSString stringWithFormat:@"%.2f元",[model.reserve1 floatValue] + [model.amount floatValue]],
          @"查看"];
        self.contentLabel.text=[arr objectAtIndex:row];
        
        
        if (row==4) {
            self.toViewButton.hidden=NO;
            [self.toViewButton addTarget:self action:@selector(chaeckClick) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
