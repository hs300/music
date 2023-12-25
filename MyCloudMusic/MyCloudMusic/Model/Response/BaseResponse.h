//
//  BaseResponse.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseResponse : NSObject
@property(nonatomic, assign) int status;
@property(nonatomic, strong) NSString *message;

@end

NS_ASSUME_NONNULL_END
