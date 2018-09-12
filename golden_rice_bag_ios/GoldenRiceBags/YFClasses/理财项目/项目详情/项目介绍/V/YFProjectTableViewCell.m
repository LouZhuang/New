//
//  YFProjectTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/21.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFProjectTableViewCell.h"
#define YFMineTittle @[@"借款人",@"身份证号码",@"借款人主体性质",@"借款人所属行业",@"借款人收入"]
@implementation YFProjectTableViewCell

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
    [self.contentView sd_addSubviews:@[self.tittleLabel,self.subtitleLabel,self.contentLabel,self.viceContentLabel,self.rightImageView]];
    
    self.tittleLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(15))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH - YF_W(28))
    .heightIs(YF_H(20));
    
    self.subtitleLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(39))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH - YF_W(28))
    .heightIs(YF_H(17));
    
    self.contentLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(58))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH - YF_W(28))
    .heightIs(YF_H(17));
    
    self.viceContentLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(77))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH - YF_W(28))
    .heightIs(YF_H(17));
    
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
        label.hidden=YES;
        _tittleLabel = label;
    }
    return _tittleLabel;
}
-(UILabel *)subtitleLabel
{
    if (!_subtitleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF666;
        label.hidden=YES;
        _subtitleLabel = label;
    }
    return _subtitleLabel;
}

-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF666;
        label.hidden=YES;
        _contentLabel = label;
    }
    return _contentLabel;
}

-(UILabel *)viceContentLabel
{
    if (!_viceContentLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF666;
        label.hidden=YES;
        _viceContentLabel = label;
    }
    return _viceContentLabel;
}


-(UIImageView *)rightImageView
{
    if (!_rightImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.hidden = YES;
        imageView.image=[UIImage imageNamed:@"rightImage"];
        imageView.userInteractionEnabled =YES;
        _rightImageView = imageView;
    }
    return _rightImageView;
}

-(void)setterIndexSection:(NSInteger)section indexRow:(NSInteger)row loanInfoEntityDic:(NSDictionary *)loanInfoDic projectEntityDic:(NSDictionary *)projectDic loanerString:(NSString *)loaner loanerIdCardString:(NSString *)loanerIdCard andNr:(NSString *)nrProject
{
    if (loanInfoDic !=nil) {
        
        if (section==0) {
            if (row==0) {
                self.tittleLabel.hidden=NO;
                self.subtitleLabel.hidden=NO;
                self.contentLabel.hidden=NO;
                self.tittleLabel.text=@"项目名称及简介";
                self.subtitleLabel.text=[projectDic objectForKey:@"projectName"];
                self.contentLabel.text= nrProject;//@"项目简介项目简介项目简介项目简介";
            }
            if (row==1) {
                self.tittleLabel.hidden=NO;
                self.subtitleLabel.hidden=NO;
                self.tittleLabel.text=@"募集期";
                self.subtitleLabel.text=[NSString stringWithFormat:@"%@至%@",[YFTool timeWithTimeIntervalString:[projectDic objectForKey:@"raiseStart"] Format:@"yyyy-MM-dd"],[YFTool timeWithTimeIntervalString:[projectDic objectForKey:@"raiseEnd"] Format:@"yyyy-MM-dd"]];
            }
            if (row==2) {
                self.tittleLabel.hidden=NO;
                self.subtitleLabel.hidden=NO;
                self.tittleLabel.text=@"借款用途";
                self.subtitleLabel.text=[loanInfoDic objectForKey:@"usageOfLoan"];
            }
            if (row==3) {
                self.tittleLabel.hidden=NO;
                self.subtitleLabel.hidden=NO;
                self.tittleLabel.text=@"还款来源";
                self.subtitleLabel.text=[loanInfoDic objectForKey:@"repaySource"];
            }
            if (row==4) {
                self.tittleLabel.hidden=NO;
                self.subtitleLabel.hidden=NO;
                self.contentLabel.hidden=NO;
                self.viceContentLabel.hidden=NO;
                self.tittleLabel.text=@"还款措施保障";
                self.subtitleLabel.text=[loanInfoDic objectForKey:@"assuranceOfMeasure"];
                if (![[loanInfoDic objectForKey:@"guaranteeOrganization"] isKindOfClass:[NSNull class]]) {
                   self.contentLabel.text=[NSString stringWithFormat:@"担保主体名称:%@",[loanInfoDic objectForKey:@"guaranteeOrganization"]];
                }else{
                    self.contentLabel.text = @"担保主体名称:无";
                }
               
                
                NSString *isFormalities=[NSString stringWithFormat:@"%@",[loanInfoDic objectForKey:@"isFormalities"]];
                if ([isFormalities integerValue]==0) {
                    self.viceContentLabel.text=@"是否已经履行完毕相关手续:否";
                }
                if ([isFormalities integerValue]==1) {
                    self.viceContentLabel.text=@"是否已经履行完毕相关手续:是";
                }
                
                
                
            }
            if (row==5) {
                self.tittleLabel.hidden=NO;
                self.subtitleLabel.hidden=NO;
                self.tittleLabel.text=@"风险评估及可能产生的风险结果";
                self.subtitleLabel.text=@"风险评估及可能产生的风险结果";
            }
        }
        if (section==1) {
            
            self.tittleLabel.hidden=NO;
            self.tittleLabel.textColor =YF666;
            self.tittleLabel.text=[YFMineTittle objectAtIndex:row];
            
            self.tittleLabel.sd_resetLayout
            .topSpaceToView(self.contentView, YF_H(0))
            .leftSpaceToView(self.contentView, YF_W(14))
            .widthIs(WIDTH - YF_W(28))
            .heightIs(YF_H(40));
            
            NSString *organizationStr=@"";
            if ([[loanInfoDic objectForKey:@"organization"] isEqualToString:@"natural"]) {
                organizationStr=@"自然人";
            }
            if ([[loanInfoDic objectForKey:@"organization"] isEqualToString:@"corporation"]) {
                organizationStr=@"法人";
            }
            if ([[loanInfoDic objectForKey:@"organization"] isEqualToString:@"other"]) {
                organizationStr=@"其他组织";
            }
            
            NSArray *array=@[loaner,loanerIdCard,organizationStr,[loanInfoDic objectForKey:@"occupation"],[loanInfoDic objectForKey:@"annualIncome"]];
            
            self.contentLabel.hidden=NO;
            self.contentLabel.textColor =YF333;
            self.contentLabel.textAlignment=NSTextAlignmentRight;
            self.contentLabel.text=[array objectAtIndex:row];
            
            self.contentLabel.sd_resetLayout
            .topSpaceToView(self.contentView, YF_H(0))
            .rightSpaceToView(self.contentView, YF_W(14))
            .widthIs(WIDTH - YF_W(28))
            .heightIs(YF_H(40));
            
            
        }
        if (section==2) {
            if (row==0) {
                self.tittleLabel.hidden=NO;
                self.subtitleLabel.hidden=NO;
                self.contentLabel.hidden=NO;
                self.viceContentLabel.hidden=NO;
                self.tittleLabel.text=@"借款人负债情况";
                
                 if (![[NSString stringWithFormat:@"%@",[loanInfoDic objectForKey:@"incurDebts"]] isEqualToString:@"<null>"]) {
                    
                    NSString *str=[loanInfoDic objectForKey:@"incurDebts"];
                    NSRange range = [str rangeOfString:@"房贷"];
                    NSRange rangeT = [str rangeOfString:@"车贷"];
                    if (range.location!=NSNotFound) {
                        self.subtitleLabel.text=@"房贷:有";
                    }else {
                        self.subtitleLabel.text=@"房贷:无";
                    }
                    if (rangeT.location!=NSNotFound) {
                        self.contentLabel.text=@"车贷:有";
                    }else {
                        self.contentLabel.text=@"车贷:无";
                    }
                }
                else{
                    self.subtitleLabel.text=@"房贷:无";
                    self.contentLabel.text=@"车贷:无";
                }
                if (![[NSString stringWithFormat:@"%@",[loanInfoDic objectForKey:@"incurDebts"]] isEqualToString:@"<null>"]) {
                    NSString *str=[loanInfoDic objectForKey:@"incurDebts"];
                    NSRange range = [str rangeOfString:@"/"];
             
                    if (range.location!=NSNotFound) {
                        NSArray  *array = [[NSString stringWithFormat:@"%@",[loanInfoDic objectForKey:@"incurDebts"]] componentsSeparatedByString:@"/"];
                        
                        for (NSInteger i = 0; i < array.count; i++) {
                            NSString *str=[array objectAtIndex:i];
                            NSRange range = [str rangeOfString:@"房贷"];
                            NSRange rangeT = [str rangeOfString:@"车贷"];
                            if (range.location!=NSNotFound ||rangeT.location!=NSNotFound ) {
                                self.viceContentLabel.text=@"其他贷款:无";
                            }
                            else{
                               self.viceContentLabel.text=[NSString stringWithFormat:@"其他贷款:%@",[array objectAtIndex:i]];
                            }
                        }
                        
                        
                        
                    }
                    else{
                        NSString *str=[loanInfoDic objectForKey:@"incurDebts"];
                        NSRange range = [str rangeOfString:@"房贷"];
                        NSRange rangeT = [str rangeOfString:@"车贷"];
                        
                        if (range.location!=NSNotFound ||rangeT.location!=NSNotFound ) {
                       self.viceContentLabel.text=@"其他贷款:无";
                        }else{
                           self.viceContentLabel.text=[NSString stringWithFormat:@"其他贷款:%@",[loanInfoDic objectForKey:@"incurDebts"]];
                        }
                    }
                    
                }else{
                    self.viceContentLabel.text=@"其他贷款:无";
                }
                
            }
            if (row==1) {
                self.tittleLabel.hidden=NO;
                self.subtitleLabel.hidden=NO;
                self.tittleLabel.text=@"截至借款前6个月内借款人征信报告中的逾期情况";
                self.subtitleLabel.text=@"央行出具的征信报告";
            }
            if (row==2) {
                self.tittleLabel.hidden=NO;
                self.subtitleLabel.hidden=NO;
                self.contentLabel.hidden=NO;
                self.viceContentLabel.hidden=NO;
                self.tittleLabel.text=@"借款人在其他平台的借款情况(借款当时)";
                if (![[loanInfoDic objectForKey:@"otherPlatform"] isKindOfClass:[NSNull class]]) {
                    self.subtitleLabel.text=[NSString stringWithFormat:@"平台名称:%@",[loanInfoDic objectForKey:@"otherPlatform"]];

                }else{
                    self.subtitleLabel.text= @"平台名称:无";
                }
                if (![[loanInfoDic objectForKey:@"otherPlatform"] isKindOfClass:[NSNull class]]) {
                    self.contentLabel.text=[NSString stringWithFormat:@"借款金额:%@元",[loanInfoDic objectForKey:@"otherPlatformLoan"]];
                }else{
                    self.contentLabel.text= @"借款金额:无";
                }
               
                
                NSString *isOverdueStr=[NSString stringWithFormat:@"%@",[loanInfoDic objectForKey:@"isOverdue"]];
                if ([isOverdueStr integerValue]==0) {
                    self.viceContentLabel.text=@"是否逾期:否";
                }
                if ([isOverdueStr integerValue]==1) {
                    self.viceContentLabel.text=@"是否逾期:是";
                }
                
            }
            if (row==3) {
                
                self.rightImageView.hidden=NO;
                self.tittleLabel.hidden=NO;
                self.tittleLabel.textColor =YF666;
                self.tittleLabel.text=@"服务协议";
                
                self.tittleLabel.sd_resetLayout
                .topSpaceToView(self.contentView, YF_H(0))
                .leftSpaceToView(self.contentView, YF_W(14))
                .widthIs(WIDTH - YF_W(28))
                .heightIs(YF_H(50));
                
            }
        }
    }
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

