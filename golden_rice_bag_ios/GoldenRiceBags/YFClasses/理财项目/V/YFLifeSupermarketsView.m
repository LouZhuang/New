//
//  YFLifeSupermarketsView.m
//  FDBigHealth
//
//  Created by 风鼎-叶烽 on 2018/3/2.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFLifeSupermarketsView.h"

@implementation YFLifeSupermarketsView
static NSString *const cellId = @"UITableViewCell";
-(instancetype)initWithFrame:(CGRect)frame scrocType:(NSInteger)type selectType:(NSInteger)select viewY:(float)Y tittleArray:(NSArray *)array  center:(BOOL)centerType
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _Center =centerType;
        _type =select;
        self.tittleArray =array;

        
        _downView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH,HEIGHT)];
        _downView.backgroundColor = [UIColor blackColor];
        _downView.alpha = 0.1;
        [self addSubview:_downView];

        
        UITapGestureRecognizer *uptapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(event:)];
        //将手势添加到需要相应的view中去
        [_downView addGestureRecognizer:uptapGesture];
        
        //选择触发事件的方式（默认单机触发）
        [uptapGesture setNumberOfTapsRequired:1];
        
        [self initUI:Y];
        

    }
    
    return self;
}

-(void)initUI:(float)viewY
{
    
    [self sd_addSubviews:@[self.contentView]];
    
    self.contentView.sd_layout
    .topSpaceToView(self, viewY)
    .leftSpaceToView(self, YF_W(14))
    .heightIs(YF_H(45)* self.tittleArray.count)
    .rightSpaceToView(self, YF_W(14));
    
    
    self.YFTableView = [[YFBaseTableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH-YF_W(28),YF_H(45)* self.tittleArray.count)];
    self.YFTableView.separatorColor = LIGHTGREYCOLOR;
    self.YFTableView.tableFooterView =[UIView new];
    self.YFTableView.delegate = self;
    self.YFTableView.layer.cornerRadius = YF_W(8);
    self.YFTableView.scrollEnabled = NO;
    self.YFTableView.dataSource =self;
    [self.contentView addSubview:self.YFTableView];
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return YF_H(45);
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tittleArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(YF_W(14), 0, YF_W(200), YF_H(45))];
    lable.font = YF_FONT(14);
    lable.textColor = [YFTool YFColorWithString:@"333333"];
    lable.text = [self.tittleArray objectAtIndex:indexPath.row];
    [cell addSubview:lable];
    
     UIButton *button =[[UIButton alloc] init];
    button.hidden = YES;
    [button setBackgroundImage:[UIImage imageNamed:@"yesImage"] forState:UIControlStateNormal];
    [cell addSubview:button];
    button.sd_layout
    .centerYEqualToView(cell)
    .rightSpaceToView(cell, YF_W(14))
    .widthIs(YF_W(16))
    .heightIs(YF_H(16));

    
    if (indexPath.row == _type) {
       lable.textColor =ZHUTICOLOR;
        button.hidden = NO;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    _type = indexPath.row;
    [self.lifeDelegate YFLifeIndex:_type tittleString:[self.tittleArray objectAtIndex:indexPath.row] ];
   [self removeFromSuperview];
}

-(UIView *)contentView
{
    if (!_contentView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = WHITECOLOR;
        view.layer.cornerRadius = YF_W(8);
        view.userInteractionEnabled =YES;
        view.layer.shadowColor = [UIColor lightGrayColor].CGColor;//阴影颜色
        view.layer.shadowOffset = CGSizeMake(1, 2);//偏移距离
        view.layer.shadowOpacity = 0.8f;//不透明度
        view.layer.shadowRadius = 2.0;//半径r
        _contentView = view;
    }
    return _contentView;
}


-(void)event:(UITapGestureRecognizer *)gesture
{
    [self.lifeDelegate YFLifeIndex:_type tittleString:@"delete"];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self removeFromSuperview];
    });

    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
