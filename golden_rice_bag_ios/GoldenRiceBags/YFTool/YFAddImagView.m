//
//  YFAddImagView.m
//  FDBigHealth
//
//  Created by 风鼎-叶烽 on 2018/2/8.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFAddImagView.h"
#import "YFTool.h"

#define deleImageWH 25 // 删除按钮的宽高
#define kAdeleImage @"close.png" // 删除按钮图片
#define kAddImage @"addImage" // 添加按钮图片

@interface YFAddImagView()<UINavigationControllerDelegate, UIImagePickerControllerDelegate,UIActionSheetDelegate>
{
    // 标识被编辑的按钮 -1 为添加新的按钮
    NSInteger editTag;
    CGFloat imageH;
    CGFloat imageW;
    NSInteger kMaxColumn;
    NSInteger MaxImageCount;
}
@end

@implementation YFAddImagView

-(instancetype)initWithFrame:(CGRect)frame imageH:(CGFloat)imageh  imageW:(CGFloat)imagew  kMaxColumn:(NSInteger)hangCount MaxImageCount:(NSInteger)MaxNumberCount
{
    self = [super initWithFrame:frame];
    if (self) {
        imageH =imageh;
        imageW =imagew;
        kMaxColumn =hangCount;
        MaxImageCount=MaxNumberCount;
        
        
        
        UIButton *btn = [self createButtonWithImage:kAddImage andSeletor:@selector(addNew:)];
        [self addSubview:btn];
    }
    return self;
}

-(NSMutableArray *)images
{
    if (_images == nil) {
        _images = [NSMutableArray array];
    }
    return _images;
}

// 添加新的控件
- (void)addNew:(UIButton *)btn
{
    
    NSLog(@"222 == %ld",btn.tag);
    
    // 标识为添加一个新的图片
    
    if (![self deleClose:btn]) {
        editTag = -1;
        [self callImagePicker];
    }
    
    
}

// 修改旧的控件
- (void)changeOld:(UIButton *)btn
{
    // 标识为修改(tag为修改标识)
    if (![self deleClose:btn]) {
        editTag = btn.tag;
        [self callImagePicker];
    }
}

// 删除"删除按钮"
- (BOOL)deleClose:(UIButton *)btn
{
    if (btn.subviews.count == 2) {
        [[btn.subviews lastObject] removeFromSuperview];
        [self stop:btn];
        return YES;
    }
    
    return NO;
}

// 调用图片选择器
- (void)callImagePicker
{
    if (editTag == -1) {
        
   
        [self addClick];
    }
}


// 根据图片名称或者图片创建一个新的显示控件
- (UIButton *)createButtonWithImage:(id)imageNameOrImage andSeletor : (SEL)selector
{
    UIImage *addImage = nil;
    if ([imageNameOrImage isKindOfClass:[NSString class]]) {
        addImage = [UIImage imageNamed:imageNameOrImage];
    }
    else if([imageNameOrImage isKindOfClass:[UIImage class]])
    {
        addImage = imageNameOrImage;
    }
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addBtn.layer.cornerRadius=YF_W(8);
    addBtn.layer.masksToBounds=YES;
    [addBtn setBackgroundImage:addImage forState:UIControlStateNormal];
    [addBtn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    addBtn.tag = self.subviews.count;
    
    // 添加长按手势,用作删除.加号按钮不添加
//    if(addBtn.tag != 0)
//    {
//        UILongPressGestureRecognizer *gester = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
//        [addBtn addGestureRecognizer:gester];
//    }
    return addBtn;
    
}


// 长按添加删除按钮
- (void)longPress : (UIGestureRecognizer *)gester
{
    if (gester.state == UIGestureRecognizerStateBegan)
    {
        UIButton *btn = (UIButton *)gester.view;
        
        UIButton *dele = [UIButton buttonWithType:UIButtonTypeCustom];
        dele.bounds = CGRectMake(0, 0, deleImageWH, deleImageWH);
        [dele setImage:[UIImage imageNamed:kAdeleImage] forState:UIControlStateNormal];
        [dele addTarget:self action:@selector(deletePic:) forControlEvents:UIControlEventTouchUpInside];
        dele.frame = CGRectMake(btn.frame.size.width - dele.frame.size.width, 0, dele.frame.size.width, dele.frame.size.height);
        
        [btn addSubview:dele];
//        [self start : btn];
        
        
    }
    
}

// 长按开始抖动
- (void)start : (UIButton *)btn {
    double angle1 = -5.0 / 180.0 * M_PI;
    double angle2 = 5.0 / 180.0 * M_PI;
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"transform.rotation";
    
    anim.values = @[@(angle1),  @(angle2), @(angle1)];
    anim.duration = 0.25;
    // 动画的重复执行次数
    anim.repeatCount = MAXFLOAT;
    
    // 保持动画执行完毕后的状态
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    [btn.layer addAnimation:anim forKey:@"shake"];
}

// 停止抖动
- (void)stop : (UIButton *)btn{
    [btn.layer removeAnimationForKey:@"shake"];
}

// 删除图片
- (void)deletePic : (UIButton *)btn
{
    [self.images removeObject:[(UIButton *)btn.superview imageForState:UIControlStateNormal]];
    [btn.superview removeFromSuperview];
    if ([[self.subviews lastObject] isHidden]) {
        [[self.subviews lastObject] setHidden:NO];
    }
    
    
}

// 对所有子控件进行布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    NSInteger count = self.subviews.count;
    CGFloat btnW = imageW;
    CGFloat btnH = imageH;
//    NSInteger maxColumn = kMaxColumn > self.frame.size.width / imageW ? self.frame.size.width / imageW : kMaxColumn;
//    CGFloat marginX = (self.frame.size.width - maxColumn * btnW) / (count + 1);

    for (int i = 0; i < count; i++) {
        UIButton *btn = self.subviews[i];
        CGFloat btnX =i *imageW +YF_W(14) *(i+1);
        btn.frame = CGRectMake(btnX, 0, btnW, btnH);
    }
    
}


-(void)addClick
{
    NSLog(@"添加图片");
    //创建actionSheet对象
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"我的相册", nil];
    //actionSheet样式
    sheet.actionSheetStyle = UIActionSheetStyleAutomatic;
    //显示
    [sheet showInView:self];
    sheet.delegate = self;
}


//actionSheet代理方法
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
       
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            [YFProgressHUD showWithStatus:nil];
            UIImagePickerController *oneImagePicker = [UIImagePickerController new];
            oneImagePicker.delegate = self;
            oneImagePicker.allowsEditing = YES;
            //摄像头
            oneImagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self.window.rootViewController presentViewController:oneImagePicker animated:YES completion:^{
                [YFProgressHUD dismiss];
            }];
        }
        
        
    }
    if (buttonIndex == 1) {
        
        // 进入相册
        
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
            
        {
            [YFProgressHUD showWithStatus:nil];
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
            
            imagePicker.allowsEditing = YES;
            
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            
            imagePicker.delegate = self;
            
            [self.window.rootViewController presentViewController:imagePicker animated:YES completion:^{
                [YFProgressHUD dismiss];
                NSLog(@"打开相册");
                
            }];
            
        }
        
        else
            
        {
            [YFProgressHUD dismiss];
            NSLog(@"不能打开相册");
            
        }
    }
    if (buttonIndex == 2) {
        NSLog(@"点击取消");
    }
}

#pragma mark - UIImagePickerController 代理方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerEditedImage];
    if (editTag == -1) {
        // 创建一个新的控件
        UIButton *btn = [self createButtonWithImage:image andSeletor:@selector(changeOld:)];
        [self insertSubview:btn atIndex:self.subviews.count - 1];
        [self.images addObject:image];
        
        if (self.subviews.count - 1 == MaxImageCount) {
            [[self.subviews lastObject] setHidden:YES];

        }
        
    }
    
    if (self.addDelegate && [self.addDelegate respondsToSelector:@selector(NeedImageArray:)]) {
        [self.addDelegate NeedImageArray:self.images];
    }
    // 退出图片选择控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end

