//
//  YFCompletionOfRiskRatingViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/15.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFCompletionOfRiskRatingViewController.h"

@interface YFCompletionOfRiskRatingViewController ()

/*
 downview
 */
@property(nonatomic,strong)UIView *downView;
/*
 imageview
 */
@property(nonatomic,strong)UIImageView *imageView;

/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 content
 */
@property(nonatomic,strong)UILabel *contentLabel;


/*
 继续投资按钮
 */
@property(nonatomic,strong)UIButton *continueButton;

@end

@implementation YFCompletionOfRiskRatingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"风险承受能力评估";
    [self configuration];
    // Do any additional setup after loading the view.
}

-(void)configuration
{
    [self.view sd_addSubviews:@[self.downView,self.imageView,self.tittleLabel,self.contentLabel,self.continueButton]];
    
    self.downView.sd_layout
    .topSpaceToView(self.view, YF_H(0))
    .centerXEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(10));
    
    self.imageView.sd_layout
    .topSpaceToView(self.view, YF_H(40))
    .centerXEqualToView(self.view)
    .widthIs(YF_W(63))
    .heightIs(YF_H(70));
    
    self.tittleLabel.sd_layout
    .topSpaceToView(self.view, YF_H(121))
    .centerXEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(24));
    
    
    self.contentLabel.sd_layout
    .topSpaceToView(self.tittleLabel, YF_H(20))
    .leftSpaceToView(self.view, YF_W(14))
    .widthIs(WIDTH -YF_W(28))
    .heightIs(YF_H(40));
    
    self.continueButton.sd_layout
    .topSpaceToView(self.contentLabel, YF_H(50))
    .leftSpaceToView(self.view, YF_W(68))
    .widthIs(WIDTH -YF_W(136))
    .heightIs(YF_H(49));
    
    
}

#pragma mark - lazy

-(UIView *)downView
{
    if (!_downView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor=LIGHTGREYCOLOR;
        _downView = view;
    }
    return _downView;
}
-(UIImageView *)imageView
{
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"dengpaoImage"];
        _imageView = imageView;
    }
    return _imageView;
}


-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor =[YFTool YFColorWithString:@"333333"];
        label.text =@"完成风险评级";
        _tittleLabel = label;
    }
    return _tittleLabel;
}

-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =ZHUTICOLOR;
        label.numberOfLines=0;
        NSString *string =[NSString stringWithFormat:@"根据评级您为【%@】投资者,系统将自动为您推荐适合您的产品",[YFTool userDefaultsId:@"Types"]];
        NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithString:string];
        [aString addAttribute:NSForegroundColorAttributeName value:[YFTool YFColorWithString:@"666666"] range:NSMakeRange(0, 6)];
        [aString addAttribute:NSForegroundColorAttributeName value:[YFTool YFColorWithString:@"666666"] range:NSMakeRange(string.length-19, 19)];
        label.attributedText =aString;
        _contentLabel = label;
    }
    return _contentLabel;
}


-(UIButton *)continueButton
{
    if (!_continueButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitle:@"继续投资" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.layer.cornerRadius = YF_W(25);
        button.layer.masksToBounds = YES;
        button.titleLabel.font = YF_FONT(17);
        [button addTarget:self action:@selector(continueClick) forControlEvents:UIControlEventTouchUpInside];
        button.userInteractionEnabled = YES;
        _continueButton = button;
        
    }
    return _continueButton;
}

-(void)continueClick
{

    [self.navigationController popToRootViewControllerAnimated:NO];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BackHome" object:nil];
    
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
