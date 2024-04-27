//
//  ViewFactoryUtil.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/10.
//

#import "ViewFactoryUtil.h"
#import "Constant.h"
#import "UIColor+Config.h"
#import "UIColor+Theme.h"
@implementation ViewFactoryUtil
+ (QMUIButton *)primaryHalfFillBtn{
    QMUIButton *re = [self primaryButton];
    re.layer.cornerRadius = BUTTON_MEDDLE_REDIUD;
    return re;
}

+ (QMUIButton *)primaryButton{
    QMUIButton *re = [[QMUIButton alloc] init];
    re.adjustsTitleTintColorAutomatically = NO;
    re.adjustsButtonWhenHighlighted = YES;
    re.titleLabel.font = UIFontMake(TEXT_LARGE);
    re.myWidth = MyLayoutSize.fill;
    re.myHeight = BUTTON_MEDDLE;
    re.backgroundColor = [UIColor primaryColor];
    re.layer.cornerRadius = SMALL_RADIUS;
    re.tintColor = [UIColor colorLightWhite];
    [re setTitleColor:[UIColor colorLightWhite] forState:UIControlStateNormal];
    return re;
}

+ (QMUIButton *)linkButton{
    QMUIButton *re = [[QMUIButton alloc] init];
    re.adjustsTitleTintColorAutomatically = NO;
    re.titleLabel.font = UIFontMake(14);
    return re;
}

+ (QMUIButton *)primaryOutlineButton{
    QMUIButton *re = [self primaryButton];
  
    re.layer.cornerRadius = SMALL_RADIUS;
    re.layer.borderWidth = 1;
    re.layer.borderColor = [[UIColor black130] CGColor] ;
    re.backgroundColor = [UIColor clearColor];
    [re setTitleColor:[UIColor colorPrimary] forState:UIControlStateNormal];
    return re;
}

+ (UITableView *)tabelView{
    QMUITableView *result = [[QMUITableView alloc] init];
    result.backgroundColor = [UIColor clearColor];
    result.tableFooterView = [[UIView alloc] init];
    result.separatorStyle = UITableViewCellSeparatorStyleNone;
    result.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    result.myWidth = MyLayoutSize.fill;
    result.myHeight = MyLayoutSize.fill;
    
    result.rowHeight = UITableViewAutomaticDimension;
    result.estimatedRowHeight = UITableViewAutomaticDimension;
    [result setShowsVerticalScrollIndicator:NO];
    result.allowsSelection = YES;
    return result;
}

+ (UICollectionView *)collectionView{
    UICollectionView *result = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[self collectionViewFlowLayout]];
    result.backgroundColor = [UIColor clearColor];
    [result setShowsVerticalScrollIndicator:NO];
    [result setShowsHorizontalScrollIndicator:NO];
    [result setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    result.myWidth = MyLayoutSize.fill;
    result.myHeight = MyLayoutSize.fill;
    return result;
}

+ (UICollectionViewFlowLayout *)collectionViewFlowLayout{
    UICollectionViewFlowLayout *result = [UICollectionViewFlowLayout new];
    result.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    result.scrollDirection = UICollectionViewScrollDirectionVertical;
    result.minimumLineSpacing = 0;
    result.minimumInteritemSpacing = 0;
    return result;
}

@end
