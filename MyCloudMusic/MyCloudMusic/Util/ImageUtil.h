//
//  ImageUtil.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageUtil : NSObject

+ (void)show:(UIImageView *)view uri:(NSString *)uri;

+ (void)showFull:(UIImageView *)view uri:(NSString *)uri;

@end

NS_ASSUME_NONNULL_END
