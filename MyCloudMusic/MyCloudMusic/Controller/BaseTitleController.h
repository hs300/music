//
//  BaseTitleController.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/31.
//

#import "BaseLogicController.h"
#import "SuperToolbarView.h"
NS_ASSUME_NONNULL_BEGIN

@interface BaseTitleController : BaseLogicController
@property(nonatomic, strong)SuperToolbarView *toolbarView;

- (BOOL)isAddToolBar;

- (void)initToolbar;

- (SuperToolbarView*)addLeftItem:(UIView *)data;
- (SuperToolbarView*)addRightItem:(UIView *)data;
- (SuperToolbarView*)addcontentItem:(UIView *)data;

@end

NS_ASSUME_NONNULL_END
