//
//  YFSelectImageView.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/26.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFTool.h"
#import "YFSelectImageCollectionViewCell.h"
#import "YFPicturesShowViewController.h"
@protocol YFSelectImageDelegate <NSObject>
@required
- (void)NeedImageArray:(NSMutableArray *)imageArray urlImageArray:(NSMutableArray *)urlArray;

@end

@interface YFSelectImageView : UIView

/*
 集合视图
 */
@property(nonatomic,strong)UICollectionView *YFCollectionView;

///*
// 添加按钮
// */
//@property(nonatomic,strong)UIButton *addImageButton;


/*
 图片数组
 */
@property(nonatomic,strong)NSMutableArray *imageArray;
/*
 图片url数组
 */
@property(nonatomic,strong)NSMutableArray *imageUrlArray;

@property (nonatomic, assign) id <YFSelectImageDelegate>addDelegate;
@end
