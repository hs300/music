//
//  SuperWebController.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/31.
//

#import "SuperWebController.h"

@interface SuperWebController ()

@end

@implementation SuperWebController

- (void)initViews{
    [super initViews];
    [self initRelativeLayoutSafeArea];
    
    self.webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:[SuperWebController defaultConfiguration]];
    
    self.webView.myWidth = MyLayoutSize.fill;
    self.webView.myHeight = MyLayoutSize.fill;
    [self.container addSubview:self.webView];
    
    //[self addri]
}


+ (void)start:(UINavigationController *)controller title:(NSString *)title uri:(NSString *)uri{
    
}

+ (void)start:(UINavigationController *)controller title:(NSString *)title content:(NSString *)content{
    
}

+ (WKWebViewConfiguration *)defaultConfiguration{
    WKWebViewConfiguration *configuration = [WKWebViewConfiguration new];
    
    if([configuration respondsToSelector:@selector(setAllowsInlineMediaPlayback:)]){
        [configuration setAllowsInlineMediaPlayback:YES];
    }
    
   
    
    return configuration;
}

@end
