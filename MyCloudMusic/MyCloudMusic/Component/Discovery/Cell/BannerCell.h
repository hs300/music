//
//  BannerCell.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/19.
//

#import "BaseTableViewCell.h"
#import "BannerData.h"
#import <GKCycleScrollView/GKCycleScrollView.h>
#import <GKCycleScrollView/GKPageControl.h>

NS_ASSUME_NONNULL_BEGIN
static NSString *const BannerCellName = @"BannerCellName";

@interface BannerCell : BaseTableViewCell<GKCycleScrollViewDelegate, GKCycleScrollViewDataSource>

@property(nonatomic, strong)GKCycleScrollView *contentScrollView;
@property(nonatomic, strong)NSMutableArray *datum;
- (void)bind:(BannerData *)data;


@end

NS_ASSUME_NONNULL_END
