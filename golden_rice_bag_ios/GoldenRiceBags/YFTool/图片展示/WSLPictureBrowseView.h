//
//  WSLPictureBrowseView.h
//  WSLPictureBrowser
//
//  Created by 王双龙 on 2017/6/28.
//  Copyright © 2017年 王双龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WSLPhotoZoom.h"
#import "YFTool.h"
@protocol indexDelegete <NSObject>

-(void)tittle:(NSString *)string;

@end

@interface WSLPictureBrowseView : UIView

//图片URL
@property (nonatomic, strong)  NSMutableArray * urlArray;

//本地图片路径
@property (nonatomic, strong) NSMutableArray * pathArray;

//本地图片名字 如 1.gif 或者 1.jpeg ...
@property (nonatomic, strong) NSMutableArray * nameArray;

//图片对象
@property (nonatomic, weak) id pictureObject;

@property (nonatomic, weak) id viewController;

@property (nonatomic , strong) WSLPhotoZoom * currentPhotoZoom;

@property (nonatomic , assign) NSInteger index;

@property (nonatomic, copy) NSData * currentImageData;

@property(nonatomic,assign)id<indexDelegete>inDelegate;


@property(nonatomic,assign)NSInteger indexRow;
- (id)initWithFrame:(CGRect)frame imageArray:(NSMutableArray *)imageURL index:(NSInteger)indexRow;
@end
