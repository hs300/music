//
//  DiscoveryButtonCell.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/24.
//

#import "BaseTableViewCell.h"
#import "ButtonData.h"
NS_ASSUME_NONNULL_BEGIN

static NSString *const DiscoveryBtnCellName = @"DiscoveryBtnCellName";

@interface DiscoveryButtonCell : BaseTableViewCell
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) MyBaseLayout *contentContainer;



- (void)bind:(ButtonData *)data;
@end

NS_ASSUME_NONNULL_END
