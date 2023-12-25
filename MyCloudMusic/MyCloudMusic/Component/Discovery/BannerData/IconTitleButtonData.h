//
//  IconTitleButtonData.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/24.
//

#import "SuperBase.h"

NS_ASSUME_NONNULL_BEGIN

@interface IconTitleButtonData : SuperBase
@property (nonatomic ,strong)UIImage *icon;
@property (nonatomic ,strong)NSString *title;

+(instancetype)withTile:(NSString *)title iocn:(UIImage *)icon;
@end

NS_ASSUME_NONNULL_END
