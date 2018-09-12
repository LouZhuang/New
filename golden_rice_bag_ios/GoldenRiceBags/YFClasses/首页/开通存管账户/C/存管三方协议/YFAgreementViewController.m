//
//  YFAgreementViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/14.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFAgreementViewController.h"

@interface YFAgreementViewController ()
/*
 同意协议
 */
@property(nonatomic,strong)UIButton *determineButton;

@end

@implementation YFAgreementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"金城银行银商存管三方协议";
    
    [self configuration];
    // Do any additional setup after loading the view.
}


-(void)configuration
{
    [self.view sd_addSubviews:@[self.determineButton]];
    
    self.determineButton.sd_layout
    .bottomEqualToView(self.view)
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(YF_H(49));
    
}


-(UIButton *)determineButton
{
    if (!_determineButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitle:@"已阅读并同意该协议" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(17);
        [button addTarget:self action:@selector(determineClick) forControlEvents:UIControlEventTouchUpInside];
        _determineButton = button;
        
    }
    return _determineButton;
}

-(void)determineClick
{
    [self.navigationController popViewControllerAnimated:YES];
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
