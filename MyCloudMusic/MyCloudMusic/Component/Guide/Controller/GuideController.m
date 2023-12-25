//
//  GuideController.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/11.
//

#import "GuideController.h"
#import "Constant.h"
#import <QMUIKit/QMUIKit.h>
#import "ViewFactoryUtil.h"
#import "R.h"
#import <GKCycleScrollView/GKCycleScrollView.h>
#import <GKCycleScrollView/GKPageControl.h>

#import "UIColor+Config.h"
#import "UIColor+Hex.h"
#import "UIColor+Theme.h"
#import "SuperHttpUtil.h"
#import "Video.h";
@interface GuideController ()<GKCycleScrollViewDataSource,GKCycleScrollViewDelegate>
@property(nonatomic, strong)GKCycleScrollView *contentScrollView;
@end

@implementation GuideController

- (void)initViews{
    [super initViews];
    
    [self initLinearLayoutSafeArea];
    
    MyRelativeLayout *bannerContainer = [[MyRelativeLayout alloc] init];
    bannerContainer.myWidth = MyLayoutSize.fill;
    bannerContainer.myHeight = MyLayoutSize.wrap;
    bannerContainer.weight = 1;
    
    [self.container addSubview:bannerContainer];
    
    self.view.backgroundColor = [UIColor whiteColor];
    MyLinearLayout *btnsView = [[MyLinearLayout alloc] initWithOrientation:MyOrientation_Horz];
    btnsView.myBottom = PADDING_LARGE2;
    btnsView.myWidth = MyLayoutSize.fill;
    btnsView.myHeight = MyLayoutSize.wrap;
    btnsView.gravity = MyGravity_Horz_Among;
    [self.container addSubview:btnsView];
    
    QMUIButton *primaryButton = [ViewFactoryUtil primaryButton];
    [primaryButton setTitle:R.string.localizable.loginOrRegister forState:UIControlStateNormal];
    primaryButton.myWidth = BUTTON_WIDTH_MEDDLE;
    [btnsView addSubview:primaryButton];
    
    QMUIButton *enterButton = [ViewFactoryUtil primaryOutlineButton];
    [enterButton setTitle:R.string.localizable.loginOrRegister forState:UIControlStateNormal];
    enterButton.myWidth = BUTTON_WIDTH_MEDDLE;
    [btnsView addSubview:enterButton];
    [enterButton addTarget:self action:@selector(EnterBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    _contentScrollView = [GKCycleScrollView new];
    _contentScrollView.backgroundColor = [UIColor clearColor];
    _contentScrollView.dataSource = self;
    _contentScrollView.delegate = self;
    _contentScrollView.myWidth = MyLayoutSize.fill;
    _contentScrollView.myHeight = MyLayoutSize.fill;
    _contentScrollView.isAutoScroll = NO;
    _contentScrollView.isChangeAlpha = NO;
    _contentScrollView.clipsToBounds = YES;
    [bannerContainer addSubview:_contentScrollView];
    
    GKPageControl *pageControl = [[GKPageControl alloc] init];
    pageControl.userInteractionEnabled = NO;
    pageControl.style = GKPageControlStyleCycle;
    _contentScrollView.pageControl = pageControl;
    
    pageControl.pageIndicatorTintColor = [UIColor black80];
    pageControl.currentPageIndicatorTintColor = [UIColor colorPrimary];
    pageControl.myWidth = MyLayoutSize.fill;
    pageControl.myHeight = 45;
    pageControl.myBottom = 40;
    [bannerContainer addSubview:pageControl];
}



- (void)EnterBtnClicked:(UIButton *)btn{
    NSLog(@"000000");
    NSString *url = @"v1/videos";
    NSDictionary *parameters = @{@"nickname":@"ixuea"};
//    [SuperHttpUtil requestObjectWith:[Video class] url:url parameters:nil cachePolicy:MSCachePolicyOnlyNetNoCache method:MSRequestMethodGET loading:NO controller:nil success:^(BaseResponse * _Nonnull baseResponse, id  _Nonnull data) {
//            NSLog(@"request success %@", data);
//            Video *v1 = (Video *)data;
//            
//        } failure:^(BaseResponse * _Nonnull baseRespones, NSError * _Nonnull error) {
//            NSLog(@"request failure %@  %@", baseRespones, error);
//        }];
//    
//    
//    [SuperHttpUtil requestObjectWith:[Video class] url:url objid:@"98" success:^(BaseResponse * _Nonnull baseResponse, id  _Nonnull data) {
//            NSLog(@"request success %@", data);
//            Video *v1 = (Video *)data;
//        NSLog(@"------%@",v1.title);
//    }];
    
//    [[DefaultRepository shared] videoDetail:@"98" success:^(BaseResponse * _Nonnull baseResponse, id  _Nonnull data) {
//        NSLog(@"request success %@", data);
//        Video *v1 = (Video *)data;
//        NSLog(@"------%@",v1.title);
//    }];
    
//    [SuperHttpUtil requestListObjectWith:[Video class] url:@"v1/videos" parameters:nil success:^(BaseResponse * _Nonnull baseResponse, Meta * _Nonnull meta, NSArray * _Nonnull data) {
//            NSLog(@"res succ %@ %@", meta, data);
//    }];
    
    [[DefaultRepository shared] videos:2 success:^(BaseResponse * _Nonnull baseResponse, Meta * _Nonnull meta, NSArray * _Nonnull data) {
            NSLog(@"xxx");
    }];
}

- (NSInteger)numberOfCellsInCycleScrollView:(GKCycleScrollView *)cycleScrollView{
    return self.datum.count;
}

- (GKCycleScrollViewCell *)cycleScrollView:(GKCycleScrollView *)cycleScrollView cellForViewAtIndex:(NSInteger)index{
    GKCycleScrollViewCell *cell = [cycleScrollView dequeueReusableCell];
    if (!cell) {
        cell = [GKCycleScrollViewCell new];
    }
    UIImage *data = [self.datum objectAtIndex:index];
    cell.imageView.image  = data;
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    return cell;
}

- (void)initDatum{
    [super initDatum];
    self.datum = [NSMutableArray array];
    [self.datum addObject:R.image.guide1];
    [self.datum addObject:R.image.guide2];
    [self.datum addObject:R.image.guide3];
    [self.datum addObject:R.image.guide4];
    [self.datum addObject:R.image.guide5];
    
    [_contentScrollView reloadData];
}

@end

