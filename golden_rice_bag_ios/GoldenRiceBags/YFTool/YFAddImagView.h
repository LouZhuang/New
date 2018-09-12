//
//  YFAddImagView.h
//  FDBigHealth
//
//  Created by 风鼎-叶烽 on 2018/2/8.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFProgressHUD.h"

@protocol AddImageDelegate <NSObject>
@required
- (void)NeedImageArray:(NSMutableArray *)imageArray;

@end

@interface YFAddImagView : UIView
/**
   *  存储所有的照片(UIImage)
   */
@property (nonatomic, strong) NSMutableArray *images;
-(instancetype)initWithFrame:(CGRect)frame imageH:(CGFloat)imageh  imageW:(CGFloat)imagew  kMaxColumn:(NSInteger)hangCount MaxImageCount:(NSInteger)MaxNumberCount;


@property (nonatomic, assign) id <AddImageDelegate>addDelegate;
@end
