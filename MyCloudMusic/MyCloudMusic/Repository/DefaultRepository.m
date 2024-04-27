//
//  DefaultRepository.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/17.
//

#import "DefaultRepository.h"

@implementation DefaultRepository

+(instancetype)shared{
    static DefaultRepository *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DefaultRepository alloc] init];
    });
    return instance;
}

-(void)videoDetail:(NSString *)oid success:(SuperHttpSuccess)suceesss{
    [SuperHttpUtil requestObjectWith:[Video class] url:URL_VIDEO objid:oid success:^(BaseResponse * _Nonnull baseResponse, id  _Nonnull data) {
        suceesss(baseResponse, data);
    }];
}

-(void)videos:(int)page success:(SuperHttpListSuccess)sucess{
    [SuperHttpUtil requestListObjectWith:[Video class] url:URL_VIDEO parameters:@{@"page":[NSNumber numberWithInt:page]} success:sucess];
}

- (void)adsWithPosition:(int)position controller:(BaseLogicController *)controller success:(SuperHttpListSuccess)success{
    NSDictionary *para = @{@"position": [NSNumber numberWithInt:position]};
    [SuperHttpUtil requestListObjectWith:[Ad class] url:URL_AD parameters:para success:success];
    
}

- (void)bannerAdWithController:(BaseLogicController *)controller success:(SuperHttpListSuccess)success{
    [self adsWithPosition:0 controller:controller success:success];
}

#pragma mark - 歌单
-(void)sheets:(int)size controller:(nullable BaseLogicController *)controller success:(SuperHttpListSuccess)success{
    [SuperHttpUtil requestListObjectWith:[Sheet class] url:URL_SHEET parameters:@{@"size":[NSNumber numberWithInt:size]} success:success];
}


#pragma mark - 单曲
-(void)songsWithController:(nullable BaseLogicController *)controller success:(SuperHttpListSuccess)success{
    [SuperHttpUtil requestListObjectWith:[Song class] url:URL_SONG parameters:nil cachePolicy:MSCachePolicyNetElseCache controller:controller success:success];
}




@end
