//
//  YFBusinessInformationTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBusinessInformationTableViewCell.h"
#define YFMineTittle @[@"上一年度审计报告",@"经营合规重点环节的审计结果",@"上一年度合规性审查报告"]

#define YFMineTittle1 @[@"成功出借人数",@"成功借款人数",@"累计代偿金额",@"累计代偿笔数"]
#define YFMineTittle11 @[@"逾期金额",@"逾期笔数",@"逾期九十天(不含)以上金额",@"逾期九十天(不含)以上笔数"]

#define YFMineContent1 @[@"暂无",@"暂无",@"暂无",@"暂无"]
#define YFMineContent11 @[@"0(元)",@"0(元)",@"0(元)",@"0(元)"]


#define YFMineTittle3 @[@"前十大借款人待还金额占比",@"关联关系借款总余额",@"待还的借款人人数",@"待还的出借人人数"]
#define YFMineTittle33 @[@"最大单一借款人待还金额占比",@"关联关系借款笔数",@"待收的借款人人数",@"待收的出借人人数"]

#define YFMineTittle6 @[@"公司减资，合并，分立，解散或申请破产",@"公司依法进入破产程序",@"公司被责令停业，整顿，关闭",@"公司涉及重大诉讼，仲裁，或涉嫌违法违规被有权机关调查，或收到刑事处罚，重大行政处罚",@"公司法人，实际控制人，主要负责人，高管涉及重大诉讼，仲裁，或涉嫌违法违纪被有权机关调查，或收到刑事处罚，重大行政处罚，或被采取强制措施",@"公司主要或全部业务陷入停顿",@"存在欺诈，损害出借人利益等其他影响网络借贷信息中介机构经营活动的重大事项"]


#define YFMineTittle7 @[@"《中华人民共和国垫资签名法》",@"《最高人民法院关于审理民间借贷案件适...》",@"《中华人民共和国垫资签名法》",@"《中华人民共和国垫资签名法》",@"《中华人民共和国垫资签名法》",@"《中华人民共和国垫资签名法》"]

#define YFMineTittle8 @[@"客服电话:",@"客服邮箱:",@"客服工作时间:"]
#define YFMineTittle88 @[@"400-000-0663",@"service@midai88.com",@"工作日 9:00-18:00"]
#define YFMineTittle888 @[@"咨询客服",@"投诉联系",@"举报联系"]

@implementation YFBusinessInformationTableViewCell

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
   [self.contentView sd_addSubviews:@[self.tittleLabel,self.rightImageView,self.tittleOneLabel,self.tittleTwoLabel,self.tittleThreeLabel,self.tittleFourLabel,self.contentOneLabel,self.contentTwoLabel,self.contentThreeLabel,self.contentFourLabel,self.listOneLabel,self.listTwoLabel]];
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(250))
    .heightIs(YF_H(47));
    
    self.rightImageView.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(5))
    .heightIs(YF_H(9));
    
    
    self.tittleOneLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(0))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH/2 - YF_W(28))
    .heightIs(YF_H(49)/2);
    
    self.tittleTwoLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(0))
    .leftSpaceToView(self.contentView,WIDTH/2+ YF_W(14))
    .widthIs(WIDTH/2 - YF_W(28))
    .heightIs(YF_H(49)/2);
    
    self.contentOneLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(49)/2)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH/2 - YF_W(28))
    .heightIs(YF_H(49)/2);
    
    self.contentTwoLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(49)/2)
    .leftSpaceToView(self.contentView,WIDTH/2+ YF_W(14))
    .widthIs(WIDTH/2 - YF_W(28))
    .heightIs(YF_H(49)/2);
    
    self.tittleThreeLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(11))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH/2 - YF_W(28))
    .heightIs(YF_H(20));
    
    self.tittleFourLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(11))
    .leftSpaceToView(self.contentView,WIDTH/2+ YF_W(14))
    .widthIs(WIDTH/2 - YF_W(28))
    .heightIs(YF_H(20));
    
    self.contentThreeLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(30))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH/2 - YF_W(28))
    .heightIs(YF_H(20));
    
    self.contentFourLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(30))
    .leftSpaceToView(self.contentView,WIDTH/2+ YF_W(14))
    .widthIs(WIDTH/2 - YF_W(28))
    .heightIs(YF_H(20));
    
    self.listOneLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(50))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH/2 - YF_W(28))
    .heightIs(YF_H(20));
    
    self.listTwoLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(50))
    .leftSpaceToView(self.contentView,WIDTH/2+ YF_W(14))
    .widthIs(WIDTH/2 - YF_W(28))
    .heightIs(YF_H(20));
    
    
}


-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF333;
        label.numberOfLines=0;
        label.hidden=YES;
        _tittleLabel = label;
    }
    return _tittleLabel;
}

-(UILabel *)tittleOneLabel
{
    if (!_tittleOneLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF666;
        label.hidden=YES;
        _tittleOneLabel = label;
    }
    return _tittleOneLabel;
}

-(UILabel *)tittleTwoLabel
{
    if (!_tittleTwoLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF666;
        label.hidden=YES;
        _tittleTwoLabel = label;
    }
    return _tittleTwoLabel;
}

-(UILabel *)contentOneLabel
{
    if (!_contentOneLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF000;
        label.hidden=YES;
        _contentOneLabel = label;
    }
    return _contentOneLabel;
}

-(UILabel *)contentTwoLabel
{
    if (!_contentTwoLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF000;
        label.hidden=YES;
        _contentTwoLabel = label;
    }
    return _contentTwoLabel;
}
-(UILabel *)tittleThreeLabel
{
    if (!_tittleThreeLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF000;
        label.hidden=YES;
        _tittleThreeLabel = label;
    }
    return _tittleThreeLabel;
}
-(UILabel *)tittleFourLabel
{
    if (!_tittleFourLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF000;
        label.hidden=YES;
        _tittleFourLabel = label;
    }
    return _tittleFourLabel;
}
-(UILabel *)contentThreeLabel
{
    if (!_contentThreeLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.textColor =[YFTool YFColorWithString:@"f77804"];
        label.hidden=YES;
        _contentThreeLabel = label;
    }
    return _contentThreeLabel;
}
-(UILabel *)contentFourLabel
{
    if (!_contentFourLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.textColor =[YFTool YFColorWithString:@"f77804"];
        label.hidden=YES;
        _contentFourLabel = label;
    }
    return _contentFourLabel;
}
-(UILabel *)listOneLabel
{
    if (!_listOneLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF666;
        label.hidden=YES;
        _listOneLabel = label;
    }
    return _listOneLabel;
}
-(UILabel *)listTwoLabel
{
    if (!_listTwoLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =YF666;
        label.hidden=YES;
        _listTwoLabel = label;
    }
    return _listTwoLabel;
}
-(UIImageView *)rightImageView
{
    if (!_rightImageView) {
        UIImageView *imageView =[[UIImageView alloc] init];
        imageView.image=[UIImage imageNamed:@"rightImage"];
        imageView.hidden=YES;
        _rightImageView = imageView;
    }
    return _rightImageView;
}


-(void)setterIndex:(NSInteger)section
{
    self.tittleLabel.hidden=NO;
    self.tittleLabel.text=[YFMineTittle objectAtIndex:section];
    
    self.rightImageView.hidden=NO;
}

/*
 经营信息
 */
-(void)setterBusinessInformationIndex:(NSInteger)section IndexPath:(NSInteger)row

{
    if (section==0) {
        self.tittleThreeLabel.hidden=NO;
        self.tittleThreeLabel.text=@"累计交易总额";
        
        self.tittleFourLabel.hidden=NO;
        self.tittleFourLabel.text=@"累计交易笔数";
        
        self.contentThreeLabel.hidden=NO;
        self.contentThreeLabel.text=@"99999.00元";
        
        self.contentFourLabel.hidden=NO;
        self.contentFourLabel.text=@"99999.00元";
        
        self.listOneLabel.hidden=NO;
        self.listOneLabel.text=@"公司成立以来的累计交易金额";
        
        self.listTwoLabel.hidden=NO;
        self.listTwoLabel.text=@"公司成立以来的累计交易笔数";
    
        
    }
    if (section==1) {
        self.tittleOneLabel.hidden=NO;
        self.tittleOneLabel.text=[YFMineTittle1 objectAtIndex:row];
        
        self.tittleTwoLabel.hidden=NO;
        self.tittleTwoLabel.text=[YFMineTittle11 objectAtIndex:row];
        
        self.contentOneLabel.hidden=NO;
        self.contentOneLabel.text=[YFMineContent1 objectAtIndex:row];
        
        self.contentTwoLabel.hidden=NO;
        self.contentTwoLabel.text=[YFMineContent11 objectAtIndex:row];
    }
    if (section==2) {
        self.tittleThreeLabel.hidden=NO;
        self.tittleThreeLabel.text=@"借贷总余额";
        
        self.tittleFourLabel.hidden=NO;
        self.tittleFourLabel.text=@"借贷总笔数";
        
        self.contentThreeLabel.hidden=NO;
        self.contentThreeLabel.text=@"99999.00元";
        
        self.contentFourLabel.hidden=NO;
        self.contentFourLabel.text=@"99999.00元";
        
        self.listOneLabel.hidden=NO;
        self.listOneLabel.text=@"指仍在借的借款总余额";
        
        self.listTwoLabel.hidden=NO;
        self.listTwoLabel.text=@"指仍在借的借款笔数";
    }
    if (section==3) {
        self.tittleOneLabel.hidden=NO;
        self.tittleOneLabel.text=[YFMineTittle3 objectAtIndex:row];
        
        self.tittleTwoLabel.hidden=NO;
        self.tittleTwoLabel.text=[YFMineTittle33 objectAtIndex:row];
        
        self.contentOneLabel.hidden=NO;
        self.contentOneLabel.text=[YFMineContent1 objectAtIndex:row];
        
        self.contentTwoLabel.hidden=NO;
        self.contentTwoLabel.text=[YFMineContent11 objectAtIndex:row];
    }
    
    
    if (section>3) {
        self.tittleLabel.hidden=NO;
        self.tittleLabel.text=@"2017年第X季度金米袋运营报告";
        
        self.rightImageView.hidden=NO;
    }
}

/*
 重大事项
 */
-(void)setterImportantMattersIndex:(NSInteger)section
{
    self.tittleLabel.hidden=NO;
    self.tittleLabel.text=[YFMineTittle6 objectAtIndex:section];
    self.tittleLabel.sd_resetLayout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(310)- YF_W(28))
    .heightRatioToView(self.contentView, 1.0);
    
    self.tittleOneLabel.sd_resetLayout
    .topSpaceToView(self.contentView, YF_H(0))
    .rightSpaceToView(self.contentView, YF_W(0))
    .widthIs( YF_W(65))
    .heightRatioToView(self.contentView, 1.0);
    self.tittleOneLabel.hidden=NO;
    self.tittleOneLabel.textAlignment=NSTextAlignmentCenter;
    self.tittleOneLabel.text=@"无";
}
/*
 法律法规
 */
-(void)setterLawsAndRegulationsIndex:(NSInteger)section

{
    self.tittleLabel.hidden=NO;
    self.tittleLabel.text=[YFMineTittle7 objectAtIndex:section];
    self.tittleLabel.numberOfLines=1;
    self.rightImageView.hidden=NO;
}
/*
 消费者咨询及投诉渠道
 */
-(void)setterConsultingTheComplaintIndex:(NSInteger)section indexPath:(NSInteger)row
{
    if (row==0) {

    self.tittleLabel.hidden=NO;
    self.tittleLabel.text=[YFMineTittle888 objectAtIndex:section];
    self.tittleLabel.textColor=ZHUTICOLOR;
    self.tittleLabel.font=YF_FONT(14);
    self.tittleLabel.sd_resetLayout
    .topSpaceToView(self.contentView, 0)
    .leftSpaceToView(self.contentView, YF_W(33))
    .widthIs(YF_W(200))
    .heightIs(YF_H(40));
    }
    
    
    self.tittleOneLabel.hidden=NO;
    self.tittleOneLabel.text=[YFMineTittle8 objectAtIndex:row];
    self.tittleOneLabel.sd_resetLayout
    .bottomSpaceToView(self.contentView, 0)
    .leftSpaceToView(self.contentView, YF_W(33))
    .widthIs(YF_W(200))
    .heightIs(YF_H(35));
    
    self.tittleTwoLabel.sd_resetLayout
    .bottomSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(200))
    .heightIs(YF_H(35));
    self.tittleTwoLabel.hidden=NO;
    self.tittleTwoLabel.textAlignment=NSTextAlignmentRight;
    self.tittleTwoLabel.text=[YFMineTittle88 objectAtIndex:row];;
    
}
/*
 去年公示
 */
-(void)setterLastYearThePublicIndex:(NSInteger)section
{
    self.tittleLabel.hidden=NO;
    self.tittleLabel.text=@"2017年度金米袋理财审计报告";
    
    self.rightImageView.hidden=NO;
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
