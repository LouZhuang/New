//
//  YFHomePageHeaderTableViewCell.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/19.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFHomePageHeaderTableViewCell.h"

@implementation YFHomePageHeaderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self configuration];
        
    }
    return self;
}

-(void)configuration
{
    [self.contentView sd_addSubviews:@[self.downView,self.YFBannerView,self.YFTextView,self.theWavesImageView]];
    
    self.downView.sd_layout
    .topEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(0))
    .widthIs(WIDTH)
    .heightIs(YF_H(61));
    

    
    self.YFTextView.sd_layout
    .topSpaceToView(self.contentView, YF_H(196))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH-YF_W(28))
    .heightIs(YF_H(54));
    
    self.theWavesImageView.sd_layout
    .bottomEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, YF_W(0))
    .widthIs(WIDTH)
    .heightIs(YF_H(40));

}


#pragma mark - lazy

-(UIView *)downView
{
    if (!_downView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = ZHUTICOLOR;
        view.userInteractionEnabled =YES;
        _downView = view;
    }
    return _downView;
}

-(DCCycleScrollView *)YFBannerView
{
    if (!_YFBannerView) {
        NSArray *imageArr = @[@"banner",
                              @"banner",
                              @"banner",
                              @"banner",
                              @"banner"];
        DCCycleScrollView *banner = [DCCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, YF_H(16), WIDTH, YF_H(180)) shouldInfiniteLoop:YES imageGroups:imageArr];
        banner.autoScrollTimeInterval = 4;
        banner.autoScroll = YES;
        banner.isZoom = YES;
        banner.itemSpace = YF_W(7);
        banner.imgCornerRadius = YF_W(8);
        banner.itemWidth = YF_W(320);
        banner.delegate = self;
        _YFBannerView = banner;
    }
    return _YFBannerView;
}
//点击图片的代理
-(void)cycleScrollView:(DCCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"index = %ld",index);
    YFShufflingViewController *YFSystemOfAnnouncementVC=[[YFShufflingViewController alloc]init];
    [[YFTool getCurrentVC].navigationController pushViewController:YFSystemOfAnnouncementVC animated:YES];
}

-(PGGCarouselTextView *)YFTextView
{
    if (!_YFTextView) {
        NSArray *titles = @[@"  "];
        PGGCarouselTextView *Text = [[PGGCarouselTextView alloc] init];
        Text.titles = titles;
        Text.scrollTimeInterval=3;
        Text.backgroundColor = [UIColor clearColor];
        Text.titleColor = YF666;
        Text.delegate = self;
        Text.signImages =nil;
        Text.titleFont = YF_FONT(12);
        _YFTextView = Text;
    }
    return _YFTextView;
}

//PGGCarouselTextViewDelegate
- (void)pggScrollView:(PGGCarouselTextView *)ScrollView didSelectedItemAtIndex:(NSInteger)index{
    NSLog(@"%ld",(long)index);
    YFSystemViewController *YFSystemOfAnnouncementVC=[[YFSystemViewController alloc]init];
    [[YFTool getCurrentVC].navigationController pushViewController:YFSystemOfAnnouncementVC animated:YES];
    
}
-(UIImageView *)theWavesImageView
{
    if (!_theWavesImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image =[UIImage imageNamed:@"homebolangImage"];
        imageView.userInteractionEnabled =YES;
        _theWavesImageView = imageView;
    }
    return _theWavesImageView;
}

-(void)setterBanner:(NSMutableArray *)bannerArray
{
    NSMutableArray *allocArray=[NSMutableArray array];
    
    for (NSInteger i =0; i <bannerArray.count; i++) {
        YFHomePageModel *model=[bannerArray objectAtIndex:i];
        [allocArray addObject:model.href];
    }
 
    
    [_YFBannerView removeFromSuperview];
    _YFBannerView = [DCCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, YF_H(16), WIDTH, YF_H(180)) shouldInfiniteLoop:YES imageGroups:allocArray.mutableCopy];
    //    banner.placeholderImage = [UIImage imageNamed:@"placeholderImage"];
    //    banner.cellPlaceholderImage = [UIImage imageNamed:@"placeholderImage"];
    _YFBannerView.autoScrollTimeInterval = 4;
    _YFBannerView.autoScroll = YES;
    _YFBannerView.isZoom = YES;
    _YFBannerView.itemSpace = YF_W(7);
    _YFBannerView.imgCornerRadius = YF_W(8);
    _YFBannerView.itemWidth = YF_W(320);
    _YFBannerView.delegate = self;
    [self.contentView addSubview:_YFBannerView];
    
        
}

-(void)setterTittle:(NSMutableArray *)tittleArray
{
    
    
    NSMutableArray *allocArray=[NSMutableArray array];
    
    for (NSInteger i =0; i <tittleArray.count; i++) {
        YFHomePageModel *model=[tittleArray objectAtIndex:i];
        [allocArray addObject:[NSString stringWithFormat:@"  %@",model.title]];
    }
   
    
    [_YFTextView removeFromSuperview];
    _YFTextView = [[PGGCarouselTextView alloc] init];
    _YFTextView.titles = allocArray;
    _YFTextView.scrollTimeInterval=3;
    _YFTextView.backgroundColor = [UIColor clearColor];
    _YFTextView.titleColor = YF666;
    _YFTextView.delegate = self;
    _YFTextView.signImages =nil;
    _YFTextView.titleFont = YF_FONT(12);
    [self.contentView addSubview:_YFTextView];
    
    self.YFTextView.sd_layout
    .topSpaceToView(self.contentView, YF_H(196))
    .leftSpaceToView(self.contentView, YF_W(14))
    .widthIs(WIDTH-YF_W(28))
    .heightIs(YF_H(54));
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
