//
//  YFCertificationModel.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/2.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFCertificationModel : NSObject
@property(nonatomic,strong)NSString *href;/**  优选图片  */

@property(nonatomic,strong)NSString *phone;/**  手机号码  */

@property(nonatomic,strong)NSString *createTime;/**  创建时间  */
@property(nonatomic,strong)NSString *amount;/**  投资份额  */
@property(nonatomic,strong)NSString *name;/**  投资人姓名  */

@end
