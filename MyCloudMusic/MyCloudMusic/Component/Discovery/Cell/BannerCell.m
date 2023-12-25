//
//  BannerCell.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/19.
//

#import "BannerCell.h"
#import "Ad.h"
#import <SDWebImage/SDWebImage.h>
#import "BanerClickEvent.h"
@implementation BannerCell

- (void)initView{
    [super initView];
    self.container.backgroundColor = [UIColor greenColor];
    self.contentView.backgroundColor = [UIColor greenColor];
    
    self.container.padding = UIEdgeInsetsMake(16, 16, 0, 16);
    
    MyRelativeLayout *bannerContainer = [MyRelativeLayout new];
    bannerContainer.myWidth = MyLayoutSize.fill;
    bannerContainer.myHeight = SCREEN_WIDTH * 0.389;
    [self.container addSubview:bannerContainer];
    
    _contentScrollView = [GKCycleScrollView new];
    _contentScrollView.backgroundColor = [UIColor clearColor];
    _contentScrollView.dataSource = self;
    _contentScrollView.delegate = self;
    _contentScrollView.myHeight = MyLayoutSize.fill;
    _contentScrollView.myWidth = MyLayoutSize.fill;
    //_contentScrollView.isAutoScroll = NO;
    _contentScrollView.isChangeAlpha = NO;
    _contentScrollView.clipsToBounds = YES;
    [bannerContainer addSubview:_contentScrollView];
    
    GKPageControl *pageController = [[GKPageControl alloc] init];
    pageController.userInteractionEnabled = YES;
    pageController.style = GKPageControlStyleCycle;
    _contentScrollView.pageControl = pageController;
    pageController.pageIndicatorTintColor = [UIColor black80];
    pageController.currentPageIndicatorTintColor = [UIColor colorPrimary];
    pageController.myWidth = MyLayoutSize.fill;
    pageController.myHeight = 15;
    pageController.myBottom = 40;
    [bannerContainer addSubview:pageController];
    
}

- (void)initDatum{
    [super initDatum];
    self.datum = [NSMutableArray array];
    
}

- (void)bind:(BannerData *)data{
    [self.datum removeAllObjects];
    [self.datum addObjectsFromArray:data.data];
    [self.contentScrollView reloadData];
}

- (NSInteger)numberOfCellsInCycleScrollView:(GKCycleScrollView *)cycleScrollView{
    return self.datum.count;
}



- (GKCycleScrollViewCell *)cycleScrollView:(GKCycleScrollView *)cycleScrollView cellForViewAtIndex:(NSInteger)index{
    GKCycleScrollViewCell *cell = [cycleScrollView dequeueReusableCell];
    if (cell == nil) {
        cell = [GKCycleScrollViewCell new];
        
    }
    
    Ad *data = [self.datum objectAtIndex:index];
    NSString *uri = [ResourcesUtil resourceUri:data.icon];
    [cell.imageView sd_setImageWithURL: [NSURL URLWithString:uri]];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    return cell;
    //cell.imageView =
}

- (void)cycleScrollView:(GKCycleScrollView *)cycleScrollView didSelectCellAtIndex:(NSInteger)index{
    BanerClickEvent *event = [[BanerClickEvent alloc] init];
    event.data = self.datum[index];
    [QTEventBus.shared dispatch:event];
}

@end
