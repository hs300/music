//
//  UIColor+SuperUI.m
//  MyCloudMusic
//
//  Created by smile on 2022/2/20.
//

#import "UIColor+SuperUI.h"

@implementation UIColor (SuperUI)
+ (UIColor *)withColor:(UIColor *)color darkColor:(UIColor *)darkColor{
    if (@available(iOS 13.0, *)) {
        //13及以上版本
        
        //创建动态颜色
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            return traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark ? darkColor : color;
        }];
    }else{
        //用浅色
        return color;
    }

}
@end
