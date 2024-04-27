//
//  SheetCell.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/30.
//

#import "BaseCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

static NSString *const SheetCellName = @"SheetCellName";

@interface SheetCell : BaseCollectionViewCell

@property(nonatomic, strong)UIImageView *iconView;

@property(nonatomic, strong)UILabel *titleView;

-(void)bind:(Sheet *)data;

@end

NS_ASSUME_NONNULL_END
