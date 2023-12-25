//
//  IconTitleButtonData.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/24.
//

#import "IconTitleButtonData.h"

@implementation IconTitleButtonData

+(instancetype)withTile:(NSString *)title iocn:(UIImage *)icon{
    IconTitleButtonData *re = [IconTitleButtonData new];
    re.title = title;
    re.icon = icon;
    return re;
}
@end
