//
//  DefaultRepository.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/17.
//

#import <Foundation/Foundation.h>
#import "SuperHttpUtil.h"
#import "Video.h"
#import "Ad.h"
#import "Sheet.h"
#import "Song.h"
NS_ASSUME_NONNULL_BEGIN

@interface DefaultRepository : NSObject

+ (instancetype)shared;

- (void)videoDetail:(NSString *)id success:(SuperHttpSuccess)suceesss;

- (void)videos:(int)page success:(SuperHttpListSuccess)sucess;

- (void)adsWithPosition:(int)position controller:(BaseLogicController *)controller success:(SuperHttpListSuccess)success;

- (void)bannerAdWithController:(BaseLogicController *)controller success:(SuperHttpListSuccess)success;


- (void)sheets:(int)size controller:(nullable BaseLogicController *)controller success:(SuperHttpListSuccess)success;

#pragma mark - 单曲
-(void)songsWithController:(nullable BaseLogicController *)controller success:(SuperHttpListSuccess)success;

@end

NS_ASSUME_NONNULL_END
