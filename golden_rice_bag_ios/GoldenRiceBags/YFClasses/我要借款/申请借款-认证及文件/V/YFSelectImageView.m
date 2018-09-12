//
//  YFSelectImageView.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/26.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFSelectImageView.h"

@interface YFSelectImageView ()<UICollectionViewDelegate,UICollectionViewDataSource,UINavigationControllerDelegate, UIImagePickerControllerDelegate,UIActionSheetDelegate>

@end

@implementation YFSelectImageView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled = YES;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Refresh) name:@"Refresh" object:nil];
        
        [self configuration];
        
        
    }
    return self;
}

-(void)configuration
{
    self.imageArray=[NSMutableArray array];
    self.imageUrlArray=[NSMutableArray array];
    
    
    [self sd_addSubviews:@[self.YFCollectionView]];
    
    
    
}


-(UICollectionView *)YFCollectionView
{
    if (!_YFCollectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumInteritemSpacing =YF_W(14);
        layout.minimumLineSpacing =YF_W(14);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0, WIDTH, YF_H(70)) collectionViewLayout:layout];
        collectionView.backgroundColor = WHITECOLOR;
        collectionView.showsHorizontalScrollIndicator=NO;
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.pagingEnabled= YES;
        _YFCollectionView =collectionView;
    }
    return _YFCollectionView;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.imageArray.count +1;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellId =[NSString stringWithFormat:@"YFSelectImageCollectionViewCell%ld",indexPath.row];
    
    [self.YFCollectionView registerClass:[YFSelectImageCollectionViewCell class] forCellWithReuseIdentifier:cellId];
    
    YFSelectImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    
    [cell setterImageViewArr:self.imageArray indexPath:indexPath.row];
    
    return cell;
}



#pragma mark ---- UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return (CGSize){YF_W(120),YF_H(70)};
    
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, YF_W(14), 0,0);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.imageArray.count==indexPath.row) {
        //创建actionSheet对象
        UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"我的相册", nil];
        //actionSheet样式
        sheet.actionSheetStyle = UIActionSheetStyleAutomatic;
        //显示
        [sheet showInView:self];
        sheet.delegate = self;
    }
    else{
        
        YFPicturesShowViewController *picturesVC = [[YFPicturesShowViewController alloc] init];
        picturesVC.picturesArray =self.imageUrlArray;
        picturesVC.indexRow =indexPath.row;
        picturesVC.ShowArray = self.imageArray;
        [[YFTool getCurrentVC].navigationController pushViewController:picturesVC animated:YES];
    }
}

-(void)Refresh
{
    
   [self.addDelegate NeedImageArray:self.imageArray urlImageArray:self.imageUrlArray];
  
    [self.YFCollectionView reloadData];

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
    UIImage *img = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    // 当选择的类型是图片
    if ([type isEqualToString:@"public.image"])
    {
        img = [info objectForKey:@"UIImagePickerControllerEditedImage"]; // 裁剪后的图片
    }
    
    [self.imageArray addObject:img];
    [YFManager OSS:img success:^(id json) {

        [self.imageUrlArray addObject:json];
        [self.addDelegate NeedImageArray:self.imageArray urlImageArray:self.imageUrlArray];
        
    } failure:^(NSError *error) {
        
    }];

    [self.YFCollectionView reloadData];

    
  
    
    //存入相册
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}



@end
