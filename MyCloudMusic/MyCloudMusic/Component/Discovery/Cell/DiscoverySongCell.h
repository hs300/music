//
//  DiscoverySongCell.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/31.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

static NSString *const DiscoverySongCellName = @"DiscoverySongCellName";
@interface DiscoverySongCell : BaseTableViewCell

@property(nonatomic, strong)UIImageView *iconView;
@property(nonatomic, strong)UILabel *titleView;
@property(nonatomic, strong)UILabel *infoView;
@property(nonatomic, strong)MyLinearLayout *rightContainer;

-(void)bind:(Song *)data position:(int)position;

@end

NS_ASSUME_NONNULL_END
