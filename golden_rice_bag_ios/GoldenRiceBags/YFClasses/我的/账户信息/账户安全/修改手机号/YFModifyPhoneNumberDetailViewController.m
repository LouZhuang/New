//
//  YFModifyPhoneNumberDetailViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFModifyPhoneNumberDetailViewController.h"

@interface YFModifyPhoneNumberDetailViewController ()

@end

@implementation YFModifyPhoneNumberDetailViewController

/*
 视图将要显示
 */
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WHITECOLOR;
    [self configuration];
    // Do any additional setup after loading the view.
}


-(void)configuration
{
    [self.view sd_addSubviews:@[self.backButton,self.phoneLabel,self.jiaBaLiu,self.phoneTextField,self.xuXianView,self.theNextStepButton]];
    
    self.backButton.sd_layout
    .leftSpaceToView(self.view, YF_W(14))
    .topSpaceToView(self.view, YF_H(41))
    .widthIs(YF_W(10))
    .heightIs(YF_H(18));
    
    
    self.phoneLabel.sd_layout
    .leftSpaceToView(self.view, YF_W(30))
    .topSpaceToView(self.view, YF_H(90))
    .widthIs(YF_W(150))
    .heightIs(YF_H(28));
    
    self.jiaBaLiu.sd_layout
    .leftSpaceToView(self.view, YF_W(30))
    .topSpaceToView(self.phoneLabel, YF_H(30))
    .widthIs(YF_W(40))
    .heightIs(YF_H(24));
    
    self.phoneTextField.sd_layout
    .leftSpaceToView(self.view, YF_W(75))
    .topSpaceToView(self.phoneLabel, YF_H(30))
    .widthIs(YF_W(150))
    .heightIs(YF_H(24));
    
    self.xuXianView.sd_layout
    .leftSpaceToView(self.view, YF_W(30))
    .topSpaceToView(self.view, YF_H(182))
    .widthIs(YF_W(315))
    .heightIs(YF_H(1));
    
    self.theNextStepButton.sd_layout
    .leftSpaceToView(self.view, YF_W(68))
    .topSpaceToView(self.view, YF_H(253))
    .widthIs(WIDTH - YF_W(136))
    .heightIs(YF_H(49));
    

    
}

#pragma mark - lazy

-(UIButton *)backButton
{
    if (!_backButton) {
        UIButton *button=[[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"backImage"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        [button setEnlargeEdge:YF_W(30)];
        _backButton = button;
        
    }
    return _backButton;
}

-(void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(UILabel *)phoneLabel
{
    if (!_phoneLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.textColor =[YFTool YFColorWithString:@"333333"];
        label.text =@"输入新手机号";
        _phoneLabel = label;
    }
    return _phoneLabel;
}

-(UILabel *)jiaBaLiu
{
    if (!_jiaBaLiu) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textColor =[YFTool YFColorWithString:@"666666"];
        label.text =@"+86";
        _jiaBaLiu = label;
    }
    return _jiaBaLiu;
}

-(UIImageView *)xuXianView
{
    if (!_xuXianView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"xuxianImage"];
        _xuXianView = imageView;
    }
    return _xuXianView;
}


- (UITextField *)phoneTextField {
    if (!_phoneTextField) {
        UITextField *textfield = [[UITextField alloc]init];
        textfield.font = YF_FONT(17);
        textfield.delegate = self;
        textfield.attributedPlaceholder =[YFTool nsstring:@"请输入手机号"];
        textfield.keyboardType = UIKeyboardTypeNumberPad;
        textfield.textColor =[YFTool YFColorWithString:@"333333"];
        [textfield addTarget:self action:@selector(phoneClick:) forControlEvents:UIControlEventEditingChanged];
        _phoneTextField = textfield;
    }
    return _phoneTextField;
}

-(void)phoneClick:(UITextField *)sender
{
    [self next];
}

-(UIButton *)theNextStepButton
{
    if (!_theNextStepButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =[YFTool YFColorWithString:@"DDDDDD"];
        [button setTitle:@"下一步" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.layer.cornerRadius = YF_W(25);
        button.layer.masksToBounds = YES;
        button.titleLabel.font = YF_FONT(17);
        [button addTarget:self action:@selector(theNextStepClick) forControlEvents:UIControlEventTouchUpInside];
        _theNextStepButton = button;
        
    }
    return _theNextStepButton;
}

-(void)theNextStepClick
{
    if ([YFTool isValidateMobile:_phoneTextField.text]==YES) {
        
        [YFSRFManager YFSrfSuccess:^(id json) {
            
            [self srfString:json];
            
        } failure:^(NSError *error) {
            
        }];
        
       
    }
    
}
-(void)srfString:(NSString *)srfStr
{
    
    [YFLoginRequest YFPhoneString:_phoneTextField.text keyCodeString:@"common" timeStampString:[YFTool getTimeNow] srfString:srfStr success:^(id json) {
        if ([YFTool Nsdic:json]==1) {
            NSLog(@"6666 == %@",json);
            [YFProgressHUD showSuccessWithStatus:MESSAGE];
            YFModifyPhoneNumberAgainViewController *YFVerificationCodeVC =[[YFModifyPhoneNumberAgainViewController alloc] init];
            YFVerificationCodeVC.phoneString =_phoneTextField.text;
            [self.navigationController pushViewController:YFVerificationCodeVC animated:YES];
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
    } failure:^(NSError *error) {
        
    }];
}

/*
 判断是否可进入下一步
 */
-(void)next
{
    if ([YFTool isValidateMobile:_phoneTextField.text]==YES ) {
        _theNextStepButton.backgroundColor = ZHUTICOLOR;
    }
    if ([YFTool isValidateMobile:_phoneTextField.text] == NO ) {
        _theNextStepButton.backgroundColor = [YFTool YFColorWithString:@"DDDDDD"];
    }
    
    
    
}

/*
 视图将要消失
 */
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    
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
