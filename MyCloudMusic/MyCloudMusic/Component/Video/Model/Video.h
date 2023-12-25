//
//  Video.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/17.
//

#import "SuperCommon.h"

NS_ASSUME_NONNULL_BEGIN

@interface Video : SuperCommon
@property(nonatomic, strong)NSString *title;
@property(nonatomic, strong)NSString *uri;
@property(nonatomic, strong)NSString *icon;
@property(nonatomic, assign)int duration;
@property(nonatomic, assign)int width;
@property(nonatomic, assign)int height;
@property(nonatomic, assign)int clicksCount;
@property(nonatomic, assign)int commentsCount;
@end

NS_ASSUME_NONNULL_END
