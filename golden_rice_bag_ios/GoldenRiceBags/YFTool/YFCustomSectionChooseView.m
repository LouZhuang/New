//
//  YFCustomSectionChooseView.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/25.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//
#define CustomSegmentBtnTag 888
#define CustomSegmentLineViewTag 275
#import "YFCustomSectionChooseView.h"
@interface YFCustomSectionChooseView ()

@property (nonatomic, strong) NSArray * titleArray;
@property(nonatomic,strong)UIView *selectView;
@end
@implementation YFCustomSectionChooseView


- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray
{
    if (self = [super initWithFrame:frame]) {
        _titleArray = titleArray;
        if (_titleArray.count <= 0) return self;
        
        self.backgroundColor = WHITECOLOR;
        _normalBackgroundColor = [UIColor whiteColor];
        _selectBackgroundColor = [UIColor whiteColor];
        _titleNormalColor = [UIColor whiteColor];
        _titleSelectColor = [UIColor whiteColor];
        _selectIndex = 0;
        _normalTitleFont =YF_W(12);
        _selectTitleFont = 23.0f;
        
        // 初始化UI界面
        [self setUpSubviews];
    }
    return self;
}

#pragma mark -初始化UI界面

- (void)setUpSubviews
{
    self.clipsToBounds = YES;
    self.layer.borderColor = self.selectBackgroundColor.CGColor;
    CGFloat itemWidth = 0;
    
    for (int i = 0; i < _titleArray.count; i ++) {
       
       
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(itemWidth , 0, [YFTool LableWidth:[_titleArray objectAtIndex:i] LabelFont:YF_W(18) Bold:NO]+YF_W(30), self.frame.size.height);
        button.clipsToBounds = YES;
        button.tag = CustomSegmentBtnTag + i;
        
        
        button.tintColor = [UIColor orangeColor];
        //        [button.layer setMasksToBounds:YES];
        //        [button.layer setCornerRadius:8.0];
        //        [button.layer setBorderWidth:1.0];
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef colorref = CGColorCreate(colorSpace, (CGFloat[]){253/255.0,134/255.0,39/255.0,1});
        [button.layer setBorderColor:colorref];
        
        [self setBtnTitleNormalOrSelectFont:button buttonTitle:_titleArray[i] state:UIControlStateNormal font:_normalTitleFont color:_titleNormalColor];
        [self setBtnTitleNormalOrSelectFont:button buttonTitle:_titleArray[i] state:UIControlStateSelected font:_selectTitleFont color:_titleSelectColor];
        
        [button setBackgroundImage:[self createImageWithColor:_normalBackgroundColor] forState:UIControlStateNormal];
        [button setBackgroundImage:[self createImageWithColor:_normalBackgroundColor] forState:UIControlStateHighlighted];
        [button setBackgroundImage:[self createImageWithColor:_selectBackgroundColor] forState:UIControlStateSelected];
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        [self sendSubviewToBack:button];
        
        if (_selectIndex == i) {
            button.selected = YES;
            button.userInteractionEnabled = NO;
        }
        
        if (i == _titleArray.count - 1) continue;
        itemWidth=itemWidth +[YFTool LableWidth:[_titleArray objectAtIndex:i] LabelFont:YF_W(18) Bold:NO]+YF_W(30);
        
    }
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - YF_H(0.5), WIDTH, YF_H(0.5))];
    bgView.backgroundColor = LIGHTGREYCOLOR;
    [self addSubview:bgView];
    
    _selectView = [[UIView alloc] init];
    _selectView.backgroundColor = ZHUTICOLOR;
    _selectView.frame = CGRectMake(0, self.frame.size.height - YF_H(2), self.frame.size.width / 4, YF_H(2));
    [self nsindex:_selectIndex];
    [self addSubview:_selectView];
    
    
}
-(void)nsindex:(NSInteger)index
{
    
    [UIView animateWithDuration:0.2 animations:^{
        _selectView.frame = CGRectMake(self.frame.size.width / _titleArray.count *index, self.frame.size.height - YF_H(2), self.frame.size.width / _titleArray.count, YF_H(2));
    }];
    
}


#pragma mark -分段按钮点击事件

- (void)buttonClick:(UIButton *)button
{
    if (button.tag - CustomSegmentBtnTag == _selectIndex) return;
    
    UIButton * oldButton = (UIButton *)[self viewWithTag:_selectIndex + CustomSegmentBtnTag];
    if (oldButton) {
        oldButton.selected = NO;
        oldButton.userInteractionEnabled = YES;
    }
    
    button.selected = YES;
    button.userInteractionEnabled = NO;
    
    _selectIndex = button.tag - CustomSegmentBtnTag;
    
    if (_delegate && [_delegate respondsToSelector:@selector(YFCustomSectionSelectIndex:)]) {
        [_delegate YFCustomSectionSelectIndex:_selectIndex];
    }
    
    [self nsindex:_selectIndex];
    
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = cornerRadius;
}
- (void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    self.layer.borderWidth = borderWidth;
}

#pragma mark -设置分段按钮背景颜色

- (void)setNormalBackgroundColor:(UIColor *)normalBackgroundColor
{
    if (normalBackgroundColor == _normalBackgroundColor) return;
    
    _normalBackgroundColor = normalBackgroundColor;
    for (int i = 0; i < self.titleArray.count; i ++) {
        UIButton * button = (UIButton *)[self viewWithTag:CustomSegmentBtnTag + i];
        if (button) {
            [button setBackgroundImage:[self createImageWithColor:normalBackgroundColor] forState:UIControlStateNormal];
            [button setBackgroundImage:[self createImageWithColor:normalBackgroundColor] forState:UIControlStateHighlighted];
        }
    }
}

- (void)setSelectBackgroundColor:(UIColor *)selectBackgroundColor
{
    if (selectBackgroundColor == _selectBackgroundColor) return;
    
    _selectBackgroundColor = selectBackgroundColor;
    for (int i = 0; i < self.titleArray.count; i ++) {
        UIButton * button = (UIButton *)[self viewWithTag:CustomSegmentBtnTag + i];
        if (button) {
            [button setBackgroundImage:[self createImageWithColor:selectBackgroundColor] forState:UIControlStateSelected];
        }
        
        UIView * lineView = [self viewWithTag:CustomSegmentLineViewTag + i];
        if (lineView) {
            lineView.backgroundColor = selectBackgroundColor;
        }
    }
    
    self.layer.borderColor = selectBackgroundColor.CGColor;
}

#pragma mark -设置字体颜色

- (void)setTitleNormalColor:(UIColor *)titleNormalColor
{
    if (titleNormalColor == _titleNormalColor) return;
    
    _titleNormalColor = titleNormalColor;
    for (int i = 0; i < self.titleArray.count; i ++) {
        UIButton * button = (UIButton *)[self viewWithTag:CustomSegmentBtnTag + i];
        if (button) {
            
            [self setBtnTitleNormalOrSelectFont:button buttonTitle:_titleArray[i] state:UIControlStateNormal font:_normalTitleFont color:titleNormalColor];
        }
    }
}

- (void)setTitleSelectColor:(UIColor *)titleSelectColor
{
    if (titleSelectColor == _titleSelectColor) return;
    
    _titleSelectColor = titleSelectColor;
    for (int i = 0; i < self.titleArray.count; i ++) {
        UIButton * button = (UIButton *)[self viewWithTag:CustomSegmentBtnTag + i];
        if (button) {
            
            [self setBtnTitleNormalOrSelectFont:button buttonTitle:_titleArray[i] state:UIControlStateSelected font:_selectTitleFont color:titleSelectColor];
        }
    }
}

#pragma mark -设置字体大小

- (void)setNormalTitleFont:(CGFloat)normalTitleFont
{
    if (normalTitleFont == _normalTitleFont) return;
    
    _normalTitleFont = normalTitleFont;
    for (int i = 0; i < self.titleArray.count; i ++) {
        UIButton * button = (UIButton *)[self viewWithTag:CustomSegmentBtnTag + i];
        if (button) {
            
            [self setBtnTitleNormalOrSelectFont:button buttonTitle:_titleArray[i] state:UIControlStateNormal font:normalTitleFont color:_titleNormalColor];
        }
    }
}
- (void)setSelectTitleFont:(CGFloat)selectTitleFont
{
    if (selectTitleFont == _selectTitleFont) return;
    
    _selectTitleFont = selectTitleFont;
    for (int i = 0; i < self.titleArray.count; i ++) {
        UIButton * button = (UIButton *)[self viewWithTag:CustomSegmentBtnTag + i];
        if (button) {
            
            [self setBtnTitleNormalOrSelectFont:button buttonTitle:_titleArray[i] state:UIControlStateSelected font:selectTitleFont color:_titleSelectColor];
        }
    }
}

- (void)setBtnTitleNormalOrSelectFont:(UIButton *)button buttonTitle:(NSString *)buttonTitle state:(UIControlState)state font:(CGFloat )font color:(UIColor *)color
{
    NSDictionary * dic = @{
                           NSFontAttributeName : [UIFont fontWithName:@"Helvetica" size:font],
                           NSForegroundColorAttributeName : color
                           };
    NSAttributedString * attributedTitle = [[NSAttributedString alloc] initWithString:buttonTitle attributes:dic];
    [button setAttributedTitle:attributedTitle forState:state];
}

#pragma mark -选中的item

- (void)setSelectIndex:(NSInteger)selectIndex
{
    
    if (selectIndex >= _titleArray.count || _selectIndex == selectIndex) {
        
        // 首次进入加载第一个界面通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"CustomABC" object:nil];
        
    };
    
    _selectIndex = selectIndex;
    
    for (int i = 0; i < _titleArray.count; i ++) {
        UIButton * button = (UIButton *)[self viewWithTag:CustomSegmentBtnTag + i];
        if (button) {
            button.selected = selectIndex == i ? YES : NO;
            button.userInteractionEnabled = selectIndex == i ? NO : YES;
        }
    }
    
    
    [self nsindex:_selectIndex];
    
    
    
}

- (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

@end
