//
//  YFPikerView.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/25.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFPikerView.h"



@interface YFPikerView ()<UIPickerViewDelegate,UIPickerViewDataSource,UIScrollViewDelegate>

@property (nonatomic,strong)UIView *bgV;

@property (nonatomic,strong)UIButton *cancelBtn;

@property (nonatomic,strong)UIButton *conpleteBtn;
@property (nonatomic,strong)NSMutableArray *array;
@property (nonatomic,strong)NSMutableArray *rightarray;

@property (nonatomic,strong)UIScrollView *YFScrollerView;
@property (nonatomic,strong) UIView* line ;
@property (nonatomic,strong)UIPickerView *leftPickerView;
@property (nonatomic,strong)UIPickerView *rightPickerView;
@end


@implementation YFPikerView
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self configuration];
    }
    return self;

}

-(void)configuration
{
    
    self.array = [NSMutableArray array];
    self.rightarray = [NSMutableArray array];
    
    self.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    self.backgroundColor = RGBACOLOR(51, 51, 51, 0.8);;
    self.bgV = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT, WIDTH,YF_H(254))];
    self.bgV.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.bgV];
    
    //
    UIView *line = [UIView new];
    [self.bgV addSubview:line];
    line.sd_layout
    .topEqualToView(self.bgV)
    .leftEqualToView(self.bgV)
    .rightEqualToView(self.bgV)
    .heightIs(YF_H(49));
    
    line.backgroundColor = LIGHTGREYCOLOR;
    self.line = line ;
    
    [self showAnimation];
    //取消
    self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.bgV addSubview:self.cancelBtn];
    self.cancelBtn.sd_layout
    
    .topEqualToView(self.bgV)
    .leftSpaceToView(self.bgV, YF_W(0))
    .widthIs(YF_W(62))
    .heightIs(YF_H(49));
    
    self.cancelBtn.titleLabel.font =YF_FONT(17);
    [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.cancelBtn setTitleColor:YF999 forState:UIControlStateNormal];
    //完成
    self.conpleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.bgV addSubview:self.conpleteBtn];
    self.conpleteBtn.sd_layout
    .topEqualToView(self.bgV)
    .rightSpaceToView(self.bgV, YF_W(0))
    .widthIs(YF_W(62))
    .heightIs(YF_H(49));
    
    
    self.conpleteBtn.titleLabel.font = YF_FONT(17);
    [self.conpleteBtn setTitle:@"确定" forState:UIControlStateNormal];
    [self.conpleteBtn addTarget:self action:@selector(completeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.conpleteBtn setTitleColor:[YFTool YFColorWithString:@"3987FF"] forState:UIControlStateNormal];
    
    
    self.YFScrollerView=[[UIScrollView alloc] init];
    self.YFScrollerView.backgroundColor=WHITECOLOR;
    [self.YFScrollerView setContentSize:CGSizeMake(WIDTH *2, 0)];
    self.YFScrollerView.bounces=YES;
    self.YFScrollerView.delegate=self;
    self.YFScrollerView.pagingEnabled=YES;
    [self.bgV addSubview:self.YFScrollerView];
    
    self.YFScrollerView.sd_layout
    .topSpaceToView(self.bgV, YF_H(49))
    .leftEqualToView(self.bgV)
    .rightEqualToView(self.bgV)
    .bottomEqualToView(self.bgV);
    
    NSArray *array=@[@"消费类",@"企业经营"];
    for (NSInteger i = 0; i < 2; i ++) {
        UILabel *label =[[UILabel alloc] initWithFrame:CGRectMake(WIDTH *i, 0, WIDTH, YF_H(45))];
        label.font = YF_FONT(14);
        label.textColor =YF333;
        label.textAlignment=NSTextAlignmentCenter;
        label.text =[array objectAtIndex:i];
        [self.YFScrollerView addSubview:label];
    }
    
    
   _label0 =[[UILabel alloc] initWithFrame:CGRectMake(YF_W(178),self.bgV.frame.size.height - YF_H(20), YF_W(6), YF_H(6))];
    _label0.backgroundColor=ZHUTICOLOR;
    _label0.layer.cornerRadius=YF_W(6)/2;
    _label0.layer.masksToBounds=YES;
    [self.bgV addSubview:_label0];
    
    _label1 =[[UILabel alloc] initWithFrame:CGRectMake(YF_W(192),self.bgV.frame.size.height - YF_H(20), YF_W(6), YF_H(6))];
    _label1.backgroundColor=[YFTool YFColorWithString:@"FFDFC4"];
    _label1.layer.cornerRadius=YF_W(6)/2;
    _label1.layer.masksToBounds=YES;
    [self.bgV addSubview:_label1];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.YFScrollerView.contentOffset.x==0) {
       _label0.backgroundColor=ZHUTICOLOR;
        _label1.backgroundColor=[YFTool YFColorWithString:@"FFDFC4"];
    }
    if (self.YFScrollerView.contentOffset.x==WIDTH) {
        _label1.backgroundColor=ZHUTICOLOR;
        _label0.backgroundColor=[YFTool YFColorWithString:@"FFDFC4"];
    }
}

-(void)setCustomArr:(NSArray *)customArr{
    
    //选择器
    self.leftPickerView = [UIPickerView new];
    [self.YFScrollerView addSubview:self.leftPickerView];
    
    self.leftPickerView.sd_layout
    .topSpaceToView(self.YFScrollerView, YF_H(45))
    .bottomSpaceToView(self.YFScrollerView, YF_H(20))
    .leftEqualToView(self.YFScrollerView)
    .widthIs(WIDTH);
    
    
    self.leftPickerView.delegate = self;
    self.leftPickerView.dataSource = self;
    
    _customArr = customArr;
    [self.array addObject:customArr];
    
    
}


-(void)setRightArr:(NSArray *)rightArr{
    //选择器
    self.rightPickerView = [UIPickerView new];
    [self.YFScrollerView addSubview:self.rightPickerView];
    
    self.rightPickerView.sd_layout
    .bottomSpaceToView(self.YFScrollerView, YF_H(20))
    .bottomEqualToView(self.YFScrollerView)
    .leftSpaceToView(self.YFScrollerView, WIDTH)
    .widthIs(WIDTH);
    
    
    self.rightPickerView.delegate = self;
    self.rightPickerView.dataSource = self;
    
    _rightArr = rightArr;
    [self.rightarray addObject:rightArr];
    
    
}



- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    if ([pickerView isEqual:_leftPickerView]) {
      return self.array.count;
    }
    else{
       return self.rightarray.count;
    }
    
 
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    
    
    if ([pickerView isEqual:_leftPickerView]) {
        NSArray * arr = (NSArray *)[self.array objectAtIndex:component];
        
        return arr.count;
    }
    else{
        NSArray * arr = (NSArray *)[self.rightarray objectAtIndex:component];
        
        return arr.count;
    }
    
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel *label=[[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentCenter;
    label.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    
    return label;
    
    
}
//- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
//    if (self.arrayType == AreaArray) {
//        if (component==0) {                    // 只有点击了第一列才去刷新第二个列对应的数据
//            self.selectRowWithProvince=row;   //  刷新的下标
//            self.selectRowWithCity=0;
//            [pickerView reloadComponent:1];  //   刷新第一,二列
//            [pickerView reloadComponent:2];
//        }
//        else if(component==1){
//            self.selectRowWithCity=row;       //  选中的市级的下标
//            [pickerView reloadComponent:2];  //   刷新第三列
//        }
//        else if(component==2){
//            self.selectRowWithTown=row;
//        }
//
//    }
//
//}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if ([pickerView isEqual:_leftPickerView]) {
        NSArray *arr = (NSArray *)[self.array objectAtIndex:component];
        return [arr objectAtIndex:row % arr.count];
    }
    else{
        NSArray *arr = (NSArray *)[self.rightarray objectAtIndex:component];
        return [arr objectAtIndex:row % arr.count];
    }
        
    
    
    
    
}


- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{

    return (WIDTH - YF_W(30));

}


#pragma mark-----点击方法

- (void)cancelBtnClick{
    
    [self hideAnimation];
    
}



- (void)completeBtnClick{
     NSString *fullStr = [NSString string];
    if (self.YFScrollerView.contentOffset.x==0) {
       
        
        for (int i = 0; i < self.array.count; i++) {
            
            NSArray *arr = [self.array objectAtIndex:i];
            
            NSString *str = [arr objectAtIndex:[self.leftPickerView selectedRowInComponent:i]];
            fullStr = [fullStr stringByAppendingString:str];
            
            
        }

    }
    else{
        for (int i = 0; i < self.rightarray.count; i++) {
            
            NSArray *arr = [self.rightarray objectAtIndex:i];
            
            NSString *str = [arr objectAtIndex:[self.rightPickerView selectedRowInComponent:i]];
            fullStr = [fullStr stringByAppendingString:str];
            
            
        }
    }
    
    
    if (_YFdelegate && [_YFdelegate respondsToSelector:@selector(YFPickerSelectorIndixString:)]) {

        [self.YFdelegate YFPickerSelectorIndixString:fullStr];
    }

    
    [self hideAnimation];
    
}







//隐藏动画
- (void)hideAnimation{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        CGRect frame = self.bgV.frame;
        frame.origin.y = HEIGHT;
        self.bgV.frame = frame;
        
    } completion:^(BOOL finished) {
        
        [self.bgV removeFromSuperview];
        [self removeFromSuperview];
        
    }];
    
}

//显示动画
- (void)showAnimation{
    
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        CGRect frame = self.bgV.frame;
        frame.origin.y = HEIGHT-YF_H(254);
        self.bgV.frame = frame;
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        
        
    });
    
    
}






@end
