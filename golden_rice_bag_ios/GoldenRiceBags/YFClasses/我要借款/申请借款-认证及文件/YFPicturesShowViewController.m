//
//  YFPicturesShowViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/30.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFPicturesShowViewController.h"
#import "LBPhotoBrowserManager.h"
#import <ImageIO/ImageIO.h>
#import "UIView+Frame.h"
@interface YFPicturesShowViewController ()
@property(nonatomic,strong)UIView *DownView;
@property(nonatomic,assign)NSInteger index;
@end

@implementation YFPicturesShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = YES;
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.title =[NSString stringWithFormat:@"%ld/%ld",_indexRow+1,_picturesArray.count];
    self.view.backgroundColor =[UIColor blackColor];
    
    
    [self addNavigationItemWithImageNames:@[@"deleteblackImage"] isLeft:NO target:self action:@selector(deleteClick) tags:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(IndexChange:) name:@"IndexChange" object:nil];
    
    
    [self creatView];
    // Do any additional setup after loading the view.
}

-(void)creatView
{
    [_DownView removeFromSuperview];
    _DownView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64)];
    _DownView.backgroundColor = [UIColor whiteColor];
    _DownView.userInteractionEnabled = YES;
    [self.view addSubview:_DownView];
    
    
    UIImageView *imageViewa =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    imageViewa.center = _DownView.center;
    _imageViews =[NSMutableArray array];
    for (NSInteger i= 0; i < _picturesArray.count; i ++) {
        [_imageViews addObject:imageViewa];
    }
    
    [[LBPhotoBrowserManager defaultManager] showImageWithURLArray:_picturesArray fromImageViews: _imageViews andSelectedIndex:(int)_indexRow andImageViewSuperView:_DownView];
    //    //     添加长按手势的效果
    //    [[[LBPhotoBrowserManager defaultManager] addLongPressShowTitles:nil] addTitleClickCallbackBlock:^(UIImage *image, NSIndexPath *indexPath, NSString *title) {
    //        LBPhotoBrowserLog(@"%@ %@ %@",image,indexPath,title);
    //    }].style = LBMaximalImageViewOnDragDismmissStyleOne; // 默认的就是LBMaximalImageViewOnDragDismmissStyleOne
    
    
    
    
}
/*收到index状态判断*/
-(void)IndexChange:(NSNotification *)noti
{
    
    NSString *info = [noti object];
    _indexRow =[info integerValue];
    self.title =[NSString stringWithFormat:@"%ld/%ld",[info integerValue]+1,_picturesArray.count];
    
}



/**  删除  */
-(void)deleteClick
{
    
    UIAlertView  *alertView1 = [[UIAlertView alloc] initWithTitle:nil message:@"是否删除" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView1 show];
    
    
    
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (_picturesArray.count !=1) {
        if (buttonIndex == 1) {
            [_picturesArray removeObjectAtIndex:_indexRow];
            [_ShowArray removeObjectAtIndex:_indexRow];
            
            
            
            if (_indexRow != 0) {
                _indexRow = _indexRow-1;
            }
            [self creatView];
            
            self.title =[NSString stringWithFormat:@"%ld/%ld",_indexRow+1,_picturesArray.count];
            /**  刷新  */
            [[NSNotificationCenter defaultCenter] postNotificationName:@"Refresh" object:nil];
        }
    }
    else{
        if (buttonIndex == 1) {
            [_picturesArray removeObjectAtIndex:_indexRow];
            [_ShowArray removeObjectAtIndex:_indexRow];
            
            /**  刷新  */
            [[NSNotificationCenter defaultCenter] postNotificationName:@"Refresh" object:nil];
            
            [self.navigationController popViewControllerAnimated:YES];
            
            
        }
        
    }
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
