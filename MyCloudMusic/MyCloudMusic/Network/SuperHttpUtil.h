//
//  SuperHttpUtil.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/17.
//

#import <Foundation/Foundation.h>
#import "BaseLogicController.h"
#import "BaseResponse.h"
#import "Meta.h"
#import <MJExtension/MJExtension.h>
NS_ASSUME_NONNULL_BEGIN

@interface SuperHttpUtil : NSObject
typedef void(^SuperHttpSuccess)(BaseResponse *baseResponse, id data);
typedef void(^SuperHttpListSuccess)(BaseResponse *baseResponse, Meta *meta, NSArray *data);


typedef void(^SuperHttpFail)(BaseResponse *baseRespones, NSError *error);

+ (void)requestObjectWith:(Class)clazz
                      url:(NSString *)url
               parameters:(nullable NSDictionary *)parameters
              cachePolicy:(MSCachePolicy)cachePolicy
                   method:(MSRequestMethod)method
                  loading:(BOOL)loading
               controller:(BaseController *)controller
                  success:(SuperHttpSuccess)seccess
                  failure:(SuperHttpFail)failure;
+ (void)requestObjectWith:(Class)clazz url:(NSString *)url objid:(NSString *)oid success:(SuperHttpSuccess)success;


+ (void)requestListObjectWith:(Class)clazz url:(NSString *)url parameters:(NSDictionary *)parameters cachePolicy:(MSCachePolicy)cachePolicy loading:(BOOL)loading controller:(BaseLogicController *)controller success:(SuperHttpListSuccess)success failure:(SuperHttpFail)failure;

+ (void)requestListObjectWith:(Class)clazz url:(NSString *)url parameters:(NSDictionary *)parameters success:(SuperHttpListSuccess)success;


#pragma mark - 请求列表
+ (void)requestListObjectWith:(Class)clazz url:(NSString *)url parameters:(nullable NSDictionary *)parameters cachePolicy:(MSCachePolicy)cachePolicy controller:(nullable BaseLogicController *)controller success:(SuperHttpListSuccess)success;

@end



NS_ASSUME_NONNULL_END
