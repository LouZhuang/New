//
//  YFReferenceCellPhoneNumberViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/13.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFReferenceCellPhoneNumberViewController.h"

@interface YFReferenceCellPhoneNumberViewController ()<UITextFieldDelegate>
/*
 返回按钮
 */
@property(nonatomic,strong)UIButton *deleteButton;
/*
 输入手机号文字
 */
@property(nonatomic,strong)UILabel *phoneLabel;

/*
 +86
 */
@property(nonatomic,strong)UILabel *jiaBaLiu;

/*
 输入框
 */
@property(nonatomic,strong)UITextField *phoneTextField;

/*
 底部虚线
 */
@property(nonatomic,strong)UIImageView *xuXianView;

/*
 下一步按钮
 */
@property(nonatomic,strong)UIButton *theNextStepButton;

/*
 底部图片
 */
@property(nonatomic,strong)UIImageView *downView;

@end

@implementation YFReferenceCellPhoneNumberViewController


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
    [self.view sd_addSubviews:@[self.deleteButton,self.phoneLabel,self.jiaBaLiu,self.phoneTextField,self.xuXianView,self.theNextStepButton,self.downView]];
    
    self.deleteButton.sd_layout
    .leftSpaceToView(self.view, YF_W(21.6))
    .topSpaceToView(self.view, YF_H(47.7))
    .widthIs(YF_W(18.7))
    .heightIs(YF_H(18.7));
    
    
    self.phoneLabel.sd_layout
    .leftSpaceToView(self.view, YF_W(30))
    .topSpaceToView(self.view, YF_H(90))
    .widthIs(YF_W(250))
    .heightIs(YF_H(28));
    
    self.jiaBaLiu.sd_layout
    .leftSpaceToView(self.view, YF_W(30))
    .topSpaceToView(self.phoneLabel, YF_H(30))
    .widthIs(YF_W(40))
    .heightIs(YF_H(24));
    
    self.phoneTextField.sd_layout
    .leftSpaceToView(self.view, YF_W(75))
    .topSpaceToView(self.phoneLabel, YF_H(30))
    .widthIs(WIDTH - YF_W(150))
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
    
    self.downView.sd_layout
    .leftSpaceToView(self.view, YF_W(0))
    .bottomEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(282));
    
}

#pragma mark - lazy

-(UIButton *)deleteButton
{
    if (!_deleteButton) {
        UIButton *button=[[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"loginDeleteImage"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
        [button setEnlargeEdge:YF_W(30)];
        _deleteButton = button;
        
    }
    return _deleteButton;
}

-(void)deleteClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(UILabel *)phoneLabel
{
    if (!_phoneLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.textColor =[YFTool YFColorWithString:@"333333"];
        label.text =@"输入推荐人手机号";
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
        textfield.attributedPlaceholder =[YFTool nsstring:@"请输入推荐人手机号(选填)"];
        textfield.keyboardType = UIKeyboardTypeNumberPad;
        textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        textfield.textColor =[YFTool YFColorWithString:@"333333"];
        [textfield addTarget:self action:@selector(phoneClick:) forControlEvents:UIControlEventEditingChanged];
        _phoneTextField = textfield;
    }
    return _phoneTextField;
}

-(void)phoneClick:(UITextField *)sender
{
    if (sender.text.length > 11) {
        sender.text = [sender.text substringToIndex:11];
    }
}

-(UIButton *)theNextStepButton
{
    if (!_theNextStepButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
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
    if (_phoneTextField.text.length !=0 &&[YFTool isValidateMobile:_phoneTextField.text]==NO) {
        [YFProgressHUD showInfoWithStatus:@"请输入正确的手机号码"];
    }
    
    if (_phoneTextField.text.length ==0 ||[YFTool isValidateMobile:_phoneTextField.text]==YES) {
        
        YFSetLoginPasswordViewController *YFSetLoginPasswordVC =[[YFSetLoginPasswordViewController alloc] init];
        YFSetLoginPasswordVC.phoneString=_phoneString;
         YFSetLoginPasswordVC.inviterPhoneString=_phoneTextField.text;
        [self.navigationController pushViewController:YFSetLoginPasswordVC animated:YES];
    }
    
}


-(UIImageView *)downView
{
    if (!_downView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"downImage"];
        _downView = imageView;
    }
    return _downView;
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
