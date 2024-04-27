//
//  ImageUtil.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/30.
//

#import "ImageUtil.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation ImageUtil

+ (void)show:(UIImageView *)view uri:(NSString *)uri{
    if (uri == nil || [uri isEqual:@""]) {
        view.image = R.image.placeholder;
        return;
    }
    uri = [ResourcesUtil resourceUri:uri];
    [self showFull:view uri:uri];
    
}

+ (void)showFull:(UIImageView *)view uri:(NSString *)uri{
    [view sd_setImageWithURL:[NSURL URLWithString:uri] placeholderImage:R.image.placeholder];
}

@end
