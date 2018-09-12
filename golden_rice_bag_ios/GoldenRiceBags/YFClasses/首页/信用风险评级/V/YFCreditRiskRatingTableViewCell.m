//
//  YFCreditRiskRatingTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/15.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFCreditRiskRatingTableViewCell.h"

@implementation YFCreditRiskRatingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
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
     [self.contentView sd_addSubviews:@[self.tittleLabel,self.selectButton]];
    
    self.tittleLabel.sd_layout
    .topEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(320))
    .heightIs(self.contentView.frame.size.height);
    
    self.selectButton.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, YF_W(14))
    .widthIs(YF_W(16))
    .heightIs(YF_H(16));
    
}

#pragma mark - lazy


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


-(UIButton *)selectButton
{
    if (!_selectButton) {
        UIButton *button =[[UIButton alloc] init];
        button.hidden = YES;
        [button setImage:[UIImage imageNamed:@"selectImage"] forState:UIControlStateNormal];
        _selectButton = button;
    }
    return _selectButton;
}

-(void)setterSelectRow:(NSInteger)selectRow indexPath:(NSInteger)indexPathRow contentArray:(NSArray *)content
{
    self.tittleLabel.text = [content objectAtIndex:indexPathRow];
    self.tittleLabel.numberOfLines=0;
    self.selectButton.hidden = YES;
    if (selectRow ==indexPathRow) {
      self.selectButton.hidden = NO;
        self.tittleLabel.textColor =ZHUTICOLOR;
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
