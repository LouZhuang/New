//
//  YFTool.m
//  FDBigHealth
//
//  Created by 风鼎-叶烽 on 2018/2/1.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFTool.h"



@implementation YFTool


/*
 1.颜色转换
 
 将16进制的色值转换
 
 限制6位
 
 */
+ (UIColor *)YFColorWithString:(NSString *)hexColor
{
    NSAssert(hexColor.length == 6, @"参数 hexColor 长度必须等于6");
    
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:1.0f];
}



/*  2.获取当前屏幕显示的viewcontroller  */

+ (UIViewController *)getCurrentVC
{
    UIViewController * currVC = nil;
    UIViewController * Rootvc = [UIApplication sharedApplication].keyWindow.rootViewController ;
    do {
        if ([Rootvc isKindOfClass:[UINavigationController class]]) {
            UINavigationController * nav = (UINavigationController *)Rootvc;
            UIViewController * v = [nav.viewControllers lastObject];
            currVC = v;
            Rootvc = v.presentedViewController;
            continue;
        }else if([Rootvc isKindOfClass:[UITabBarController class]]){
            UITabBarController * tabVC = (UITabBarController *)Rootvc;
            currVC = tabVC;
            Rootvc = [tabVC.viewControllers objectAtIndex:tabVC.selectedIndex];
            continue;
        }else {
            if ([Rootvc respondsToSelector:@selector(centerViewController)]) {
                UITabBarController *tabVC = [ Rootvc performSelector:@selector(centerViewController)];
                currVC = tabVC;
                Rootvc = [tabVC.viewControllers objectAtIndex:tabVC.selectedIndex];
                continue;
            }
            
        }
    } while (Rootvc!=nil);
    
    return currVC;
    
}


/*
 3.tabbar图片关闭图片的自动渲染
 */
+ (UIImage *)TabbarImage:(NSString *)imageStr
{
    UIImage *selectIMG = [UIImage imageNamed:imageStr];
    return [selectIMG imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
}



/*
 4.渐变色
 initialColor 起始颜色
 endColor 末尾颜色
 frame  layer坐标
 */
+(CAGradientLayer *)LayerInitialColor:(UIColor *)initialColor LayerEndColor:(UIColor *)endColor LayerFrame:(CGRect)frame
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)initialColor.CGColor, (__bridge id)endColor.CGColor, (__bridge id)[UIColor blueColor].CGColor];
    gradientLayer.locations = @[@0.0, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame =frame;
    
    return gradientLayer;
}


/*
 5.获取文本宽度
 */
+(CGFloat)LableWidth:(NSString *)content LabelFont:(NSInteger)font Bold:(BOOL)isBold
{
    if (isBold == NO) {
        /**  不加粗  */
        CGRect frame = [content boundingRectWithSize:CGSizeMake(999999999, 1000000)options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:font]} context:nil];
        return frame.size.width;
    }
    else{
        /**  加粗  */
        CGRect frame = [content boundingRectWithSize:CGSizeMake(WIDTH, 1000)options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:font]} context:nil];
        return frame.size.width;
    }
}

/*
 6.获取文本高度
 */
+(CGFloat)lableHeight:(NSString *)content labelFont:(NSInteger)labelF WD:(NSInteger)Width Bold:(BOOL)isBold
{
    if (isBold == NO) {
        /**  不加粗  */
        CGSize frame = [content boundingRectWithSize:CGSizeMake(Width, MAXFLOAT)options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:labelF]} context:nil].size;
        
        
        return frame.height;
    }
    else{
        /**  加粗  */
        CGSize frame = [content boundingRectWithSize:CGSizeMake(Width, MAXFLOAT)options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:labelF]} context:nil].size;
        return frame.height;
    }
}


/*
 7 自定义长宽 处理图片
 */
+(UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize
{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return reSizeImage;
    
}


/*
 8 判断空格和空
 */
+(BOOL)isStringNilOrEmpty:(NSString *)str{
    if( (NSNull *)str  == [NSNull null] ||str == nil || [@"" isEqualToString:str]  ){
        
        return YES;
    }
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimedString = [[NSString stringWithFormat:@"%@",str] stringByTrimmingCharactersInSet:set];
    if ([trimedString length] == 0) {//判断是否全为空格
        
        return YES;
    }
    
    return NO;
}




/*
 9 银行卡加*
 */
+(NSString *)getNewBankNumWitOldBankNum:(NSString *)bankNum
{
    NSMutableString *mutableStr;
    if (bankNum.length) {
        mutableStr = [NSMutableString stringWithString:bankNum];
        for (int i = 0 ; i < mutableStr.length; i ++) {
            if (i>3&&i<mutableStr.length - 3) {
                [mutableStr replaceCharactersInRange:NSMakeRange(i, 1) withString:@"*"];
            }
        }
        NSString *text = mutableStr;
        NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789\b"];
        text = [text stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSString *newString = @"";
        while (text.length > 0) {
            NSString *subString = [text substringToIndex:MIN(text.length, 4)];
            newString = [newString stringByAppendingString:subString];
            if (subString.length == 4) {
                newString = [newString stringByAppendingString:@" "];
            }
            text = [text substringFromIndex:MIN(text.length, 4)];
        }
        newString = [newString stringByTrimmingCharactersInSet:[characterSet invertedSet]];
        return newString;
    }
    return bankNum;
}

/*
 10 输入框默认提示语
 */

+(NSMutableAttributedString *)nsstring:(NSString *)string
{
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:string];
    [placeholder addAttribute:NSForegroundColorAttributeName
                        value:[YFTool YFColorWithString:@"999999"]
                        range:NSMakeRange(0, string.length)];
    [placeholder addAttribute:NSFontAttributeName
                        value:[UIFont systemFontOfSize:YF_W(14)]
                        range:NSMakeRange(0, string.length)];
    return placeholder;
}


/*
 11 手机号码的正则表达式
 */

+(BOOL)isValidateMobile:(NSString *)mobile
{
    NSString *phoneNumRegex = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57]|19[0-9]|16[0-9])[0-9]{8}$";;
    NSPredicate *mobileCheck = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneNumRegex];
    return [mobileCheck evaluateWithObject:mobile];
}

/*
 12 是否有空格
 */
+(BOOL)AreThereAnySpaceString:(NSString *)string
{
    NSRange range = [string rangeOfString:@" "];
    if (range.location != NSNotFound) {
        //有空格
        return NO;
    }else {
        //没有空格
        return YES;
    }
}

/*
 13 密码正则 文字加数字
 */
+(BOOL)judgePassWordLegal:(NSString *)pass
{
    BOOL result = false;
    if ([pass length] >= 8 &&[pass length] <= 16){
        // 判断长度大于6位后再接着判断是否同时包含数字和字符
        NSString *regex = @"^(?=.*[a-zA-Z0-9].*)(?=.*[a-zA-Z\\W].*)(?=.*[0-9\\W].*).{8,16}$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        result = [pred evaluateWithObject:pass];
    }
    return result;
}

/*
14  纯数字
 */
+(BOOL)inputShouldNumber:(NSString *)inputString
{
    if (inputString.length == 0) {
        return NO;
    }
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:inputString]) {
        return YES;
    }
    else{
        return NO;
    }
    
    
}
/*
15 身份证
 */
+(BOOL)IsIdentityCard:(NSString *)IDCardNumber
{
    if (IDCardNumber.length <= 0) {
        return NO;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:IDCardNumber];
}

/*
 16 拨打电话
 */
+(void)callWebview:(NSString *)phoneString
{
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",phoneString];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [[YFTool getCurrentVC].view addSubview:callWebview];
    
}


/**
 17 searchbar背景图片
 */

+(UIImage*)GetImageWithColor:(UIColor*)color andHeight:(CGFloat)height
{
    CGRect r= CGRectMake(0.0f, 0.0f, 1.0f, height);
    UIGraphicsBeginImageContext(r.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, r);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}


/**
 18 本地存储数据存储
 */
+(void)setObject:(id)Object key:(NSString *)string
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:Object forKey:string];
}

/**  19
 本地存储数据获取字符串类型
 */
+(NSString *)userDefaultsString:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *string =[NSString stringWithFormat:@"%@",[userDefaults objectForKey:key]];
    
    return string;
}

/**  20
 本地存储数据获取
 */
+(id)userDefaultsId:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    return [userDefaults objectForKey:key];
}

/**21
 将字典字符串转换成json字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
    
}





/**22
 网络异常提示窗  */
+(void)CreatUIAlertView
{
    UIAlertView  *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"网络异常" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alertView show];
}


/** 23
 判断状态是否为900000  */
+(NSInteger)Nsdic:(NSDictionary *)dic
{
    if ([[NSString stringWithFormat:@"%@",[dic objectForKey:@"status"]] isEqualToString:@"900000"]) {
        [YFProgressHUD dismiss];
        return 1;
    }
    else if ([[NSString stringWithFormat:@"%@",[dic objectForKey:@"status"]] isEqualToString:@"999999"])
    {
//        [YFProgressHUD showInfoWithStatus:[dic objectForKey:@"message"]];
        
//        [YFLoginManager showLogViewVC];
        
        return 0;
    }
    else{
        return 2;
    }
    
}

/** 24
 判断银行卡类型
 */
+(NSString *)addBankcardType:(NSString *)string
{
    NSString *type = @"1";
    if ([string isEqualToString:@"借记卡"]) {
        type = @"1";
    }
    if ([string isEqualToString:@"贷记卡"]) {
        type = @"2";
    }
    if ([string isEqualToString:@"准贷记卡"]) {
        type = @"3";
    }
    return type;
}

/** 25
 反判断银行卡类型
 */
+(NSString *)BankcardType:(NSString *)string
{
    NSString *type = @"借记卡";
    if ([string isEqualToString:@"1"]) {
        type = @"借记卡";
    }
    if ([string isEqualToString:@"2"]) {
        type = @"贷记卡";
    }
    if ([string isEqualToString:@"3"]) {
        type = @"准贷记卡";
    }
    return type;
}
/**26
 时间戳转换成自定义时间
 */
+(NSString *)timeWithTimeIntervalString:(NSString *)timeString Format:(NSString *)formatString
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    //    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:formatString];
    //    例如:[formatter setDateFormat:@"yyyy年MM月dd日"];
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}



/*
 27 字典转json字符串方法
 */

+(NSString *)convertToJsonData:(NSDictionary *)dict
{
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}

/**
 28 时间戳
 */
+(NSString *)getTimeNow
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSS"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]*1000];
    
    return timeSp;
    

}
/**
 29 上传阿里云图片裁剪
 */
+(UIImage *)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
/**
 30 刺客开始距离结束还剩余时间
 */
+(NSString *)endTime:(NSString *)time
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    // 结束时间
    
    NSString *endDateStr = time;
    
    
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    unsigned int unitFlags =NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDate *nowDate = [NSDate date];
    
    NSDate *endDate = [dateFormatter dateFromString:endDateStr];
    
    
    
    NSDateComponents *comps = [calendar components:unitFlags fromDate:nowDate toDate:endDate options:0];
    
    return [NSString stringWithFormat:@"%ld天%ld时%ld分%ld秒",comps.day,comps.hour,comps.minute,comps.second];
    
}
/**
 31 名字加*
 */
+(NSString *)nameString:(NSString *)name
{
    if (name.length==1) {
        return name;
    }
    if (name.length==2) {
        NSString*bStr = [name substringWithRange:NSMakeRange(0,1)];
        return [NSString stringWithFormat:@"%@*",bStr];
    }
   else if (name.length >2) {
       NSString*aStr = [name substringWithRange:NSMakeRange(0,1)];
       NSString*bStr=@"*";
       for (NSInteger i = 0; i <name.length-1 ; i++) {
           if (i>0) {
               bStr=[NSString stringWithFormat:@"%@*",bStr];
           }
           
       }
       NSString*cStr =[NSString stringWithFormat:@"%@%@",aStr,bStr];
        return cStr;
    }
   else{
       return @"";
   }
}

/*
 32 解密

 */
+(NSString *)safeBase64Str:(NSString *)string
{
    NSMutableString * safeBase64Str = [[NSMutableString alloc]initWithString:string];
    safeBase64Str = (NSMutableString * )[safeBase64Str stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
    safeBase64Str = (NSMutableString * )[safeBase64Str stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
    NSInteger mod4 = safeBase64Str.length % 4;
    if(mod4 > 0)
        [safeBase64Str appendString:[@"====" substringToIndex:(4-mod4)]];
    
    return [safeBase64Str aci_decryptWithAES];
}

/** 33 创建二维码图片  */
+ (UIImage *)ErWeiMaImage:(NSString *)imageStr
{
    
    // 1.创建滤镜对象
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    // 2.设置相关的信息
    [filter setDefaults];
    
    // 3.设置二维码的数据
    NSString *dataString = imageStr;
    NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    // KVO 方式
    [filter setValue:data forKeyPath:@"inputMessage"];
    
    // 4.获取输出的图片
    CIImage *outputImage = [filter outputImage];
    
    
    return [YFTool creatNonInterpolatedUIImageFormCIImage:outputImage withSize:YF_W(228) ];
    
}


/**  34 高清二维码图片  */
+(UIImage *)creatNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat)size
{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 1. 创建bitmap
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}















@end
