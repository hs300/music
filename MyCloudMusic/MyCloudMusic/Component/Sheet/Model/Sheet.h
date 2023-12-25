//
//  Sheet.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/24.
//

#import "SuperCommon.h"

NS_ASSUME_NONNULL_BEGIN

@interface Sheet : SuperCommon

@property(nonatomic, strong)NSString *title;
@property(nonatomic, strong)NSString *icon;
@property(nonatomic, assign)int clicksCount;
@property(nonatomic, assign)int coolectsCount;
@property(nonatomic, assign)int commentsCount;
@property(nonatomic, assign)int songsCount;

@end

NS_ASSUME_NONNULL_END
