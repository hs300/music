//
//  Ad.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/19.
//

#import "SuperCommon.h"

NS_ASSUME_NONNULL_BEGIN

@interface Ad : SuperCommon

@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *icon;
@property (nonatomic, strong)NSString *uri;
@property (nonatomic, assign)Byte style;

@end

NS_ASSUME_NONNULL_END
