//
//  BaseCollectionViewCell.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong)MyBaseLayout *container;
- (void)initView;
- (void)initDatum;
- (void)initListeners;
- (MyOrientation)getContainerOrientation;



@end

NS_ASSUME_NONNULL_END
