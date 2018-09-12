//
//  YFMyInvitationView.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFMyInvitationView.h"

@implementation YFMyInvitationView
static NSString *cellId = @"YFMyInvitationHeaderTableViewCell";

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    
    if (self) {
        
        [self configuration];
        
    }
    return self;
}

-(void)configuration
{
    [self sd_addSubviews:@[self.navImageView,self.YFTableView]];
    
    self.navImageView.sd_layout
    .topSpaceToView(self, YF_H(0))
    .leftSpaceToView(self, YF_W(0))
    .widthIs(WIDTH)
    .heightIs(YF_H(160));
    
    [self.navImageView sd_addSubviews:@[self.backButton,self.tittleLabel,self.subitLabel,self.numberLabel,self.pleaseButton]];
    
    self.backButton.sd_layout
    .topSpaceToView(self.navImageView, YF_H(36))
    .leftSpaceToView(self.navImageView, YF_W(14))
    .widthIs(YF_W(7))
    .heightIs(YF_H(12));
    
    self.tittleLabel.sd_layout
    .topSpaceToView(self.navImageView, YF_H(30))
    .centerXEqualToView(self.navImageView)
    .widthIs(YF_W(150))
    .heightIs(YF_H(24));

    
    
    self.subitLabel.sd_layout
    .topSpaceToView(self.navImageView, YF_H(82))
    .centerXEqualToView(self.navImageView)
    .widthIs(WIDTH)
    .heightIs(YF_H(30));
    
    self.numberLabel.sd_layout
    .topSpaceToView(self.navImageView, YF_H(120))
    .centerXEqualToView(self.navImageView)
    .widthIs(WIDTH)
    .heightIs(YF_H(20));
    
    self.pleaseButton.sd_layout
    .rightSpaceToView(self.navImageView, YF_W(14))
    .topSpaceToView(self.navImageView, YF_H(34))
    .widthIs(YF_W(100))
    .heightIs(YF_H(20));
    
    self.YFTableView.sd_layout
    .topSpaceToView(self, YF_H(160))
    .leftSpaceToView(self, 0)
    .widthIs(WIDTH)
    .heightIs(YF_H(239));
    
}

-(YFBaseTableView *)YFTableView
{
    if (!_YFTableView) {
        YFBaseTableView *tableView= [[YFBaseTableView alloc] init];
        tableView.separatorColor = LIGHTGREYCOLOR;
        tableView.tableFooterView = [UIView new];
        tableView.delegate = self;
        tableView.scrollEnabled=NO;
        tableView.dataSource =self;
        _YFTableView =tableView;
    }
    return _YFTableView;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
       return YF_H(80);
    }
    if (indexPath.row==1) {
      return YF_H(50);
    }
    if (indexPath.row==2) {
      return YF_H(72);
    }
    if (indexPath.row==3) {
     return YF_H(37);
    }
    else{
        return 0;
    }
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 4;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFMyInvitationHeaderTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFMyInvitationHeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    [cell setterIndexRow:indexPath.row];
    
    return cell;
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.row==1) {
        YFSweepTheYardViewController *YFSweepTheYardVC=[[YFSweepTheYardViewController alloc]init];
        [[YFTool getCurrentVC].navigationController pushViewController:YFSweepTheYardVC animated:YES];
    }
}


-(UIImageView *)navImageView
{
    if (!_navImageView) {
        UIImageView *imageView=[[UIImageView alloc] init];
        imageView.userInteractionEnabled=YES;
        imageView.image= [UIImage imageNamed:@"OnScheduleImage"];
        _navImageView = imageView;
        
    }
    
    return _navImageView;
}

-(UIButton *)backButton
{
    if (!_backButton) {
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"backbaiImage"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        [button setEnlargeEdge:YF_W(60)];
        _backButton = button;
    }
    return _backButton;
}
-(void)backClick
{
    [[YFTool getCurrentVC].navigationController popViewControllerAnimated:YES];
}
-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textColor =WHITECOLOR;
        label.textAlignment=NSTextAlignmentCenter;
        label.text =@"邀请好友拿现金";
        _tittleLabel = label;
    }
    return _tittleLabel;
}


-(UILabel *)subitLabel
{
    if (!_subitLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(22);
        label.textColor =WHITECOLOR;
        label.textAlignment=NSTextAlignmentCenter;
        label.text =@"邀请好友最高返现2%";
        _subitLabel = label;
    }
    return _subitLabel;
}


-(UILabel *)numberLabel
{
    if (!_numberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =WHITECOLOR;
        label.textAlignment=NSTextAlignmentCenter;
        label.text =@"返现无上限，天天赢现金";
        _numberLabel = label;
    }
    return _numberLabel;
}

-(UIButton *)pleaseButton
{
    if (!_pleaseButton) {
        UIButton *button=[[UIButton alloc] init];
        [button setTitle:@"活动规则" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(14);
        [button setEnlargeEdge:YF_W(60)];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [button addTarget:self action:@selector(detaliClick) forControlEvents:UIControlEventTouchUpInside];
        _pleaseButton = button;
    }
    return _pleaseButton;
}

-(void)detaliClick
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
     YFTheInvitationView *InvitationView =[[YFTheInvitationView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    [window addSubview:InvitationView];

}


@end
