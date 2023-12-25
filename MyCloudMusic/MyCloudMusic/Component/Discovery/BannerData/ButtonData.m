//
//  ButtonData.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/24.
//

#import "ButtonData.h"
#import "IconTitleButtonData.h"
@implementation ButtonData

- (NSMutableArray *)datum{
    if (!_datum) {
        _datum = [[NSMutableArray alloc] init];
        [_datum addObject:[IconTitleButtonData withTile:R.string.localizable.dayRecommend iocn:R.image.dayRecommend]];
        [_datum addObject:[IconTitleButtonData withTile:R.string.localizable.personFm iocn:R.image.personFm]];
        [_datum addObject:[IconTitleButtonData withTile:R.string.localizable.sheet iocn:R.image.sheet]];
        [_datum addObject:[IconTitleButtonData withTile:R.string.localizable.rank iocn:R.image.rank]];
        [_datum addObject:[IconTitleButtonData withTile:R.string.localizable.live iocn:R.image.live]];
        [_datum addObject:[IconTitleButtonData withTile:R.string.localizable.digitalAlbum iocn:R.image.digitalAlbum]];
        [_datum addObject:[IconTitleButtonData withTile:R.string.localizable.digitalAlbum iocn:R.image.digitalAlbum]];
    }
    
    return _datum;
}

@end
