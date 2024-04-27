//
//  wngjui.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/17.
//

#import "UIImage+SuperUI.h"

@implementation UIImage (SuperUI)

+ (UIImage *)imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0, 0, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)withTintColor{
    return  [self imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}



@end
