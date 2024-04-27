//
//  SongGroupCell.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/31.
//

#import "BaseTableViewCell.h"
#import "ItemTitleView.h"
#import "SongData.h"
NS_ASSUME_NONNULL_BEGIN

static NSString *const SongGroupCellName = @"SongGroupCellName";

@interface SongGroupCell : BaseTableViewCell
@property(nonatomic, strong) ItemTitleView *titleView;
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *datum;

-(void)bind:(SongData *)data;

@end

NS_ASSUME_NONNULL_END
