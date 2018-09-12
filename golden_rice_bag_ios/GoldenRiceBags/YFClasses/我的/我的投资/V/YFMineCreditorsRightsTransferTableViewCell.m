//
//  YFMineCreditorsRightsTransferTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFMineCreditorsRightsTransferTableViewCell.h"

@implementation YFMineCreditorsRightsTransferTableViewCell

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
    [self.contentView sd_addSubviews:@[self.tittleImageView,self.tittleLabel,self.moreButton,self.downImageView,self.noMessageImageView]];
    
    self.tittleImageView.sd_layout
    .topSpaceToView(self.contentView, YF_H(29))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(12))
    .heightIs(YF_H(8));
    
    self.tittleLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(20))
    .leftSpaceToView(self.contentView, YF_W(32))
    .widthIs(YF_W(100))
    .heightIs(YF_H(24));
    
    self.moreButton.sd_layout
    .topSpaceToView(self.contentView, YF_H(9))
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(100))
    .heightIs(YF_H(50));
    
    self.downImageView.sd_layout
    .topSpaceToView(self.contentView, YF_H(59))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH -YF_W(28))
    .heightIs(YF_H(143));
    
    self.noMessageImageView.sd_layout
    .topSpaceToView(self.contentView, YF_H(59))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH -YF_W(28))
    .heightIs(YF_H(143));
    
      [self.downImageView sd_addSubviews:@[self.NumberLabel,self.timeLabel,self.percentageLabel,self.theCastLabel,self.ProgressView,self.progressLabel,self.remainingLabel,self.projectSizeLabel]];
    
    self.NumberLabel.sd_layout
    .topSpaceToView(self.downImageView, YF_W(15))
    .leftSpaceToView(self.downImageView, YF_W(14))
    .widthIs(YF_W(200))
    .heightIs(YF_H(17));
    
    self.timeLabel.sd_layout
    .topSpaceToView(self.downImageView, YF_W(36))
    .leftSpaceToView(self.downImageView, YF_W(14))
    .widthIs(YF_W(200))
    .heightIs(YF_H(17));
    
    self.percentageLabel.sd_layout
    .topSpaceToView(self.downImageView, YF_W(63))
    .leftSpaceToView(self.downImageView, YF_W(14))
    .widthIs(YF_W(100))
    .heightIs(YF_H(28));
    
    self.theCastLabel.sd_layout
    .topSpaceToView(self.downImageView, YF_W(74))
    .rightSpaceToView(self.downImageView, YF_W(50))
    .widthIs(YF_W(100))
    .heightIs(YF_H(17));
    
    self.ProgressView.sd_layout
    .topSpaceToView(self.downImageView, YF_H(101))
    .leftSpaceToView(self.downImageView, YF_W(14))
    .rightSpaceToView(self.downImageView, YF_W(64))
    .heightIs(YF_H(2));
    
    
    self.progressLabel.sd_layout
    .topSpaceToView(self.downImageView, YF_W(93))
    .rightSpaceToView(self.downImageView, YF_W(14))
    .widthIs(YF_W(100))
    .heightIs(YF_H(17));
    
    self.remainingLabel.sd_layout
    .topSpaceToView(self.downImageView, YF_W(111))
    .leftSpaceToView(self.downImageView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(17));
    
    self.projectSizeLabel.sd_layout
    .topSpaceToView(self.downImageView, YF_W(111))
    .rightSpaceToView(self.downImageView, YF_W(50))
    .widthIs(YF_W(150))
    .heightIs(YF_H(17));
    
    
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

-(UIImageView *)tittleImageView
{
    if (!_tittleImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image =[UIImage imageNamed:@"yueImage"];
        imageView.userInteractionEnabled =YES;
        _tittleImageView = imageView;
    }
    return _tittleImageView;
}

-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textColor =YF333;
        label.text =@"债权转让";
        _tittleLabel = label;
    }
    return _tittleLabel;
}


-(UIButton *)moreButton
{
    if (!_moreButton) {
        
        UIButton *button =[[UIButton alloc] init];
        button.titleLabel.font = YF_FONT(14);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        button.titleEdgeInsets =UIEdgeInsetsMake(0,0,0,0);
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button setTitleColor:YF999 forState:UIControlStateNormal];
        [button setTitle:@"查看更多" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(moreClick) forControlEvents:UIControlEventTouchUpInside];
        _moreButton = button;
    }
    return _moreButton;
}
-(void)moreClick
{
    
    YFCreditorsRightsTransferViewController *YFMyInvestmentMoreVC=[[YFCreditorsRightsTransferViewController alloc]init];
    [[YFTool getCurrentVC].navigationController pushViewController:YFMyInvestmentMoreVC animated:YES];
    
}
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


-(UILabel *)NumberLabel
{
    if (!_NumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF333;
//        label.text =@"债权转让-18010101";
        _NumberLabel = label;
    }
    return _NumberLabel;
}


-(UILabel *)timeLabel
{
    if (!_timeLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF333;
//        label.text =@"2017年11月27日 14:20:33";
        _timeLabel = label;
    }
    return _timeLabel;
}

-(UILabel *)percentageLabel
{
    if (!_percentageLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.textColor =ZHUTICOLOR;
//        label.text =@"7.18%";
        _percentageLabel = label;
    }
    return _percentageLabel;
}
-(UILabel *)theCastLabel
{
    if (!_theCastLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF999;
//        label.text =@"剩余50天";
        label.textAlignment =NSTextAlignmentRight;
        _theCastLabel = label;
    }
    return _theCastLabel;
}
-(YFProgressView *)ProgressView
{
    if (!_ProgressView) {
        YFProgressView *view = [[YFProgressView alloc] init];
//        [view setterFloat:0.63];
        _ProgressView = view;
    }
    return _ProgressView;
}

-(UILabel *)progressLabel
{
    if (!_progressLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF666;
//        label.text =@"63%";
        label.textAlignment =NSTextAlignmentRight;
        _progressLabel = label;
    }
    return _progressLabel;
}

-(UILabel *)remainingLabel
{
    if (!_remainingLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF666;
//        label.text =@"剩余可投5000.00元";
        _remainingLabel = label;
    }
    return _remainingLabel;
}
-(UILabel *)projectSizeLabel
{
    if (!_projectSizeLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF666;
//        label.text =@"项目规模18,650.82元";
        label.textAlignment =NSTextAlignmentRight;
        _projectSizeLabel = label;
    }
    return _projectSizeLabel;
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
        label.text =@"您暂时没有转让记录哦~";
        label.textAlignment =NSTextAlignmentCenter;
        _noMessageLabel = label;
    }
    return _noMessageLabel;
}



-(void)setterHomePageModel:(YFHomePageModel *)model totalCountString:(NSString *)totalCount
{
    if ([totalCount integerValue]>0) {
        
        self.noMessageImageView.hidden=YES;
        
        self.projectSizeLabel.text = [NSString stringWithFormat:@"项目规模%@元",model.projectSize] ;//@"项目规模18,650.82元";
        self.remainingLabel.text = [NSString stringWithFormat:@"剩余可投%.2f元",[model.residue floatValue]];// @"剩余可投5000.00元";
        double count = 1 - [model.residue floatValue]/[model.projectSize floatValue];
        [self.ProgressView setterFloat:count];
        if ([model.residue floatValue] == 0) {
            count = 1;
        }

        self.progressLabel.text = [NSString stringWithFormat:@"%.2f%%", count*100]; //@"63%";
       
        long long theCast = [model.raiseEnd longLongValue] - [[YFTool getTimeNow ] longLongValue];
        self.theCastLabel.text =  [NSString stringWithFormat:@"剩余%.f天",theCast/(3600.0*24*1000)];//@"剩余50天";
        self.percentageLabel.text =  [NSString stringWithFormat:@"%@%%",model.rateOfYear];//@"7.18%";
        self.NumberLabel.text = [NSString stringWithFormat:@"债权转让-%@",model.projectName];// @"债权转让-18010101";
        self.timeLabel.text = [YFTool timeWithTimeIntervalString:model.createTime Format:@"yyyy-MM-dd HH:mm:ss"] ;//@"2017年11月27日 14:20:33";
    }
    
   
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
