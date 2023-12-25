//
//  ResourcesUtil.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/19.
//

#import "ResourcesUtil.h"

@implementation ResourcesUtil

+ (NSString *)resourceUri:(NSString *)data{
    return [NSString stringWithFormat:@"%@%@", RESOURCE_ENDPOINT, data];
}

@end
