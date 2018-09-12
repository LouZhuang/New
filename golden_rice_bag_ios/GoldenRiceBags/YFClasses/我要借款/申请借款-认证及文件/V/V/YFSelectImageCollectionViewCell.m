//
//  YFSelectImageCollectionViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/27.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFSelectImageCollectionViewCell.h"

@implementation YFSelectImageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        [self configuration];
        
    }
    
    return self;
}


-(void)configuration
{
    
    [self sd_addSubviews:@[self.imageView]];
    
    self.imageView.sd_layout
    .topEqualToView(self)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .heightIs(YF_H(70));

}

-(UIImageView *)imageView
{
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.userInteractionEnabled =YES;
        imageView.layer.cornerRadius=YF_W(8);
        imageView.layer.masksToBounds=YES;
        _imageView = imageView;
    }
    return _imageView;
}
-(void)setterImageViewArr:(NSMutableArray *)imageArr indexPath:(NSInteger)row
{
    if (imageArr.count==row) {
        
        self.imageView.image=[UIImage imageNamed:@"addImage"];
        
    }
    else{
        self.imageView.image=[imageArr objectAtIndex:row];
    }
}

@end
