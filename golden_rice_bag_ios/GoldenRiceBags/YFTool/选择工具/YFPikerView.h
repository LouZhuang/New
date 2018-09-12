//
//  YFPikerView.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/25.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFTool.h"

@protocol YFPickerDelegate <NSObject>

@optional

- (void)YFPickerSelectorIndixString:(NSString *)str;
@end

@interface YFPikerView : UIView

@property (nonatomic, strong) NSArray *customArr;
@property (nonatomic, strong) NSArray *rightArr;

@property (nonatomic,weak)id <YFPickerDelegate>YFdelegate;

@property(nonatomic,strong)UILabel *label0;
@property(nonatomic,strong)UILabel *label1;

@end
