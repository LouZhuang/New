//
//  YFSweepTheYardViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFSweepTheYardViewController.h"

@interface YFSweepTheYardViewController ()
/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 erImageView
 */
@property(nonatomic,strong)UIImageView *erImageView;

/*
 fgImageView
 */
@property(nonatomic,strong)UIImageView *fgImageView;
@end

@implementation YFSweepTheYardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"扫码邀请";
      [self configuration];
    // Do any additional setup after loading the view.
}


-(void)configuration
{
    [self.view sd_addSubviews:@[self.fgImageView,self.tittleLabel,self.erImageView]];
    
    self.fgImageView.sd_layout
    .topSpaceToView(self.view, YF_H(0))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs( YF_H(10));

    self.tittleLabel.sd_layout
    .topSpaceToView(self.view, YF_H(308))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs( YF_H(24));
    
}

-(UIImageView *)erImageView
{
    if (!_erImageView) {
        UIImageView *imageView =[[UIImageView alloc] initWithFrame:CGRectMake((WIDTH - YF_W(228)) /2, YF_H(60), YF_W(228), YF_W(228))];
        imageView.image = [YFTool ErWeiMaImage:@"www.baidu.com"];
        _erImageView = imageView;
    }
    return _erImageView;
}


-(UIImageView *)fgImageView
{
    if (!_fgImageView) {
        UIImageView *imageView =[[UIImageView alloc] init];
        imageView.backgroundColor=LIGHTGREYCOLOR;
        _fgImageView = imageView;
    }
    return _fgImageView;
}

-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textColor =YF333;
        label.text=@"立即扫码邀请好友";
        label.textAlignment =NSTextAlignmentCenter;
        _tittleLabel = label;
    }
    return _tittleLabel;
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
