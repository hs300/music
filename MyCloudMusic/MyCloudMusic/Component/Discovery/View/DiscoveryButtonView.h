//
//  DiscoveryButtonView.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/24.
//

#import <MyLayout/MyLayout.h>

NS_ASSUME_NONNULL_BEGIN

@interface DiscoveryButtonView : MyLinearLayout
@property (nonatomic ,strong) UIImageView *iconView;
@property (nonatomic ,strong) UILabel *titleView;
@property (nonatomic ,strong) UILabel *tipView;

- (void)showWithTitle:(NSString *)title icon:(UIImage *)icon;
@end

NS_ASSUME_NONNULL_END
