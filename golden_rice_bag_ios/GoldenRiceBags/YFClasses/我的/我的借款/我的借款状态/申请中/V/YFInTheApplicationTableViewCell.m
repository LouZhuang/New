//
//  YFInTheApplicationTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFInTheApplicationTableViewCell.h"

#define YFMineTittle @[@"借款流水号",@"借款周期",@"还款方式",@"年化利率",@"借款合同"]

@implementation YFInTheApplicationTableViewCell

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
     [self.contentView sd_addSubviews:@[self.tittleImageView,self.tittleLabel,self.contentLabel,self.toViewButton]];
    
    self.tittleImageView.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(6))
    .heightIs(YF_H(6));
    
    self.tittleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(26))
    .widthIs(YF_W(150))
    .heightIs(YF_H(45));
    
    self.contentLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(270))
    .heightIs(YF_H(45));
    
    self.toViewButton.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(0))
    .widthIs(YF_W(75))
    .heightIs(YF_H(45));
    
}


#pragma mark - lazy

-(UIImageView *)tittleImageView
{
    if (!_tittleImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor=ZHUTICOLOR;
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
        label.textColor =[YFTool YFColorWithString:@"666666"];
        _tittleLabel = label;
    }
    return _tittleLabel;
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

-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textAlignment=NSTextAlignmentRight;
        label.textColor =[YFTool YFColorWithString:@"333333"];
        _contentLabel = label;
    }
    return _contentLabel;
}
-(void)setterIndexRow:(NSInteger)row modelArray:(NSArray *)array
{
    self.tittleLabel.text =[YFMineTittle objectAtIndex:row];
    self.contentLabel.text = [array objectAtIndex:row];
    if (row == 2) {
        if ([[array objectAtIndex:2] integerValue]==1) {
            self.contentLabel.text =@"等额本息";
        }
        if ([[array objectAtIndex:2] integerValue]==2) {
           self.contentLabel.text =@"先息后本";
        }
        if ([[array objectAtIndex:2] integerValue]==3) {
           self.contentLabel.text =@"一次性还本付息";
        }
    }
    
    if (row == 3 ) {
        self.contentLabel.textColor =ZHUTICOLOR;
    }
    if (row == 4 ) {
       self.contentLabel.textColor =ZHUTICOLOR;
        self.toViewButton.hidden = NO;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
