//
//  ViewFactoryUtil.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/10.
//

#import <Foundation/Foundation.h>
#import <QMUIKit/QMUIKit.h>
#import "MyLayout/MyLayout.h"
NS_ASSUME_NONNULL_BEGIN

@interface ViewFactoryUtil : NSObject

+ (QMUIButton *)primaryHalfFillBtn;

+ (QMUIButton *)primaryButton;

+ (QMUIButton *)linkButton;

+ (QMUIButton *)primaryOutlineButton;

+ (UITableView *)tabelView;

+ (UICollectionView *)collectionView;

+ (UICollectionViewFlowLayout *)collectionViewFlowLayout;
@end

NS_ASSUME_NONNULL_END
