//
//  UIColor+Hex.m
//  MyCloudMusic
//
//  Created by smile on 2022/2/20.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *)colorWithHex:(int)hex{
    return [UIColor colorWithRed:(((hex & 0xFF0000) >> 16))/255.0 green:(((hex &0xFF00) >>8))/255.0 blue:((hex &0xFF))/255.0 alpha:(((hex &0xFF000000) >>24))/255.0];
}

@end
