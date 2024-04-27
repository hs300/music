//
//  SuperWebController.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/31.
//

#import "BaseTitleController.h"
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface SuperWebController : BaseTitleController

@property(nonatomic, strong)NSString *myTitle;

@property NSString *uri;

@property NSString *content;

@property(strong, nonatomic)WKWebView *webView;

+ (void)start:(UINavigationController *)controller title:(NSString *)title uri:(NSString *)uri;

+ (void)start:(UINavigationController *)controller title:(NSString *)title content:(NSString *)content;

@end

NS_ASSUME_NONNULL_END
