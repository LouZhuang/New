//
//  YFTool.h
//  FDBigHealth
//
//  Created by 风鼎-叶烽 on 2018/2/1.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+AES.h"
#import <UIKit/UIKit.h>
#import "YFBaseHeader.h"
#import "YFProgressHUD.h"
#import "Masonry.h"
#import "UIButton+EnlargeEdge.h"
#import "IQKeyboardManager.h"
#import "YFBaseTableView.h"
#import "YFBaseHeader.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "UIView+Banner.h"
#import "SDAutoLayout.h"
#import "UIButton+HQCustomIcon.h"
#import <CommonCrypto/CommonCryptor.h>
#import "GTMBase64.h"
#import "YFSRFManager.h"
@interface YFTool : NSObject


/*
 1.颜色转换
 
 将16进制的色值转换
 
 限制6位
 
 */
+ (UIColor *)YFColorWithString:(NSString *)hexColor;


/**  2.获取当前屏幕显示的viewcontroller  */

+ (UIViewController *)getCurrentVC;



/*
3. tabbar图片关闭图片的自动渲染
 */
+ (UIImage *)TabbarImage:(NSString *)imageStr;


/*
 4.渐变色
 initialColor 起始颜色
 endColor 末尾颜色
 frame  layer坐标
 */
+(CAGradientLayer *)LayerInitialColor:(UIColor *)initialColor LayerEndColor:(UIColor *)endColor LayerFrame:(CGRect)frame;


/*
 5.获取文本宽度
 */
+(CGFloat)LableWidth:(NSString *)content LabelFont:(NSInteger)font Bold:(BOOL)isBold;

/*
 6.获取文本高度
 */
+(CGFloat)lableHeight:(NSString *)content labelFont:(NSInteger)labelF WD:(NSInteger)Width Bold:(BOOL)isBold;


/*
 7 自定义长宽 处理图片
 */
+(UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;

/*
 8 判断空格和空
 */
+(BOOL)isStringNilOrEmpty:(NSString *)str;


/*
 9 银行卡加*
 */
+(NSString *)getNewBankNumWitOldBankNum:(NSString *)bankNum;


/*
 10 输入框默认提示语
 */

+(NSMutableAttributedString *)nsstring:(NSString *)string;

/*
 11 手机号码的正则表达式
 */

+(BOOL)isValidateMobile:(NSString *)mobile;

/*
 12 是否有空格
 */
+(BOOL)AreThereAnySpaceString:(NSString *)string;
/*
 13 密码正则 文字加数字
 */
+(BOOL)judgePassWordLegal:(NSString *)pass;

/*
 14  纯数字
 */
+(BOOL)inputShouldNumber:(NSString *)inputString;

/*
 15 身份证
 */
+(BOOL)IsIdentityCard:(NSString *)IDCardNumber;

/*
 16 拨打电话
 */
+(void)callWebview:(NSString *)phoneString;

/**
 17 searchbar背景图片
 */

+(UIImage*)GetImageWithColor:(UIColor*)color andHeight:(CGFloat)height;

/**
 18 本地存储数据存储
 */
+(void)setObject:(id)Object key:(NSString *)string;

/**  19
 本地存储数据获取字符串类型
 */
+(NSString *)userDefaultsString:(NSString *)key;

/**  20
 本地存储数据获取
 */
+(id)userDefaultsId:(NSString *)key;


/**21
 将字典字符串转换成json字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
/**22
 网络异常提示窗  */
+(void)CreatUIAlertView;
/** 23
 判断状态是否为900000
 */
+(NSInteger)Nsdic:(NSDictionary *)dic;

/** 24
 判断银行卡类型
 */
+(NSString *)addBankcardType:(NSString *)string;
/** 25
 反判断银行卡类型
 */
+(NSString *)BankcardType:(NSString *)string;

/**26
 时间戳转换成自定义时间
 */
+(NSString *)timeWithTimeIntervalString:(NSString *)timeString Format:(NSString *)formatString;
/*
 27 字典转json字符串方法
 */
+(NSString *)convertToJsonData:(NSDictionary *)dict;
/**
 28 时间戳
 */
+(NSString *)getTimeNow;

/**
 29 上传阿里云图片裁剪
 */
+(UIImage *)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;
/**
 30 刺客开始距离结束还剩余时间
 */
+(NSString *)endTime:(NSString *)time;
/**
 31 名字加*
 */
+(NSString *)nameString:(NSString *)name;
/*
 32 解密
 
 */
+(NSString *)safeBase64Str:(NSString *)string;
/** 33 创建二维码图片  */
+ (UIImage *)ErWeiMaImage:(NSString *)imageStr;
/**  34 高清二维码图片  */
+(UIImage *)creatNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat)size;
@end
