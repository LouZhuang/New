//
//  YFIWantToInvestTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/21.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFIWantToInvestTableViewCell : YFBaseTableViewCell<UITextFieldDelegate>

/*
tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 content
 */
@property(nonatomic,strong)UILabel *contentLabel;

/*
 imageView
 */
@property(nonatomic,strong)UIImageView *tittleImage;

/*
 rightimageView
 */
@property(nonatomic,strong)UIImageView *rightImageView;

/*
 输入框
 */
@property(nonatomic,strong)UITextField *YFTextField;

-(void)setterIndex:(NSInteger)row investmentMinString:(NSString *)investmentMin buyString:(NSString *)buy RateCouponString:(NSString *)RateCoupon redEnvelopeString:(NSString *)redEnvelope earningsString:(NSString *)earnings buyListString:(NSString *)buyList poundageString:(NSString *)poundage redEnvelopeListString:(NSString *)redEnvelopeList combinedString:(NSString *)combined;


@end
