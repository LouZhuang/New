//
//  YFInformationDisclosureTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/19.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFInformationDisclosureTableViewCell.h"
#define YFMineTittle1 @[@"公司全称:",@"公司简称:",@"统一社会信用代码:",@"注册资本:",@"实缴注册资本:",@"公司注册地址:",@"公司经营地址:",@"公司成立时间:",@"公司经营期限:",@"公司经营状态:",@"公司法定代表人:",@"实际控制人:",@"执行董事:",@"监事:",@"总经理:",@"风控负责人:",@"法律合规负责人:",@"稽合审核负责人:",@"公司经营范围:金融信息服务(除金融业务)，商务信息咨询，企业管理咨询，投资咨询（以上咨询均除经纪），资产管理（除金融业务），投资管理，电子商务（不得充实增值电信，金融业务），计算机软件开发。【依法须经批准的项目，经相关部门批准后方可展开经营活动】"]
#define YFMineTittle11 @[@"xxxxxxxxxxxx",@"xxxxxxxxxxxx",@"xxxxxxxxxxxx",@"xxxxxxxxxxxx",@"xxxxxxxxxxxx",@"xxxxxxxxxxxx",@"xxxxxxxxxxxx",@"xxxxxxxxxxxx",@"xxxxxxxxxxxx",@"xxxxxxxxxxxx",@"xxxxxxxxxxxx",@"xxxxxxxxxxxx",@"xxxxxxxxxxxx",@"xxxxxxxxxxxx",@"xxxxxxxxxxxx",@"xxxxxxxxxxxx",@"xxxxxxxxxxxx",@"xxxxxxxxxxxx",@""]

#define YFMineTittle2 @[@"股东名称:",@"股东占股比例:"]
#define YFMineTittle22 @[@"股东名称xxx",@"100%"]

#define YFMineTittle3 @[@"分支机构全称:",@"所在地:",@"成立时间:",@"负责人:",@"联系电话:",@"投诉电话:",@"员工人数:"]
#define YFMineTittle33 @[@"xxxxxxx",@"xxxxxxx",@"xxxxxxx",@"xxxxxxx",@"xxxxxxx",@"xxxxxxx",@"xxxxxxx"]


#define YFMineTittle4 @[@"官方网站:",@"APP:",@"微信公众号:",@"微博账号:",@"微博IP地址:"]
#define YFMineTittle44 @[@"xxxxxxx",@"xxxxxxx",@"xxxxxxx",@"xxxxxxx",@"http//:weibo.com"]

#define YFMineTittle5 @[@"金融监管部门:",@"备案登记时间:",@"备案登记编号:",@"电信业务经营许可信息:",@"资金存管信息:",@"网站备案编号:"]
#define YFMineTittle55 @[@"xxxxxxx",@"xxxxxxx",@"xxxxxxx",@"xxxxxxx",@"xxxxxxxx",@"xxxxxxxx"]
@implementation YFInformationDisclosureTableViewCell

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
     [self.contentView sd_addSubviews:@[self.tittleLabel,self.contentLabel,self.theTitleLabel,self.showImageView,self.instructionsLabel]];
    
    
    self.theTitleLabel.sd_layout
    .topEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH -YF_W(28))
    .heightIs(YF_H(40));
    
    self.tittleLabel.sd_layout
    .bottomEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH -YF_W(28))
    .heightIs(YF_H(36));
    
    self.contentLabel.sd_layout
    .bottomEqualToView(self.contentView)
    .heightIs(YF_H(36))
    .widthIs(WIDTH -YF_W(28))
    .rightSpaceToView(self.contentView, YF_W(14));
    
    self.showImageView.sd_layout
    .topSpaceToView(self.contentView, YF_H(76))
    .heightIs(YF_H(373))
    .widthIs(YF_W(244))
    .rightSpaceToView(self.contentView, (WIDTH -YF_W(244))/2);
    
    self.instructionsLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(160))
    .heightIs(YF_H(80))
    .widthIs(WIDTH - YF_W(127))
    .leftSpaceToView(self.contentView, YF_W(72));
    
}

-(UILabel *)theTitleLabel
{
    if (!_theTitleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textColor =[YFTool YFColorWithString:@"d16202"];
        label.text =@"";
         label.hidden=YES;
        label.numberOfLines=0;
        _theTitleLabel = label;
    }
    return _theTitleLabel;
}


-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(13);
        label.textColor =YF000;
        label.text =@"";
        label.hidden=YES;
        label.numberOfLines=0;
        _tittleLabel = label;
    }
    return _tittleLabel;
}

-(UILabel *)instructionsLabel
{
    if (!_instructionsLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(13);
        label.textColor =YF666;
        label.text =@"";
        label.hidden=YES;
        label.numberOfLines=0;
        _instructionsLabel = label;
    }
    return _instructionsLabel;
}

-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(13);
        label.textColor =YF666;
        label.hidden=YES;
        label.textAlignment=NSTextAlignmentRight;
        label.text =@"";
        _contentLabel = label;
    }
    return _contentLabel;
}

-(UIImageView *)showImageView
{
    if (!_showImageView) {
        UIImageView *imageView=[[UIImageView alloc] init];
        imageView.image=[UIImage imageNamed:@"zzjgImage"];
        imageView.hidden=YES;
        _showImageView = imageView;
    }
    return _showImageView;
}


-(void)setterIndex:(NSInteger)section IndexPath:(NSInteger)row
{
    if (section==0) {
        self.tittleLabel.hidden=NO;
        self.tittleLabel.sd_resetLayout
        .topEqualToView(self.contentView)
        .leftSpaceToView(self.contentView, YF_W(14))
        .widthIs(WIDTH -YF_W(28))
        .heightIs(YF_H(76));
        self.tittleLabel.text=@"信息依据银监会及互金协会要求进行披露,并经法人签字确认,保证披露的信息真实，准确，完整，及时。查看详情";
    }
     if (section==1) {
        
         if (row==0) {
             self.theTitleLabel.hidden=NO;
             self.theTitleLabel.text=@"工商信息";
         }
         
        self.tittleLabel.hidden=NO;
         self.tittleLabel.text=[YFMineTittle1 objectAtIndex:row];
         if (row==18) {
             self.tittleLabel.sd_resetLayout
             .topEqualToView(self.contentView)
             .leftSpaceToView(self.contentView, YF_W(14))
             .widthIs(WIDTH -YF_W(28))
             .heightIs(YF_H(132));
         }
         
         self.contentLabel.hidden=NO;
         self.contentLabel.text=[YFMineTittle11 objectAtIndex:row];
         
     }
    if (section==2) {
        
        if (row==0) {
            self.theTitleLabel.hidden=NO;
            self.theTitleLabel.text=@"股东信息";
        }
        
        self.tittleLabel.hidden=NO;
        self.tittleLabel.text=[YFMineTittle2 objectAtIndex:row];
        
        self.contentLabel.hidden=NO;
        self.contentLabel.text=[YFMineTittle22 objectAtIndex:row];
        
    }
    if (section==3) {
        
        if (row==0) {
            self.theTitleLabel.hidden=NO;
            self.theTitleLabel.text=@"分支机构信息";
        }
        
        self.tittleLabel.hidden=NO;
        self.tittleLabel.text=[YFMineTittle3 objectAtIndex:row];
        
        self.contentLabel.hidden=NO;
        self.contentLabel.text=[YFMineTittle33 objectAtIndex:row];
        
    }
    
    if (section==4) {
        
        if (row==0) {
            self.theTitleLabel.hidden=NO;
            self.theTitleLabel.text=@"官方网站,手机应用及其他互联网渠道信息";
        }
        
        self.tittleLabel.hidden=NO;
        self.tittleLabel.text=[YFMineTittle4 objectAtIndex:row];
        
        self.contentLabel.hidden=NO;
        self.contentLabel.text=[YFMineTittle44 objectAtIndex:row];
        
        
        
    }
     if (section==5) {
         if (row==0) {
         self.theTitleLabel.hidden=NO;
         self.theTitleLabel.text=@"组织架构及从业人员概况";
         
         self.tittleLabel.sd_resetLayout
         .topSpaceToView(self.contentView, YF_H(40))
         .leftSpaceToView(self.contentView, YF_W(14))
         .widthIs(WIDTH -YF_W(28))
         .heightIs(YF_H(36));
          self.tittleLabel.hidden=NO;
         self.tittleLabel.text=@"组织架构";
         
         self.showImageView.hidden=NO;
         }
         
         if (row==1) {
             self.tittleLabel.sd_resetLayout
             .topSpaceToView(self.contentView, YF_H(0))
             .leftSpaceToView(self.contentView, YF_W(14))
             .widthIs(WIDTH -YF_W(28))
             .heightIs(YF_H(36));
             self.tittleLabel.hidden=NO;
             self.tittleLabel.text=@"从业人员概况";
             
             self.showImageView.hidden=NO;
             self.showImageView.image=[UIImage imageNamed:@"chartImage0"];
             self.showImageView.sd_resetLayout
             .topSpaceToView(self.contentView, YF_H(36))
             .heightIs(YF_H(96))
             .widthIs(YF_W(210))
             .rightSpaceToView(self.contentView, (WIDTH -YF_W(210))/2);
             
             
             self.contentLabel.sd_resetLayout
             .topSpaceToView(self.contentView, YF_H(142))
             .heightIs(YF_H(20))
             .widthIs(YF_W(200))
             .leftSpaceToView(self.contentView, YF_W(72));
             
             self.contentLabel.textAlignment=NSTextAlignmentLeft;
             self.contentLabel.hidden=NO;
             self.contentLabel.textColor=YF000;
             self.contentLabel.font=YF_FONT(17);
             self.contentLabel.text=@"员工学历占比图";
             
             self.instructionsLabel.hidden=NO;
              self.instructionsLabel.text=@"截止2018年XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
             
         }
         if (row==2) {

             
             self.showImageView.hidden=NO;
             self.showImageView.image=[UIImage imageNamed:@"chartImage1"];
             self.showImageView.sd_resetLayout
             .topSpaceToView(self.contentView, YF_H(36))
             .heightIs(YF_H(96))
             .widthIs(YF_W(210))
             .rightSpaceToView(self.contentView, (WIDTH -YF_W(210))/2);
             
             self.contentLabel.sd_resetLayout
             .topSpaceToView(self.contentView, YF_H(142))
             .heightIs(YF_H(20))
             .widthIs(YF_W(200))
             .leftSpaceToView(self.contentView, YF_W(72));
             
             self.contentLabel.textAlignment=NSTextAlignmentLeft;
             self.contentLabel.hidden=NO;
             self.contentLabel.textColor=YF000;
             self.contentLabel.font=YF_FONT(17);
             self.contentLabel.text=@"员工年龄占比图";
             
             self.instructionsLabel.hidden=NO;
             self.instructionsLabel.text=@"截止2018年XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
             
         }
         
         if (row==3) {

             
             self.showImageView.hidden=NO;
             self.showImageView.image=[UIImage imageNamed:@"chartImage2"];
             self.showImageView.sd_resetLayout
             .topSpaceToView(self.contentView, YF_H(36))
             .heightIs(YF_H(96))
             .widthIs(YF_W(210))
             .rightSpaceToView(self.contentView, (WIDTH -YF_W(210))/2);
             
             self.contentLabel.sd_resetLayout
             .topSpaceToView(self.contentView, YF_H(142))
             .heightIs(YF_H(20))
             .widthIs(YF_W(200))
             .leftSpaceToView(self.contentView, YF_W(72));
             
             self.contentLabel.textAlignment=NSTextAlignmentLeft;
             self.contentLabel.hidden=NO;
             self.contentLabel.textColor=YF000;
             self.contentLabel.font=YF_FONT(17);
             self.contentLabel.text=@"员工性质占比图";
             
             self.instructionsLabel.hidden=NO;
             self.instructionsLabel.text=@"截止2018年XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
             
         }
     }
    
    
}

/*
 备案信息
 */
-(void)setterYFForTheRecordInformationIndex:(NSInteger)section IndexPath:(NSInteger)row
{
    if (section==0) {
        
        if (row==0) {
            self.theTitleLabel.hidden=NO;
            self.theTitleLabel.text=@"备案信息";
        }
        
        self.tittleLabel.hidden=NO;
        self.tittleLabel.text=[YFMineTittle5 objectAtIndex:row];
        
        self.contentLabel.hidden=NO;
        self.contentLabel.text=[YFMineTittle55 objectAtIndex:row];
        
    }
    if (section==1) {
        
        if (row==0) {
            self.tittleLabel.sd_resetLayout
            .topSpaceToView(self.contentView, YF_H(40))
            .leftSpaceToView(self.contentView, YF_W(14))
            .widthIs(WIDTH -YF_W(28))
            .heightIs(YF_H(36));
            
            self.theTitleLabel.hidden=NO;
            self.theTitleLabel.text=@"备案信息";
            self.tittleLabel.hidden=NO;
            self.tittleLabel.text=@"风险管理架构";
            
            self.showImageView.hidden=NO;
            self.showImageView.image=[UIImage imageNamed:@"fxgljgImage0"];
            self.showImageView.sd_resetLayout
            .topSpaceToView(self.contentView, YF_H(76))
            .heightIs(YF_H(195))
            .widthIs(YF_W(228))
            .rightSpaceToView(self.contentView, (WIDTH -YF_W(228))/2);
            
            self.instructionsLabel.sd_resetLayout
            .topSpaceToView(self.contentView, YF_H(290))
            .heightIs(YF_H(80))
            .widthIs(WIDTH - YF_W(28))
            .leftSpaceToView(self.contentView, YF_W(14));
            self.instructionsLabel.hidden=NO;
            self.instructionsLabel.text=@"1.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n2.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
          
        }
        if (row==1) {
            self.tittleLabel.sd_resetLayout
            .topSpaceToView(self.contentView, YF_H(0))
            .leftSpaceToView(self.contentView, YF_W(14))
            .widthIs(WIDTH -YF_W(28))
            .heightIs(YF_H(36));

            self.tittleLabel.hidden=NO;
            self.tittleLabel.text=@"风险评估流程";
            
            self.showImageView.hidden=NO;
            self.showImageView.image=[UIImage imageNamed:@"fxgljgImage1"];
            self.showImageView.sd_resetLayout
            .topSpaceToView(self.contentView, YF_H(36))
            .heightIs(YF_H(425))
            .widthIs(YF_W(173))
            .rightSpaceToView(self.contentView, (WIDTH -YF_W(173))/2);
            
 
            
        }
        
        if (row==2) {
            self.tittleLabel.sd_resetLayout
            .topSpaceToView(self.contentView, YF_H(0))
            .leftSpaceToView(self.contentView, YF_W(14))
            .widthIs(WIDTH -YF_W(28))
            .heightIs(YF_H(36));
            
            self.tittleLabel.hidden=NO;
            self.tittleLabel.text=@"风险预警管理情况";
            
            for (NSInteger i = 0; i < 3; i ++) {
                
                
                UILabel *label =[[UILabel alloc] initWithFrame:CGRectMake(YF_W(21), YF_H(36)+i *YF_H(100)+YF_H(35), YF_W(2), YF_H(30))];
                label.backgroundColor=[YFTool YFColorWithString:@"feba4d"];
                [self.contentView addSubview:label];
                
                
                UILabel *tittlelabel =[[UILabel alloc] initWithFrame:CGRectMake(YF_W(27), YF_H(36)+i *YF_H(100), YF_W(247), YF_H(100))];
                tittlelabel.font = YF_FONT(13);
                tittlelabel.textColor =YF000;
                tittlelabel.numberOfLines=0;
                if (i==0) {
                    tittlelabel.text =@"实时的\n风险监测";
                }
                if (i==1) {
                    tittlelabel.text =@"完善的\n风险评估";
                }
                if (i==2) {
                    tittlelabel.text =@"灵活的\n预警处理";
                }
                
                [self.contentView addSubview:tittlelabel];
               
                
                UILabel *contetlabel =[[UILabel alloc] initWithFrame:CGRectMake(YF_W(108), YF_H(36)+i *YF_H(100), YF_W(247), YF_H(100))];
                contetlabel.font = YF_FONT(13);
                contetlabel.textColor =YF666;
                contetlabel.numberOfLines=0;
                if (i==0) {
                 contetlabel.text =@"实时监听业务系统获取数据，通过多种技术手段和处理获得的交易信息，实现事中监督保证平台信息安全。";
                }
                if (i==1) {
                    contetlabel.text =@"对接公安部，银联查验接口，验证用户姓名，身份证，手机号及银行卡号信息的准确性，防范资料冒用，伪冒申请等欺诈风险。";
                }
                if (i==2) {
                    contetlabel.text =@"根据系统监控，实时调整用户风险等级及处理策略，迅速采取措施防范可能出现的风险事件。";
                }
                
                [self.contentView addSubview:contetlabel];
                
            }
            
            
    
            
        }
        if (row==3) {
            self.tittleLabel.sd_resetLayout
            .topSpaceToView(self.contentView, YF_H(0))
            .leftSpaceToView(self.contentView, YF_W(14))
            .widthIs(WIDTH -YF_W(28))
            .heightIs(YF_H(36));
            
            self.tittleLabel.hidden=NO;
            self.tittleLabel.text=@"催收方式";
            
            self.showImageView.hidden=NO;
            self.showImageView.image=[UIImage imageNamed:@"fxgljgImage2"];
            self.showImageView.sd_resetLayout
            .topSpaceToView(self.contentView, YF_H(36))
            .heightIs(YF_H(221))
            .widthIs(YF_W(245))
            .rightSpaceToView(self.contentView, (WIDTH -YF_W(245))/2);
            
            
        }
        
       
        
    }
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
