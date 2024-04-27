//
//  Song.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/31.
//

#import "SuperCommon.h"
#import "User.h"
NS_ASSUME_NONNULL_BEGIN

@interface Song : SuperCommon
@property(nonatomic, strong)NSString *title;
@property(nonatomic, strong)NSString *icon;
@property(nonatomic, strong)NSString *uri;
@property(nonatomic, assign)int clicksCount;
@property(nonatomic, assign)int commentsCount;
@property(nonatomic, assign)int style;

@property(nonatomic, strong)User *user;
@property(nonatomic, strong)User *singer;

@end

NS_ASSUME_NONNULL_END
