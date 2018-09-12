//
//  YFBaseTableViewCell.m
//  FDBigHealth
//
//  Created by 风鼎-叶烽 on 2018/2/2.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@implementation YFBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    for (UIView *view in self.subviews) {
//        if ([view isKindOfClass:[UIScrollView class]]) {
//            ((UIScrollView *)view).delaysContentTouches = NO;//
//            break;
//        }
//    }
//    self.selectionStyle = UITableViewCellSelectionStyleNone;//选择时不变色
//    self.backgroundView.backgroundColor = [UIColor clearColor];
//    self.contentView.backgroundColor = [UIColor clearColor];
//    self.backgroundColor = [UIColor clearColor];
    return  self;
}

@end
