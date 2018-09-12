//
//  YFMessageModel.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/28.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFMessageModel : NSObject
@property(nonatomic,strong)NSString *title;/**  标题  */
@property(nonatomic,strong)NSString *content;/**  内容  */
@property(nonatomic,strong)NSString *createTime;/**  时间  */
@property(nonatomic,strong)NSString *href;/**  优选图片  */

@end
