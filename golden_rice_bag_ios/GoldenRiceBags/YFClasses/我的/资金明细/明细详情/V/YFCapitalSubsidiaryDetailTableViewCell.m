//
//  YFCapitalSubsidiaryDetailTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/24.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFCapitalSubsidiaryDetailTableViewCell.h"

@implementation YFCapitalSubsidiaryDetailTableViewCell

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
    [self.contentView sd_addSubviews:@[self.totalLabel,self.totalNumberLabel,self.tittleImageView,self.tittleLabel,self.contentLabel]];
    
    self.totalLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(15))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(20));
    
    self.totalNumberLabel.sd_layout
    .topSpaceToView(self.contentView, YF_H(37))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(28));
    
    
    self.tittleImageView.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(6))
    .heightIs(YF_H(6));
    
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(26))
    .widthIs(YF_W(WIDTH - 52))
    .heightIs(YF_H(80));
    
    self.contentLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(250))
    .heightIs(YF_H(20));
    

    
}


#pragma mark - lazy


-(UILabel *)totalLabel
{
    if (!_totalLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.hidden=YES;
        label.textColor =[YFTool YFColorWithString:@"999999"];
        label.text =@"投资成功";
        _totalLabel = label;
    }
    return _totalLabel;
}


-(UILabel *)totalNumberLabel
{
    if (!_totalNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.hidden=YES;
        label.textColor =ZHUTICOLOR;
        label.text =@"";
        _totalNumberLabel = label;
    }
    return _totalNumberLabel;
}


-(UIImageView *)tittleImageView
{
    if (!_tittleImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor=ZHUTICOLOR;
        imageView.hidden=YES;
        imageView.layer.cornerRadius=YF_W(6)/2;
        imageView.layer.masksToBounds=YES;
        imageView.userInteractionEnabled =YES;
        _tittleImageView = imageView;
    }
    return _tittleImageView;
}


-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.hidden=YES;
        label.textColor =[YFTool YFColorWithString:@"666666"];
        label.numberOfLines = 0;
       
        _tittleLabel = label;
        
    }
    return _tittleLabel;
}



-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.hidden=YES;
        label.textAlignment=NSTextAlignmentRight;
        label.textColor =[YFTool YFColorWithString:@"333333"];
        _contentLabel = label;
    }
    return _contentLabel;
}


-(void)setterIndexRow:(NSInteger)row indexSection:(NSInteger)section totalString:(NSString *)total tittleString:(NSString *)tittle contentString:(NSString *)content models:(YFCapitalSubsidiaryModel *)model

{
    
    if (section==0) {
        self.totalLabel.hidden=NO;
         self.totalLabel.text=total;
         self.totalNumberLabel.hidden=NO;
        self.totalNumberLabel.text=model.changeValue;
        
    }
    if (section==1) {
        self.tittleImageView.hidden=NO;
        self.tittleLabel.hidden=NO;
         self.tittleLabel.text=tittle;
        
        self.contentLabel.hidden=NO;
        self.contentLabel.text=content;
        
        if (row==3) {
            self.contentLabel.textColor=ZHUTICOLOR;
        }
        
    }
    
     if (section==2) {
         
//         NSArray *array=@[@"投资份额",@"手续费",@"红包"];
//         NSArray *arrayB=@[@"50,000.00元",@"1,100.00元",@"-100.00元"];
         self.contentView.backgroundColor=LIGHTGREYCOLOR;
         self.tittleLabel.hidden=NO;
         self.tittleLabel.font=YF_FONT(12);
         self.tittleLabel.text=  model.content;//[array objectAtIndex:row];
         [self.tittleLabel sizeToFit];
//         self.contentLabel.hidden=NO;
//         self.contentLabel.font=YF_FONT(12);
//         self.contentLabel.text=[arrayB objectAtIndex:row];
//         self.contentLabel.textColor=ZHUTICOLOR;
         
     }
    
    
   
   
    
    
    
}


-(void)setterTwoIndexRow:(NSInteger)row indexSection:(NSInteger)section totalString:(NSString *)total tittleString:(NSString *)tittle contentString:(NSString *)content models:(YFCapitalSubsidiaryModel *)model

{
    
    if (section==0) {
        self.totalLabel.hidden=NO;
        self.totalLabel.text=total;
        self.totalNumberLabel.hidden=NO;
         self.totalNumberLabel.text=model.changeValue;
    }
    if (section==1) {
        self.tittleImageView.hidden=NO;
        self.tittleLabel.hidden=NO;
        self.tittleLabel.text=tittle;
        
        self.contentLabel.hidden=NO;
        self.contentLabel.text=content;
        
        if (row==2) {
            self.contentLabel.textColor=ZHUTICOLOR;
        }
        
    }
    
    if (section==2) {
        
//        NSArray *array=@[@"投资份额",@"手续费",@"红包"];
//        NSArray *arrayB=@[@"50,000.00元",@"1,100.00元",@"-100.00元"];
        self.contentView.backgroundColor=LIGHTGREYCOLOR;
        self.tittleLabel.hidden=NO;
        self.tittleLabel.font=YF_FONT(14);
        self.tittleLabel.text=  model.content;//[array objectAtIndex:row];
        [self.tittleLabel sizeToFit];
        
//        self.contentLabel.hidden=NO;
//        self.contentLabel.font=YF_FONT(12);
//        self.contentLabel.text=[arrayB objectAtIndex:row];
//        self.contentLabel.textColor=ZHUTICOLOR;
        
    }
    
    
    
    
    
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
