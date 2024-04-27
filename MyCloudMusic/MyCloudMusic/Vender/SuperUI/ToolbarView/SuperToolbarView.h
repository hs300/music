//
//  SuperToolbarView.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/31.
//

#import <MyLayout/MyLayout.h>

NS_ASSUME_NONNULL_BEGIN

@interface SuperToolbarView : MyRelativeLayout

@property(nonatomic, strong)UILabel *titleView;
@property(nonatomic, strong)MyLinearLayout *centerContainer;
@property(nonatomic, strong)MyLinearLayout *rightContainer;
@property(nonatomic, strong)MyLinearLayout *leftContainer;

- (SuperToolbarView*)addLeftItem:(UIView *)data;
- (SuperToolbarView*)addRightItem:(UIView *)data;
- (SuperToolbarView*)addcontentItem:(UIView *)data;
@end

NS_ASSUME_NONNULL_END
