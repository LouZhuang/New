//
//  YFLaunchIntroductionView.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/24.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFLaunchIntroductionView.h"
static NSString *const kAppVersion = @"appVersion";

@interface YFLaunchIntroductionView ()<UIScrollViewDelegate>
{
    UIScrollView  *launchScrollView;
    UIPageControl *page;
}

@end
@implementation YFLaunchIntroductionView
NSArray *images;
BOOL isScrollOut;//在最后一页再次滑动是否隐藏引导页
CGRect enterBtnFrame;
NSString *enterBtnImage;
static YFLaunchIntroductionView *launch = nil;
NSString *storyboard;

#pragma mark - 创建对象-->>带button
+(instancetype)sharedWithImages:(NSArray *)imageNames buttonImage:(NSString *)buttonImageName buttonFrame:(CGRect)frame{
    images = imageNames;
    isScrollOut = NO;
    enterBtnFrame = frame;
    enterBtnImage = buttonImageName;
    launch = [[YFLaunchIntroductionView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    launch.backgroundColor = [UIColor whiteColor];
    return launch;
}
#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addObserver:self forKeyPath:@"currentColor" options:NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:@"nomalColor" options:NSKeyValueObservingOptionNew context:nil];
        if ([self isFirstLauch]) {
            UIStoryboard *story;
            if (storyboard) {
                story = [UIStoryboard storyboardWithName:storyboard bundle:nil];
            }
            UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
            if (story) {
                UIViewController * vc = story.instantiateInitialViewController;
                window.rootViewController = vc;
                [vc.view addSubview:self];
            }else {
                [window addSubview:self];
            }
            [self addImages];
        }else{
            [self removeFromSuperview];
        }
    }
    return self;
}
#pragma mark - 判断是不是首次登录或者版本更新
-(BOOL )isFirstLauch{
    //获取当前版本号
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentAppVersion = infoDic[@"CFBundleShortVersionString"];
    //获取上次启动应用保存的appVersion
    NSString *version = [[NSUserDefaults standardUserDefaults] objectForKey:kAppVersion];
    //版本升级或首次登录
    if (version == nil || ![version isEqualToString:currentAppVersion]) {
        [[NSUserDefaults standardUserDefaults] setObject:currentAppVersion forKey:kAppVersion];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return YES;
    }else{
        return NO;
    }
}
#pragma mark - 添加引导页图片
-(void)addImages{
    [self createScrollView];
}
#pragma mark - 创建滚动视图
-(void)createScrollView{
    launchScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    launchScrollView.showsHorizontalScrollIndicator = NO;
    launchScrollView.bounces = NO;
    launchScrollView.pagingEnabled = YES;
    launchScrollView.delegate = self;
    launchScrollView.contentSize = CGSizeMake(WIDTH * images.count, HEIGHT);
    [self addSubview:launchScrollView];
    for (int i = 0; i < images.count; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * WIDTH, 0, WIDTH, HEIGHT)];
        imageView.image = [UIImage imageNamed:images[i]];
        [launchScrollView addSubview:imageView];
        if (i == images.count - 1) {
            //判断要不要添加button
            if (!isScrollOut) {
                UIButton *enterButton = [[UIButton alloc] initWithFrame:CGRectMake(enterBtnFrame.origin.x, enterBtnFrame.origin.y, enterBtnFrame.size.width, enterBtnFrame.size.height)];
                [enterButton setImage:[UIImage imageNamed:enterBtnImage] forState:UIControlStateNormal];
                [enterButton addTarget:self action:@selector(enterBtnClick) forControlEvents:UIControlEventTouchUpInside];
                [imageView addSubview:enterButton];
                imageView.userInteractionEnabled = YES;
            }
        }
    }
    page = [[UIPageControl alloc] initWithFrame:CGRectMake(0, HEIGHT - YF_H(30), WIDTH, YF_H(30))];
    page.numberOfPages = images.count;
    page.backgroundColor = [UIColor clearColor];
    page.currentPage = 0;
    page.defersCurrentPageDisplay = YES;
    [self addSubview:page];
}
#pragma mark - 进入按钮
-(void)enterBtnClick{
    [self hideGuidView];
}
#pragma mark - 隐藏引导页
-(void)hideGuidView{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self removeFromSuperview];
        });
        
    }];
}
#pragma mark - scrollView Delegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    int cuttentIndex = (int)(scrollView.contentOffset.x + WIDTH/2)/WIDTH;
    if (cuttentIndex == images.count - 1) {
        if ([self isScrolltoLeft:scrollView]) {
            if (!isScrollOut) {
                return ;
            }
            [self hideGuidView];
        }
    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == launchScrollView) {
        int cuttentIndex = (int)(scrollView.contentOffset.x + WIDTH/2)/WIDTH;
        page.currentPage = cuttentIndex;
    }
}
#pragma mark - 判断滚动方向
-(BOOL )isScrolltoLeft:(UIScrollView *) scrollView{
    //返回YES为向左反动，NO为右滚动
    if ([scrollView.panGestureRecognizer translationInView:scrollView.superview].x < 0) {
        return YES;
    }else{
        return NO;
    }
}
#pragma mark - KVO监测值的变化
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"currentColor"]) {
        page.currentPageIndicatorTintColor = self.currentColor;
    }
    if ([keyPath isEqualToString:@"nomalColor"]) {
        page.pageIndicatorTintColor = self.nomalColor;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
