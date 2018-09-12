//
//  YFSelectImageCollectionViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/27.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFTool.h"
@interface YFSelectImageCollectionViewCell : UICollectionViewCell
/*
 image
 */
@property(nonatomic,strong)UIImageView *imageView;

-(void)setterImageViewArr:(NSMutableArray *)imageArr indexPath:(NSInteger)row;
@end
