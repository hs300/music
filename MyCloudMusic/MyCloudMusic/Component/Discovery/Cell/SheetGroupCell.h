//
//  SheetGroupCell.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/24.
//

#import "BaseTableViewCell.h"
#import "SheetData.h"
#import "ItemTitleView.h"
NS_ASSUME_NONNULL_BEGIN
static NSString *const SheetGroupCellName = @"SheetGroupCellName";

@interface SheetGroupCell : BaseTableViewCell

@property(nonatomic, strong)ItemTitleView *titleView;

@property(nonatomic, strong)UICollectionView *collectionView;
@property(nonatomic, strong)NSMutableArray *datum;


-(void)bind:(SheetData *)data;
@end

NS_ASSUME_NONNULL_END
