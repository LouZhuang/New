//
//  YFModifyPhoneNumberDetailViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "YFModifyPhoneNumberAgainViewController.h"
@interface YFModifyPhoneNumberDetailViewController : YFBaseViewController<UITextFieldDelegate>
/*
 返回按钮
 */
@property(nonatomic,strong)UIButton *backButton;


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


@end
