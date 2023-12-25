//
//  BaseTableViewCell.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewCell : UITableViewCell
@property (nonatomic, strong)MyBaseLayout *container;
- (void)initView;
- (void)initDatum;
- (void)initListeners;
- (MyOrientation)getContainerOrientation;

@end

NS_ASSUME_NONNULL_END
