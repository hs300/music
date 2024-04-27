//
//  SuperHttpUtil.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/17.
//

#import "SuperHttpUtil.h"

@implementation SuperHttpUtil

+ (void)requestObjectWith:(Class)clazz
                      url:(NSString *)url
               parameters:(nullable NSDictionary *)parameters
              cachePolicy:(MSCachePolicy)cachePolicy
                   method:(MSRequestMethod)method
                  loading:(BOOL)loading
               controller:(BaseController *)controller
                  success:(SuperHttpSuccess)seccess
                  failure:(SuperHttpFail)failure{
    
    
    [self checkShowLoading:loading];
    
    [self preProcess:controller];
    
    [self requestWithMethod:method url:url parameters:parameters catchPolicy:cachePolicy success:^(id  _Nonnull data) {
        BaseResponse *baseResponse = [[BaseResponse class] mj_objectWithKeyValues:data];
        if ([self isSuccessWithResponse:baseResponse]) {
            id dataDict = data[@"data"];
            id result = [clazz mj_objectWithKeyValues:dataDict];
            seccess(baseResponse, result);
        }
        else{
            [self handlerResponse:baseResponse error:nil failure:failure placeholder:nil];
        }
        
    } failure:^(NSError * _Nonnull error) {
        [self handlerResponse:nil error:error failure:failure placeholder:nil];
        }];
    
    [self checkHideLoading:loading];
}

+(void)checkShowLoading:(BOOL)loading{
    
}

+(void)checkHideLoading:(BOOL)loading{
    
}

+(void)preProcess:(BaseController *)controller{
    
}

+(BOOL)isSuccessWithResponse:(BaseResponse *)data{
    return data.status == 0;
}

+(void)handlerResponse:(BaseResponse *)baseResponse error:(NSError *)error failure:(SuperHttpFail)failure placeholder:(UIView *)placeholder{
    
}

+(void)requestWithMethod:(MSRequestMethod)method url:(NSString *)url parameters:(NSDictionary *)parameters catchPolicy:(MSCachePolicy)catchPolicy success:(MSHttpSuccess)success failure:(MSHttpFail)failure{
    
    if(true){
        //NSString *session = @"";
        
    }
    
    [MSNetwork HTTPWithMethod:method url:url parameters:parameters headers:nil cachePolicy:catchPolicy success:^(id  _Nonnull responseObject) {
            success(responseObject);
        } failure:^(NSError * _Nonnull error) {
            failure(error);
        }];
}

+ (void)requestObjectWith:(Class)clazz url:(NSString *)url objid:(NSString *)oid success:(SuperHttpSuccess)success{
    NSString *ta = [NSString stringWithFormat:@"%@/%@", url, oid];
    //[NSString stringWithFormat:@"%@/%@",url,id]
    [self requestObjectWith:clazz url:ta parameters:nil cachePolicy:MSCachePolicyOnlyNetNoCache method:MSRequestMethodGET loading:NO controller:nil success:success failure:nil];
}

+ (void)requestListObjectWith:(Class)clazz url:(NSString *)url parameters:(NSDictionary *)parameters cachePolicy:(MSCachePolicy)cachePolicy loading:(BOOL)loading controller:(BaseLogicController *)controller success:(SuperHttpListSuccess)success failure:(SuperHttpFail)failure{
    
    [self preProcess:controller];
    
    [self requestWithMethod:MSRequestMethodGET url:url parameters:parameters catchPolicy:cachePolicy success:^(id  _Nonnull data) {
        BaseResponse *baseResponse = [[BaseResponse class] mj_objectWithKeyValues:data];
        if ([self isSuccessWithResponse:baseResponse]) {
            id dataDict = data[@"data"];
            id meta = [[Meta class] mj_objectWithKeyValues:dataDict];
            id result = [clazz mj_objectArrayWithKeyValuesArray:dataDict[@"data"]];
            success(data, meta, result);
        }else{
            [self handlerResponse:data error:nil failure:failure placeholder:nil];
        }
        
    } failure:^(NSError * _Nonnull error) {
            [self handlerResponse:nil error:error failure:failure placeholder:nil];
        }];
}

+ (void)requestListObjectWith:(Class)clazz url:(NSString *)url parameters:(NSDictionary *)parameters success:(SuperHttpListSuccess)success{
    [self requestListObjectWith:clazz url:url parameters:parameters cachePolicy:MSCachePolicyOnlyNetNoCache loading:NO controller:nil success:success failure:^(BaseResponse * _Nonnull baseRespones, NSError * _Nonnull error) {
            NSLog(@"");
    }];
}

#pragma mark - 请求列表
+ (void)requestListObjectWith:(Class)clazz url:(NSString *)url parameters:(nullable NSDictionary *)parameters cachePolicy:(MSCachePolicy)cachePolicy controller:(nullable BaseLogicController *)controller success:(SuperHttpListSuccess)success{
    [self requestListObjectWith:clazz url:url parameters:parameters cachePolicy:cachePolicy loading:NO controller:controller success:success failure:nil];
}

@end
